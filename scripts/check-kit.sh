#!/usr/bin/env bash
set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAIL=0

require_path() {
  local path="$1"
  if [[ -e "$KIT_DIR/$path" ]]; then
    echo "OK   $path"
  else
    echo "MISS $path"
    FAIL=1
  fi
}

echo "Checking Agentic Dev Kit repository..."
echo

require_path "README.md"
require_path "CHANGELOG.md"
require_path "core/AGENTS.md"
require_path "core/.codex/config.toml"
require_path "core/.codex/config.with-optional-mcp.toml"
require_path "core/.codex/hooks.json"
require_path "core/.codex/agents"
require_path "core/.codex/agents/independent-verifier.toml"
require_path "core/.codex/agents/mobile-engineer.toml"
require_path "core/.codex/hooks/keyword-detector.sh"
require_path "core/.codex/hooks/skill-injector.sh"
require_path "core/.codex/hooks/test-filter.sh"
require_path "core/.codex/hooks/persistent-mode.sh"
require_path "core/.codex/hooks/triggers.json"
require_path "core/.agents/oma-config.yaml"
require_path "core/.agents/mcp.json"
require_path "core/.agents/config/defaults.yaml"
require_path "core/.agents/rules"
require_path "core/.agents/workflows"
require_path "core/.agents/workflows/ultrawork.md"
require_path "core/.agents/workflows/ralph.md"
require_path "core/.agents/workflows/ralph/resources/judge-protocol.md"
require_path "core/.agents/modes/light/mode.md"
require_path "core/.agents/modes/standard/mode.md"
require_path "core/.agents/modes/full/mode.md"
require_path "core/.agents/skills/architecture/SKILL.md"
require_path "core/.agents/skills/coordination/SKILL.md"
require_path "core/.agents/skills/mobile/SKILL.md"
require_path "core/.agents/skills/qa/SKILL.md"
require_path "core/.agents/skills/product-discovery/SKILL.md"
require_path "core/.agents/skills/_shared/core/context-loading.md"
require_path "core/.agents/skills/_shared/core/quality-principles.md"
require_path "core/.agents/skills/_shared/runtime/memory-protocol.md"
require_path "core/.ai-local.project-profile.yaml"
require_path "core/.ai-local.agent-mode.yaml"
require_path "profiles/react-vite/profile.yaml"
require_path "profiles/nextjs/profile.yaml"
require_path "profiles/react-native-firebase/profile.yaml"
require_path "profiles/spring-kotlin/profile.yaml"
require_path "profiles/node-api/profile.yaml"
require_path "profiles/mobile/profile.yaml"
require_path "templates/docs/ai/conventions.md"
require_path "templates/docs/ai/feature-log/TEMPLATE.md"
require_path "templates/docs/ai/error-cases/TEMPLATE.md"
require_path "scripts/install.sh"
require_path "scripts/update.sh"
require_path "scripts/check.sh"
require_path "scripts/doctor-codex.sh"
require_path "scripts/promote-learning.sh"

echo

if [[ "$FAIL" -eq 0 ]]; then
  echo "Kit check passed."
else
  echo "Kit check failed."
  exit 1
fi
