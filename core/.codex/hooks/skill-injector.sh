#!/usr/bin/env bash
set -euo pipefail

INPUT="$(cat || true)"
LOWER="$(printf '%s' "$INPUT" | tr '[:upper:]' '[:lower:]')"

SKILLS=()

add_skill() {
  SKILLS+=("$1")
}

case "$LOWER" in
  *프론트*|*ui*|*화면*|*react*|*next*|*frontend*)
    add_skill ".agents/skills/frontend/SKILL.md"
    ;;
esac

case "$LOWER" in
  *모바일*|*react\ native*|*flutter*|*ios*|*android*|*mobile*)
    add_skill ".agents/skills/mobile/SKILL.md"
    ;;
esac

case "$LOWER" in
  *백엔드*|*api*|*server*|*backend*|*auth*)
    add_skill ".agents/skills/backend/SKILL.md"
    ;;
esac

case "$LOWER" in
  *db*|*database*|*schema*|*migration*|*firestore*|*sql*)
    add_skill ".agents/skills/db/SKILL.md"
    ;;
esac

case "$LOWER" in
  *아키텍처*|*architecture*|*구조*|*경계*|*adr*)
    add_skill ".agents/skills/architecture/SKILL.md"
    ;;
esac

case "$LOWER" in
  *버그*|*에러*|*오류*|*debug*|*bug*|*exception*)
    add_skill ".agents/skills/debug/SKILL.md"
    ;;
esac

case "$LOWER" in
  *리뷰*|*검토*|*qa*|*review*|*audit*)
    add_skill ".agents/skills/review/SKILL.md"
    ;;
esac

case "$LOWER" in
  *랄프*|*ralph*)
    add_skill ".agents/skills/ralph/SKILL.md"
    ;;
esac

case "$LOWER" in
  *ultrawork*|*울트라워크*)
    add_skill ".agents/skills/ultrawork/SKILL.md"
    ;;
esac

case "$LOWER" in
  *컨벤션*|*프로젝트\ 세팅*|*이런\ 앱*|*만들\ 거야*)
    add_skill ".agents/skills/project-onboarding/SKILL.md"
    add_skill ".agents/skills/product-discovery/SKILL.md"
    ;;
esac

if [[ "${#SKILLS[@]}" -gt 0 ]]; then
  printf 'Relevant skills to read before work:\n'
  printf -- '- %s\n' "${SKILLS[@]}" | sort -u
fi
