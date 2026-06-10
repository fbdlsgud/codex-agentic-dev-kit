# Usage

## 1. Install

From a side project root:

```bash
/path/to/agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

Modes:

- `light`: fastest, minimal records and no heavy loops unless asked
- `standard`: balanced default
- `full`: enables mature orchestration, ultrawork, ralph, and eval loop

## 2. Describe The Project

Tell the agent the project's stack, conventions, commands, and planned
features.

Example:

```text
이 프로젝트는 Next.js 앱이야.
src/app 라우팅을 쓰고, UI는 shadcn/ui와 Tailwind로 갈 거야.
상태관리는 TanStack Query와 Zustand를 쓸 예정이고,
검증은 pnpm lint, pnpm typecheck, pnpm build로 해.
이 내용을 프로젝트 컨벤션으로 정리하고 이후 작업 때 항상 참고해줘.
```

For a less specific app idea:

```text
React Native랑 Firebase로 이런저런 기능이 있는 앱을 만들 거야.
핵심 기능은 기록 작성, 알림, 마이페이지야.
필요해 보이는 MVP 기능도 제안해주고,
확정 기능과 제안 기능을 나눠서 docs/ai에 정리한 다음 구현 계획을 세워줘.
```

The agent should write project context to:

- `docs/ai/conventions.md`
- `.ai-local/project-profile.yaml`
- project-specific sections of `AGENTS.md` when needed

## 3. Work Through Workflows

Use a workflow depending on the task:

- feature implementation: `implement`
- bug: `debug`
- review: `review`
- documentation sync: `docs`
- project setup: `project-onboarding`
- git work: `scm`

## 4. Record Results

After meaningful work:

- feature summary -> `docs/ai/feature-log/`
- failure or repeated mistake -> `docs/ai/error-cases/`
- QA findings -> `docs/ai/review-cases/`
- architecture/process decision -> `docs/ai/decisions/`
- suggested reusable rule -> `docs/ai/proposed-rules/`

## 5. Improve The Kit

When proposed rules are useful:

```bash
/path/to/agentic-dev-kit/scripts/promote-learning.sh docs/ai/proposed-rules/example.md
```

Then manually review and apply the suggestion to the kit.

## 6. Update Other Projects

After changing the kit:

```bash
/path/to/agentic-dev-kit/scripts/update.sh
```

## Good User Request Shape

```text
Goal:
- What should change?

Context:
- Relevant screen, module, bug, or file.

Constraints:
- What must not change?

Validation:
- What command or behavior proves completion?
```
