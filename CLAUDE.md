# CLAUDE.MD -- Academic Project Development with Claude Code

<!-- HOW TO USE: Replace [BRACKETED PLACEHOLDERS] with your project info.
     Keep this file under ~150 lines — Claude loads it every session. -->

**Project:** [YOUR PROJECT NAME]
**Author:** Noah Askin
**Institution:** UC-Irvine, Organization & Management
**Branch:** main

---

## First-Run Setup (new clone — do once)

1. Fill in the `[BRACKETED]` project fields above and the *Current Project State* table below.
2. If this repo is a **fork**: `gh repo set-default <your-account>/<repo>` — otherwise `gh pr create` targets the parent. Per clone; `.git/config` never travels with a clone.
3. (Optional) Verify wiring: `scripts/validate-setup.sh`

> Skills, agents, rules, and the hooks in `.claude/settings.json` are committed and work automatically on clone — there is no install step.
> Clone the project *before* starting Claude Code in it: a session resolves `$CLAUDE_PROJECT_DIR` once, at launch, so a session that moves into a new repo mid-run must be restarted for hooks to resolve.

---

## About the Researcher

**Field:** Organizational sociology / computational social science
**Core themes:** Optimal differentiation, status dynamics, creativity & recognition, cultural markets, authenticity, social networks, gender & creative production, market structure & innovation
**Approach:** Theoretically grounded but practically applicable; bridges sociology and management; empirically rigorous with large-scale data
**Venues:** ASR, ASQ, PNAS, and management/sociology outlets
**Teaching:** Management, creativity, networks, leadership, OB/OT — to PhD, MBA, undergrad, and executive audiences

---

## Working Preferences

- **R:** tidyverse ecosystem; ggplot2 with minimal themes (`theme_minimal()` or similar)
- **Citations:** APA format
- **Writing voice:** Match Noah's prior publications -- direct, clear, sociologically informed but accessible; avoid jargon for jargon's sake
- **Reporting:** Concise bullet-point summaries where possible; details on request
- **Tone:** Be direct. Skip the flattery and filler.
- **Presentations:** Gamma or PowerPoint — PPTX palettes & slide builders in `scripts/pptx_helpers.py` (`NSASlidesV2` = current family; `NSASlides` = legacy)

---

## Methodological Toolkit

- **Computational methods:** Cosine similarity, Word2Vec/Song2Vec embeddings, t-SNE, algorithmic feature extraction
- **Econometrics:** Fixed-effects panel models, DiD/DDD, instrumental variables
- **Data types:** Large-scale digital trace data (streaming logs, chart data, MusicBrainz metadata), audio features (Echo Nest/Spotify API)
- **Novelty measurement:** Feature-distance approaches with rolling comparison windows
- **Visualization:** Data-forward plots, progressive reveal of regression results, t-SNE feature maps

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- run scripts and confirm output at the end of every task
- **Quality gates** -- 80 = commit · 90 = PR · 95 = excellence; nothing ships below 80/100
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
Rscript scripts/R/filename.R                            # run an R script
python3 scripts/quality_score.py scripts/R/filename.R   # quality score
```

---

## Skills Quick Reference

Each skill self-describes on invocation; grouped by purpose:

- **Review & writing:** `/proofread` · `/review-paper` · `/review-r` · `/review-presentation` · `/humanize` · `/seven-pass-review` · `/respond-to-referees` · `/verify-claims`
- **Research & analysis:** `/data-analysis` · `/lit-review` · `/research-ideation` · `/interview-me` · `/did-event-study` · `/power-analysis` · `/simulation-study` · `/stata-replication`
- **Reproducibility & submission:** `/audit-reproducibility` · `/replication-package` · `/preregister` · `/grant-proposal`
- **Presentations & figures:** `/create-presentation` · `/new-diagram`
- **Workflow:** `/commit` · `/learn` · `/deep-audit` · `/context-status` · `/checkpoint` · `/compress-session` · `/diagnose` · `/promote-memory`

---

## Current Project State

| Component | File | Key Content |
|-----------|------|-------------|
| [Component 1] | `scripts/R/analysis.R` | [Brief description] |
| [Component 2] | `[filename]` | [Brief description] |
