#!/usr/bin/env bash
#
# Install the repo's version-controlled git hooks (run once per clone).
#
# Points git at `.githooks/` so `git commit` runs the pre-commit quality
# gate (surface-sync + quality score). The hook lives in version control,
# so it stays in sync across machines and forks — unlike `.git/hooks/`,
# which is local and never committed.
#
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

if [ ! -d .githooks ]; then
    echo "install-hooks: no .githooks/ in this repo — nothing to install."
    echo "  This fork does not ship a commit-time gate: the same quality"
    echo "  scoring runs inside the /commit skill, which is where the review"
    echo "  loop already lives. Nothing is broken; you can ignore this."
    echo "  (If you later pull .githooks/ from upstream, re-run this script.)"
    exit 0
fi

chmod +x .githooks/* 2>/dev/null || true
git config core.hooksPath .githooks

echo "✓ core.hooksPath → .githooks"
echo "  Every 'git commit' now runs surface-sync + quality (>=80) gates."
echo "  Bypass once:  SKIP_QUALITY_GATE=1 git commit ...   (quality only)"
echo "                git commit --no-verify ...           (all hooks)"
echo "  Uninstall:    git config --unset core.hooksPath"
