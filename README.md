# My Claude Code Setup

> A ready-to-fork foundation for AI-assisted academic work. You describe what you want — a research paper, a data analysis, a replication package, a literature review — and Claude plans the approach, runs specialized agents, fixes issues, verifies quality, and presents results.

**Last Updated:** 2026-03-09

---

## Quick Start (5 minutes)

### 1. Fork & Clone

```bash
git clone https://github.com/YOUR_USERNAME/my-repo.git my-project
cd my-project
```

### 2. Start Claude Code

```bash
claude
```

Then paste the starter prompt, filling in your project details:

> I am starting to work on **[PROJECT NAME]** in this repo. **[Describe your project in 2-3 sentences.]** Please read the configuration files and adapt them for my project. Enter plan mode and start.

**What this does:** Claude reads all configuration files, fills in your project name, institution, and preferences, then enters contractor mode — planning, implementing, reviewing, and verifying autonomously.

---

## How It Works

### Contractor Mode

You describe a task. For complex or ambiguous requests, Claude first creates a requirements specification with MUST/SHOULD/MAY priorities and clarity status (CLEAR/ASSUMED/BLOCKED). You approve the spec, then Claude plans the approach, implements it, runs specialized review agents, fixes issues, re-verifies, and scores against quality gates — all autonomously.

### Specialized Agents

Instead of one general-purpose reviewer, focused agents each check one dimension:

- **proofreader** — grammar, typos, consistency
- **domain-reviewer** — field-specific substantive correctness (template — customize for your field)
- **r-reviewer** — R code quality and reproducibility
- **presentation-reviewer** — slide deck quality (narrative arc, cognitive load, design, academic rigor)
- **verifier** — end-to-end output verification

### Quality Gates

Every file gets a score (0-100). Scores below threshold block the action:
- **80** — commit threshold
- **90** — PR threshold
- **95** — excellence (aspirational)

### Context Survival

Plans, specifications, and session logs survive auto-compression and session boundaries. The PreCompact hook saves a context snapshot before Claude's auto-compression triggers. MEMORY.md accumulates learning across sessions.

---

## Use Cases

| Academic Task | How This Workflow Helps |
|---------------|----------------------|
| Research papers | Literature review, manuscript review, simulated peer review |
| Data analysis | End-to-end R pipelines, replication verification, publication-ready output |
| Replication packages | Reproducibility audit trails, tolerance-based verification |
| Presentations | Create and review PowerPoint/Gamma slides |
| Research proposals | Structured drafting with adversarial critique |

---

## What's Included

<details>
<summary><strong>5 agents, 13 skills, 10 rules, 7 hooks, 7 templates</strong> (click to expand)</summary>

### Agents (`.claude/agents/`)

| Agent | What It Does |
|-------|-------------|
| `proofreader` | Grammar, typos, overflow, consistency review |
| `domain-reviewer` | **Template** for your field-specific substance reviewer |
| `r-reviewer` | R code quality, reproducibility, and domain correctness |
| `presentation-reviewer` | Presentation quality: narrative arc, cognitive load, design, rigor |
| `verifier` | End-to-end task completion verification |

### Skills (`.claude/skills/`)

| Skill | What It Does |
|-------|-------------|
| `/commit` | Stage, commit, create PR, and merge to main |
| `/deep-audit` | Repository-wide consistency audit |
| `/learn` | Extract non-obvious discoveries into persistent skills |
| `/context-status` | Show session health and context usage |
| `/proofread` | Launch proofreader on a file |
| `/review-r` | Launch R code reviewer |
| `/data-analysis` | End-to-end R analysis with publication-ready output |
| `/review-paper` | Manuscript review: structure, methods, referee objections |
| `/review-presentation` | Presentation review: narrative, design, rigor, pacing |
| `/create-presentation` | Build Gamma or PowerPoint presentation from content |
| `/lit-review` | Literature search, synthesis, and gap identification |
| `/research-ideation` | Generate research questions and empirical strategies |
| `/interview-me` | Interactive interview to formalize a research idea |

### Rules (`.claude/rules/`)

**Always-on** (load every session):

| Rule | What It Enforces |
|------|-----------------|
| `plan-first-workflow` | Plan mode for non-trivial tasks + context preservation |
| `orchestrator-protocol` | Contractor mode: implement → verify → review → fix → score |
| `session-logging` | Three logging triggers: post-plan, incremental, end-of-session |
| `meta-governance` | Template vs. working project distinctions |

**Path-scoped** (load only when working on matching files):

| Rule | Triggers On | What It Enforces |
|------|------------|-----------------|
| `quality-gates` | `.R`, `.tex` | 80/90/95 scoring + tolerance thresholds |
| `r-code-conventions` | `*.R` | R coding standards + math line-length exception |
| `replication-protocol` | `*.R` | Replicate original results before extending |
| `pdf-processing` | `master_supporting_docs/` | Safe large PDF handling |
| `proofreading-protocol` | `.tex`, `quality_reports/` | Propose-first, then apply with approval |
| `orchestrator-research` | `*.R`, `explorations/` | Simple orchestrator for research |
| `exploration-folder-protocol` | `explorations/` | Structured sandbox for experimental work |
| `exploration-fast-track` | `explorations/` | Lightweight exploration workflow (60/100 threshold) |

### Templates (`templates/`)

| Template | What It Does |
|----------|-------------|
| `session-log.md` | Structured session logging format |
| `quality-report.md` | Merge-time quality report format |
| `exploration-readme.md` | Exploration project README template |
| `archive-readme.md` | Archive documentation template |
| `requirements-spec.md` | MUST/SHOULD/MAY requirements framework with clarity status |
| `constitutional-governance.md` | Template for defining non-negotiable principles vs. preferences |
| `skill-template.md` | Academic skill creation template with domain-specific examples |

</details>

---

## Prerequisites

| Tool | Required For | Install |
|------|-------------|---------|
| [Claude Code](https://code.claude.com/docs/en/overview) | Everything | `npm install -g @anthropic-ai/claude-code` |
| R | Data analysis | [r-project.org](https://www.r-project.org/) |
| [gh CLI](https://cli.github.com/) | PR workflow | `brew install gh` (macOS) |

Not all tools are needed — install only what your project uses. Claude Code is the only hard requirement.

---

## Adapting for Your Field

1. **Customize the domain reviewer** (`.claude/agents/domain-reviewer.md`) with review lenses specific to your field
2. **Add field-specific R pitfalls** to `.claude/rules/r-code-conventions.md`
3. **Customize the workflow quick reference** (`.claude/WORKFLOW_QUICK_REF.md`) with your non-negotiables and preferences
4. **Set up the exploration folder** (`explorations/`) for experimental work

---

## License

MIT License. See [LICENSE](LICENSE).
