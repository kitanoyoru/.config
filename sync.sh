#!/usr/bin/env bash
# Pull live configs from $HOME into this repo. Secrets redacted. Re-run to refresh.
set -euo pipefail
cd "$(dirname "$0")"
H="$HOME"
RS=(rsync -a --delete --exclude .DS_Store)

mkdir -p nvim fish alacritty tmux claude codex hermes

"${RS[@]}" "$H/.config/nvim/"      nvim/
"${RS[@]}" "$H/.config/fish/"      fish/
"${RS[@]}" "$H/.config/alacritty/" alacritty/
cp "$H/.tmux.conf" tmux/tmux.conf
mkdir -p tmux/scripts tmux/prompts
cp -R "$H/.tmux/scripts/." tmux/scripts/
cp -R "$H/.tmux/prompts/." tmux/prompts/
cp "$H/.local/bin/tmux-sessionizer" tmux/

# claude: user-owned config only (plugins, agents, skills, sessions, creds excluded)
cp "$H/.claude/CLAUDE.md" "$H/.claude/settings.json" claude/
for d in rules commands hooks; do "${RS[@]}" "$H/.claude/$d/" "claude/$d/"; done

# codex
cp "$H/.codex/AGENTS.md" codex/
mkdir -p codex/rules && cp "$H/.codex/rules/default.rules" codex/rules/
sed -E 's/(Bearer )[A-Za-z0-9_-]+/\1REDACTED/' "$H/.codex/config.toml" > codex/config.toml

# hermes
cp "$H/.hermes/config.yaml" "$H/.hermes/SOUL.md" hermes/

if grep -rEn 'ctx7sk-|sk-[A-Za-z0-9]{20,}' . --exclude-dir=.git --exclude=sync.sh; then
  echo "secret found, abort" >&2; exit 1
fi
