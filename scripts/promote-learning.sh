#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  promote-learning.sh <proposed-rule-file>

This script does not automatically edit the kit.
It prints a review checklist for promoting a proposed project rule into the
shared Agentic Dev Kit.
USAGE
}

RULE_FILE="${1:-}"

if [[ -z "$RULE_FILE" || "$RULE_FILE" == "-h" || "$RULE_FILE" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -f "$RULE_FILE" ]]; then
  echo "Proposed rule file not found: $RULE_FILE" >&2
  exit 1
fi

cat <<EOF
Promotion checklist for: $RULE_FILE

1. Is this based on a repeated or high-risk issue?
2. Is the rule short and actionable?
3. Is the proposed target correct?
4. Is this project-specific? If yes, keep it in the project.
5. Does it conflict with existing rules?
6. Which eval should catch regressions?
7. After editing the kit, update CHANGELOG.md.
8. Run evals before updating other projects.

Suggested next action:
  Review $RULE_FILE, then manually edit the target file in the kit.
EOF

