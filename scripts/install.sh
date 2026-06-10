#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  install.sh --profile <profile> [--mode light|standard|full]

Run from the target project root.

Profiles:
  react-vite
  nextjs
  react-native-firebase
  spring-kotlin
  node-api
  mobile

Modes:
  light     fast setup with minimal workflow ceremony
  standard  balanced default
  full      mature agentic setup with orchestrate, ultrawork, ralph, eval loop
USAGE
}

PROFILE=""
MODE="standard"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile)
      PROFILE="${2:-}"
      shift 2
      ;;
    --mode)
      MODE="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$PROFILE" ]]; then
  echo "Missing --profile" >&2
  usage
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_DIR="$(pwd)"
PROFILE_DIR="$KIT_DIR/profiles/$PROFILE"
MODE_DIR="$KIT_DIR/core/.agents/modes/$MODE"

if [[ ! -d "$PROFILE_DIR" ]]; then
  echo "Profile not found: $PROFILE" >&2
  exit 1
fi

if [[ ! -d "$MODE_DIR" ]]; then
  echo "Mode not found: $MODE" >&2
  exit 1
fi

copy_dir() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" ]]; then
    echo "Skip existing: $dest"
  else
    cp -R "$src" "$dest"
    echo "Create: $dest"
  fi
}

copy_file() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" ]]; then
    echo "Skip existing: $dest"
  else
    cp "$src" "$dest"
    echo "Create: $dest"
  fi
}

copy_file "$KIT_DIR/core/AGENTS.md" "$TARGET_DIR/AGENTS.md"
copy_dir "$KIT_DIR/core/.codex" "$TARGET_DIR/.codex"
copy_dir "$KIT_DIR/core/.agents" "$TARGET_DIR/.agents"

mkdir -p "$TARGET_DIR/.ai-local"
copy_file "$KIT_DIR/core/.ai-local.project-profile.yaml" "$TARGET_DIR/.ai-local/project-profile.yaml"
copy_file "$KIT_DIR/core/.ai-local.agent-mode.yaml" "$TARGET_DIR/.ai-local/agent-mode.yaml"
copy_file "$MODE_DIR/mode.md" "$TARGET_DIR/docs/ai/agent-mode-$MODE.md"

mkdir -p "$TARGET_DIR/docs/ai/feature-log"
mkdir -p "$TARGET_DIR/docs/ai/error-cases"
mkdir -p "$TARGET_DIR/docs/ai/review-cases"
mkdir -p "$TARGET_DIR/docs/ai/decisions"
mkdir -p "$TARGET_DIR/docs/ai/proposed-rules"
mkdir -p "$TARGET_DIR/docs/ai/evals"

copy_file "$KIT_DIR/templates/docs/ai/conventions.md" "$TARGET_DIR/docs/ai/conventions.md"
copy_file "$KIT_DIR/templates/docs/ai/feature-log/TEMPLATE.md" "$TARGET_DIR/docs/ai/feature-log/TEMPLATE.md"
copy_file "$KIT_DIR/templates/docs/ai/error-cases/TEMPLATE.md" "$TARGET_DIR/docs/ai/error-cases/TEMPLATE.md"
copy_file "$KIT_DIR/templates/docs/ai/review-cases/TEMPLATE.md" "$TARGET_DIR/docs/ai/review-cases/TEMPLATE.md"
copy_file "$KIT_DIR/templates/docs/ai/decisions/TEMPLATE.md" "$TARGET_DIR/docs/ai/decisions/TEMPLATE.md"
copy_file "$KIT_DIR/templates/docs/ai/proposed-rules/TEMPLATE.md" "$TARGET_DIR/docs/ai/proposed-rules/TEMPLATE.md"
copy_file "$KIT_DIR/templates/docs/ai/evals/TEMPLATE.md" "$TARGET_DIR/docs/ai/evals/TEMPLATE.md"

copy_file "$PROFILE_DIR/profile.yaml" "$TARGET_DIR/.ai-local/profile-$PROFILE.yaml"
copy_file "$PROFILE_DIR/conventions.md" "$TARGET_DIR/docs/ai/profile-$PROFILE.md"

if [[ -f "$TARGET_DIR/.ai-local/agent-mode.yaml" ]]; then
  sed -i.bak "s/^mode:.*/mode: $MODE/" "$TARGET_DIR/.ai-local/agent-mode.yaml" && rm -f "$TARGET_DIR/.ai-local/agent-mode.yaml.bak"
fi

cat <<EOF

Agentic Dev Kit installed.

Profile: $PROFILE
Mode: $MODE

Next steps:
1. Open docs/ai/conventions.md and .ai-local/project-profile.yaml.
2. Tell your coding agent the project's conventions, commands, and planned features.
3. Ask it to run the project-onboarding workflow.

Suggested prompt:
  이 프로젝트의 스택, 컨벤션, 기능 계획을 설명할테니
  docs/ai/conventions.md와 .ai-local/project-profile.yaml에 반영하고
  앞으로 작업할 때 이 내용을 항상 참고해줘.

EOF
