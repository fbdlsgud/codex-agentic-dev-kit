#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  update.sh

Run from a project root that already has Agentic Dev Kit installed.

This refreshes managed common files but does not overwrite project-local docs:
  - keeps docs/ai/conventions.md
  - keeps docs/ai case records
  - keeps .ai-local/project-profile.yaml
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_DIR="$(pwd)"

backup_path() {
  local path="$1"
  if [[ -e "$path" ]]; then
    local backup="$path.backup.$(date +%Y%m%d%H%M%S)"
    cp -R "$path" "$backup"
    echo "Backup: $backup"
  fi
}

refresh_dir() {
  local src="$1"
  local dest="$2"
  backup_path "$dest"
  rm -rf "$dest"
  cp -R "$src" "$dest"
  echo "Refresh: $dest"
}

refresh_file() {
  local src="$1"
  local dest="$2"
  backup_path "$dest"
  cp "$src" "$dest"
  echo "Refresh: $dest"
}

refresh_file "$KIT_DIR/core/AGENTS.md" "$TARGET_DIR/AGENTS.md"
refresh_dir "$KIT_DIR/core/.codex" "$TARGET_DIR/.codex"
refresh_dir "$KIT_DIR/core/.agents" "$TARGET_DIR/.agents"

mkdir -p "$TARGET_DIR/docs/ai/feature-log"
mkdir -p "$TARGET_DIR/docs/ai/error-cases"
mkdir -p "$TARGET_DIR/docs/ai/review-cases"
mkdir -p "$TARGET_DIR/docs/ai/decisions"
mkdir -p "$TARGET_DIR/docs/ai/proposed-rules"
mkdir -p "$TARGET_DIR/docs/ai/evals"

mkdir -p "$TARGET_DIR/.ai-local"
if [[ ! -f "$TARGET_DIR/.ai-local/agent-mode.yaml" ]]; then
  cp "$KIT_DIR/core/.ai-local.agent-mode.yaml" "$TARGET_DIR/.ai-local/agent-mode.yaml"
  echo "Create: $TARGET_DIR/.ai-local/agent-mode.yaml"
fi

echo
echo "Agentic Dev Kit common files refreshed."
echo "Project-local docs and .ai-local/project-profile.yaml were preserved."
