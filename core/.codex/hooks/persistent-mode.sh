#!/usr/bin/env bash
set -euo pipefail

STATE_FILE=".agents/runtime/active-workflow"

if [[ -f "$STATE_FILE" ]]; then
  WORKFLOW="$(tr -d '\n' < "$STATE_FILE")"
  case "$WORKFLOW" in
    ralph|ultrawork|orchestrate)
      printf 'Persistent workflow active: %s. Do not stop until gates pass, safeguard triggers, or user says workflow done.\n' "$WORKFLOW"
      ;;
  esac
fi

printf '%s\n' "If meaningful work completed, update docs/ai/feature-log or relevant case records."

