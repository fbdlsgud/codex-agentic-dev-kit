#!/usr/bin/env bash
set -euo pipefail

echo "Checking Codex-oriented Agentic Dev Kit prerequisites..."
echo

check_optional() {
  local cmd="$1"
  local note="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "OK   $cmd"
  else
    echo "MISS $cmd - $note"
  fi
}

echo "Required assumption:"
echo "- Codex is installed and you can open/run it for the target project."
echo

echo "Shell tools:"
check_optional "git" "recommended for cloning and commits"
check_optional "bash" "required for kit scripts"

echo
echo "Optional MCP tools:"
check_optional "node" "needed only if you enable optional npx-based MCP servers"
check_optional "npx" "needed only if you enable optional chrome-devtools/context7 MCP"
check_optional "serena" "needed only if you enable optional Serena MCP"

echo
echo "Default config does not require MCP. Optional MCP config is available at:"
echo "  core/.codex/config.with-optional-mcp.toml"

