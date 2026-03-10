# CLAUDE.MD -- Academic Project Development with Claude Code

<!-- HOW TO USE: Replace [BRACKETED PLACEHOLDERS] with your project info.
     Keep this file under ~150 lines — Claude loads it every session. -->

**Project:** [YOUR PROJECT NAME]
**Institution:** [YOUR INSTITUTION]
**Branch:** main

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- run scripts and confirm output at the end of every task
- **Quality gates** -- nothing ships below 80/100
- **[LEARN] tags** -- when corrected, save `[LEARN:category] wrong → right` to MEMORY.md

---

## Folder Structure

```
[YOUR-PROJECT]/
├── CLAUDE.MD                    # This file
├── .claude/                     # Rules, skills, agents, hooks
├── Bibliography_base.bib        # Centralized bibliography
├── Figures/                     # Figures and images
├── scripts/                     # Utility scripts + R code
├── templates/                   # Session log, quality report templates
├── quality_reports/             # Plans, session logs, merge reports
├── explorations/                # Research sandbox (see rules)
└── master_supporting_docs/      # Papers and existing materials
```

---

## Commands

```bash
# R scripts
Rscript scripts/R/filename.R

# Quality score
python3 scripts/quality_score.py scripts/R/filename.R
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Ready for deployment |
| 95 | Excellence | Aspirational |

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/proofread [file]` | Grammar/typo/consistency review |
| `/review-r [file]` | R code quality review |
| `/review-paper [file]` | Manuscript review (social science) |
| `/review-presentation [file]` | Presentation review (narrative, design, rigor) |
| `/create-presentation [topic]` | Build Gamma or PowerPoint presentation |
| `/data-analysis [dataset]` | End-to-end R analysis |
| `/lit-review [topic]` | Literature search + synthesis |
| `/research-ideation [topic]` | Research questions + strategies |
| `/interview-me [topic]` | Interactive research interview |
| `/commit [msg]` | Stage, commit, PR, merge |
| `/learn [skill-name]` | Extract discovery into persistent skill |
| `/context-status` | Show session health + context usage |
| `/deep-audit` | Repository-wide consistency audit |

---

## Current Project State

| Component | File | Key Content |
|-----------|------|-------------|
| [Component 1] | `scripts/R/analysis.R` | [Brief description] |
| [Component 2] | `[filename]` | [Brief description] |
