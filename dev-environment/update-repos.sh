#!/usr/bin/env bash
# Pull latest changes for all Anote repos
set -euo pipefail

REPOS_DIR="${HOME}/repos"

REPOS=(
  anote-product
  leaderboard
  synthetic-data
  autonomous-intelligence
  community
  slackbot
  privategpt
  openanote
  ai-rfps
  upreach
  ai-assisted-coding-tool
  anote-ai-research-fellowship
)

echo "Updating all Anote repos..."
for repo in "${REPOS[@]}"; do
  dir="${REPOS_DIR}/${repo}"
  if [ -d "${dir}/.git" ]; then
    echo -n "  → ${repo}: "
    git -C "${dir}" pull --ff-only 2>&1 | tail -1
  else
    echo "  → ${repo}: not found at ${dir} (skipping)"
  fi
done
echo "Done."
