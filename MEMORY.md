# Project Memory

Corrections and learned facts that persist across sessions.
When a mistake is corrected, append a `[LEARN:category]` entry below.

---

<!-- Append new entries below. Most recent at bottom. -->

## Workflow Patterns

[LEARN:workflow] Requirements specification phase catches ambiguity before planning — reduces rework 30-50%. Use spec-then-plan for complex/ambiguous tasks (>1 hour or >3 files).

[LEARN:workflow] Spec-then-plan protocol: AskUserQuestion (3-5 questions) → create `quality_reports/specs/YYYY-MM-DD_description.md` with MUST/SHOULD/MAY requirements → declare clarity status (CLEAR/ASSUMED/BLOCKED) → get approval → then draft plan.

[LEARN:workflow] Context survival before compression: (1) Update MEMORY.md with [LEARN] entries, (2) Ensure session log current (last 10 min), (3) Active plan saved to disk, (4) Open questions documented. The pre-compact hook displays checklist.

[LEARN:workflow] Plans, specs, and session logs must live on disk (not just in conversation) to survive compression and session boundaries. Quality reports only at merge time.

## Documentation Standards

[LEARN:documentation] When adding new features, update BOTH README and CLAUDE.md immediately to prevent documentation drift. Stale docs break user trust.

[LEARN:documentation] Date fields in frontmatter and README must reflect latest significant changes. Users check dates to assess currency.

## Design Philosophy

[LEARN:design] Framework-oriented > Prescriptive rules. Templates with examples users customize to their domain work best.

[LEARN:design] Generic means working for any academic workflow: R, Python, LaTeX, any domain. Test recommendations across use cases.

## File Organization

[LEARN:files] Specifications go in `quality_reports/specs/YYYY-MM-DD_description.md`, not scattered in root or other directories.

[LEARN:files] Templates belong in `templates/` directory with descriptive names.

## Skill Creation

[LEARN:skills] Effective skill descriptions use trigger phrases users actually say: "check citations", "format results", "validate protocol" → Claude knows when to load skill.

[LEARN:skills] Skills need 3 sections minimum: Instructions (step-by-step), Examples (concrete scenarios), Troubleshooting (common errors).

## Memory System

[LEARN:memory] Two-tier memory: MEMORY.md (generic patterns, committed), personal-memory.md (machine-specific, gitignored) → cross-machine sync + local privacy.

## Meta-Governance

[LEARN:meta] Repository dual nature requires explicit governance: what's generic (commit) vs specific (gitignore) → prevents template pollution.

[LEARN:meta] Template development work doesn't create session logs in quality_reports/ → those are for user work (analysis, papers), not meta-work.

## Upstream Sync

[LEARN:infra] 2026-06-30 — Curated sync from upstream pedrohcgs/claude-code-my-workflow (v1.7→v2.1): pulled 115 new tool files (skills/agents/rules/scripts/templates) via per-path `git checkout upstream/main -- <paths>`, deliberately skipping the teaching subsystem and repo infra (.github/CI, CHANGELOG, etc.). Conflict-prone strategy (full merge) avoided because this fork DELETED the Quarto/Beamer subsystem upstream kept developing — a plain merge would resurrect it. `upstream` remote = https://github.com/pedrohcgs/claude-code-my-workflow.git.

[LEARN:infra] 2026-06-30 — Wired two new hooks into .claude/settings.json: git-guardrails.py (PreToolUse — blocks destructive git: reset --hard, clean -f, push --force, blanket `git add .`) and claim-reconcile.py (PostToolUse — flags stale numeric claims when analysis scripts change; fires only if a quality_reports/passports/*.yaml exists). Other hooks were already wired.
