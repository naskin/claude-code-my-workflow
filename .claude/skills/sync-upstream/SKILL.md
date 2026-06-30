---
name: sync-upstream
description: Curated sync of this fork with its upstream template (pedrohcgs/claude-code-my-workflow) — pull the *relevant* new commits while leaving your big customizations intact. Use when the user says "sync with upstream", "update my fork from Pedro's repo", "pull the latest template changes", "check what's new upstream", or runs the periodic alignment task. Does NOT do a blind `git merge` (which would resurrect deleted subsystems and cause mass conflicts); instead it categorizes upstream's changes and pulls only what you pick, per-path.
argument-hint: "[--dry-run to only show the menu] [--remote upstream]"
allowed-tools: ["Read", "Bash", "Edit", "AskUserQuestion"]
effort: high
---

# /sync-upstream — Curated alignment with the upstream template

Bring in the relevant new work from the upstream template (`pedrohcgs/claude-code-my-workflow`) **without** clobbering the edits that make this fork yours. This fork has diverged in *purpose* (it deleted subsystems upstream keeps developing), so a plain `git merge upstream/main` is the wrong tool — it resurrects deleted files and produces dozens of conflicts. This skill replaces that with a per-file curated pull.

## Core principle

> **Pull additively, by path. Never blind-merge. Always protect the customized docs.**

Three file classes drive every decision:
- **Safe to pull** — files upstream changed that *you never touched*. The bulk; low risk.
- **Conflict surface** — files *both* sides changed. Default: keep yours, list for manual review.
- **Deleted-by-you / modified-upstream** — the trap. Default: skip (do not resurrect).

**Always-protected (never overwrite unless the user explicitly opts in):** `CLAUDE.md`, `MEMORY.md`, `.claude/settings.json`, `README.md`.

**Skipped-by-default bundles:** the teaching subsystem (`syllabus`, `teach-from-paper`, `scaffold-exercises`) and repo infrastructure (`.github/`, `.githooks/`, `.vscode/`, `CHANGELOG.md`, `CITATION.cff`, `CONTRIBUTING.md`, `TROUBLESHOOTING.md`) — and anything under the Quarto/Beamer/lecture machinery this fork removed.

## Instructions

### Step 1 — Ensure the upstream remote and fetch

```bash
git remote get-url upstream 2>/dev/null || \
  git remote add upstream https://github.com/pedrohcgs/claude-code-my-workflow.git
git fetch upstream
```
Work on the fork's `main` (or current branch). Confirm the working tree is clean (`git status --short`); if not, stop and tell the user to commit/stash first.

### Step 2 — Measure the divergence

```bash
BASE=$(git merge-base HEAD upstream/main)
echo "merge-base: $BASE"
echo "upstream commits not in mine: $(git rev-list --count HEAD..upstream/main)"
git diff --name-only $BASE HEAD            > /tmp/yours.txt   # files I changed since base
git diff --name-only $BASE upstream/main   > /tmp/theirs.txt  # files upstream changed since base
sort -o /tmp/yours.txt  /tmp/yours.txt
sort -o /tmp/theirs.txt /tmp/theirs.txt
```
If the upstream-commit count is 0, report "already aligned" and stop.

### Step 3 — Categorize

```bash
comm -13 /tmp/yours.txt /tmp/theirs.txt > /tmp/safe.txt    # upstream-only changed → safe to pull
comm -12 /tmp/yours.txt /tmp/theirs.txt > /tmp/both.txt    # both changed → conflict surface (review)
echo "safe: $(wc -l < /tmp/safe.txt) | conflict-surface: $(wc -l < /tmp/both.txt)"
```
From `/tmp/safe.txt`, build the **pull candidate list** by removing the always-protected files and the skipped-by-default bundles (teaching, repo infra, Quarto/Beamer paths). Group the remainder by capability: skills / agents / rules / scripts / templates / references / hooks / other.

Also scan `/tmp/both.txt` for any files worth a *manual* look (e.g. a rule you lightly edited but upstream improved) — list them but do not auto-pull.

### Step 4 — Present the menu and get choices

Show the grouped candidate list with counts and a one-line gloss per group (read a few `SKILL.md` descriptions if helpful). Use `AskUserQuestion` (multiSelect) to let the user pick which bundles/capabilities to pull. Note in the menu which groups are skipped by default and why. If `--dry-run` was passed, stop here after printing the menu.

### Step 5 — Pull the picks onto a review branch

```bash
MONTH=$(git show -s --format=%cd --date=format:%Y-%m HEAD)   # avoid Date.now(); derive from a commit
git checkout -b sync-upstream-$MONTH        # or a name the user prefers
git checkout upstream/main -- $(cat /tmp/pull_list.txt)      # pull_list = the user's selected paths
```
Per-path checkout only adds/updates the chosen files; it never touches the protected docs or untracked content. After checkout, verify none of the always-protected files got staged:
```bash
git diff --cached --name-only | grep -E '^(CLAUDE\.md|MEMORY\.md|README\.md|\.claude/settings\.json)$' \
  && echo "WARNING: protected file staged — unstage it" || echo "protected docs untouched ✓"
```

### Step 6 — New hooks: offer to wire them

If any pulled file under `.claude/hooks/` is **new** (not previously present) and not yet referenced in `.claude/settings.json`, surface it and offer to add the registration (mirror how `upstream/main:.claude/settings.json` wires it), merging into the user's settings rather than overwriting. Validate the JSON afterward (`python3 -c "import json,sys; json.load(open('.claude/settings.json'))"`).

### Step 7 — Commit, summarize, hand off

```bash
git add <the pulled paths and any settings.json edit>
git commit -m "Sync relevant upstream additions ($MONTH)"
```
Summarize: how many files pulled, which bundles, which conflict-surface files the user should review manually, and any new hooks wired. Tell the user to review the branch and merge when satisfied (`git checkout main && git merge sync-upstream-$MONTH && git push origin main`). Do **not** push without the user's say-so. Remind them to re-pull into downstream clones (`update_repo`) afterward.

## Notes & guardrails

- **Never** run `git merge upstream/main` as the mechanism — that is the exact failure this skill exists to prevent.
- Keep the always-protected list sacred unless the user explicitly says "also take upstream's CLAUDE.md/README/etc."
- Doc updates (referencing newly pulled skills in CLAUDE.md/MEMORY.md) are optional and done *by hand* after review — never auto-overwrite the customized docs.
- **Shelf life:** if/when this fork fully detaches from upstream (see the backlog in MEMORY.md), retire this skill.

## Cross-references

- `.claude/skills/new-skill/SKILL.md` — how skills are structured here.
- `.claude/rules/quality-gates.md` — gates that apply before merging the sync branch.
