#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="$(pwd)"
FAIL=0

require_path() {
  local path="$1"
  if [[ -e "$TARGET_DIR/$path" ]]; then
    echo "OK   $path"
  else
    echo "MISS $path"
    FAIL=1
  fi
}

echo "Checking Agentic Dev Kit project setup..."
echo

require_path "AGENTS.md"
require_path ".codex/config.toml"
require_path ".codex/agents"
require_path ".codex/hooks.json"
require_path ".agents/oma-config.yaml"
require_path ".agents/mcp.json"
require_path ".agents/rules"
require_path ".agents/workflows"
require_path ".ai-local/project-profile.yaml"
require_path ".ai-local/agent-mode.yaml"
require_path "docs/ai/conventions.md"
require_path "docs/ai/feature-log"
require_path "docs/ai/error-cases"
require_path "docs/ai/review-cases"
require_path "docs/ai/decisions"
require_path "docs/ai/proposed-rules"
require_path "docs/ai/evals"

echo

if [[ "$FAIL" -eq 0 ]]; then
  echo "Setup check passed."
else
  echo "Setup check failed."
  exit 1
fi
