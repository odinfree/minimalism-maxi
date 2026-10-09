#!/usr/bin/env bash
# Link this skill into every agent CLI that reads skills from the home directory.
# Usage: ./install.sh            (symlink, keeps one source of truth)
#        ./install.sh --copy     (copy instead, for tools that ignore symlinks)
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NAME="minimalism-maxi"
MODE="${1:-link}"

TARGETS=(
  "$HOME/.claude/skills"          # Claude Code
  "$HOME/.codex/skills"           # OpenAI Codex CLI
  "$HOME/.kimi/skills"            # Kimi Code
  "$HOME/.agents/skills"          # agentskills.io shared location (Codex, OpenCode, others)
  "$HOME/.gemini/skills"          # Gemini CLI
  "$HOME/.config/opencode/skills" # OpenCode
  "$HOME/.factory/skills"         # Factory Droid
  "$HOME/.continue/skills"        # Continue
  "$HOME/.cursor/skills"          # Cursor
)

for dir in "${TARGETS[@]}"; do
  mkdir -p "$dir"
  dest="$dir/$NAME"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
  fi
  if [ "$MODE" = "--copy" ]; then
    cp -R "$SRC" "$dest"
    rm -rf "$dest/.git"
    echo "copied  -> $dest"
  else
    ln -s "$SRC" "$dest"
    echo "linked  -> $dest"
  fi
done
