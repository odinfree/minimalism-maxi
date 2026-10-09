#!/usr/bin/env bash
# Link this skill into the agent CLIs that read skills from the home directory.
# Usage: ./install.sh              symlink (one source of truth, edits here show up everywhere)
#        ./install.sh --copy       copy instead, for tools that do not follow symlinks
#        ./install.sh --force      replace an existing real directory at the target (default: skip it)
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NAME="minimalism-maxi"
MODE="link"; FORCE=0
for arg in "$@"; do
  case "$arg" in
    --copy) MODE="copy" ;;
    --force) FORCE=1 ;;
    *) echo "unknown option: $arg" >&2; exit 2 ;;
  esac
done

# Verified on a machine that uses them: Claude Code, Codex CLI, Kimi Code, ~/.agents.
# The rest are the documented locations for those tools but were not exercised here.
TARGETS=(
  "$HOME/.claude/skills"          # Claude Code
  "$HOME/.codex/skills"           # OpenAI Codex CLI
  "$HOME/.kimi/skills"            # Kimi Code
  "$HOME/.agents/skills"          # agentskills.io shared location
  "$HOME/.gemini/skills"          # Gemini CLI (untested)
  "$HOME/.config/opencode/skills" # OpenCode (untested)
  "$HOME/.factory/skills"         # Factory Droid (untested)
  "$HOME/.continue/skills"        # Continue (untested)
  "$HOME/.cursor/skills"          # Cursor (untested)
)

for dir in "${TARGETS[@]}"; do
  mkdir -p "$dir"
  dest="$dir/$NAME"
  if [ -L "$dest" ]; then
    rm "$dest"                                  # an old symlink: safe to replace
  elif [ -e "$dest" ]; then
    if [ "$FORCE" = 1 ]; then
      mv "$dest" "$dest.bak.$(date +%Y%m%d%H%M%S)"
      echo "moved existing $dest to a .bak copy"
    else
      echo "skip    -> $dest already exists (a real directory). Re-run with --force to replace it."
      continue
    fi
  fi
  if [ "$MODE" = "copy" ]; then
    cp -R "$SRC" "$dest"; rm -rf "$dest/.git"
    echo "copied  -> $dest"
  else
    ln -s "$SRC" "$dest"
    echo "linked  -> $dest"
  fi
done
