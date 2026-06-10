# Example Project Context Prompt

```text
이 프로젝트는 React Vite 기반 사이드 프로젝트야.
src/features 아래에 기능 단위로 나누고,
src/shared에는 공통 UI와 유틸만 둘 거야.
서버 상태는 TanStack Query, 로컬 상태는 Zustand를 쓸 거고,
스타일은 Tailwind로 통일할 거야.

검증 명령은 npm run lint, npm run typecheck, npm run build야.
기능 구현이 끝나면 docs/ai/feature-log에 정리하고,
에러가 나면 docs/ai/error-cases에 원인과 해결을 남겨줘.

이 내용을 프로젝트 컨벤션으로 반영해줘.
```

