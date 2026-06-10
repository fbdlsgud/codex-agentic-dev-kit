# Codex Agentic Dev Kit

<p align="right">
  <a href="README.md"><strong>ENG</strong></a> |
  <a href="README.ko.md"><strong>KOR</strong></a>
</p>

반복해서 만드는 사이드 프로젝트에 동일한 AI 개발환경을 깔기 위한 개인용 Codex 세팅 키트입니다.

이 키트는 **새 컴퓨터에 Codex가 이미 설치되어 있다**는 전제로 동작합니다. 모델이나 IDE 자체가 아니라, Codex가 읽고 따를 수 있는 프로젝트 규칙, 서브에이전트, 워크플로, 기록 템플릿, 설치 스크립트를 제공합니다.

## 이게 무엇인가

이 레포는 하나의 **Codex용 agentic development kit**입니다.

각 프로젝트에 다음 파일들을 설치해서 Codex가 일하는 방식을 표준화합니다.

- 공통 `AGENTS.md`
- `.codex/` Codex 설정과 custom agent 정의
- `.agents/` workflow, skill, rule 정의
- 프로젝트 온보딩 workflow
- 프로젝트 타입별 profile
- 기능 구현 기록
- 에러/리뷰 케이스 기록
- AI 세팅 개선 제안
- AI 세팅 품질 검증 eval

즉, 이 레포는 앱 프로젝트가 아니라 **AI 개발 세팅 원본 템플릿**입니다.

## 전체 흐름

```text
1. 이 레포를 GitHub에 둔다.
2. 새 사이드 프로젝트를 만들 때 이 kit를 clone하거나 참조한다.
3. install.sh로 공통 세팅과 profile을 프로젝트에 설치한다.
4. Codex에게 프로젝트의 앱 아이디어, 스택, 기능, 컨벤션을 말한다.
5. Codex가 docs/ai와 AGENTS.md에 프로젝트 컨텍스트를 정리한다.
6. 구현/디버그/리뷰는 workflow와 subagent 기준으로 진행한다.
7. 완료된 기능은 feature-log에 기록한다.
8. 에러와 리뷰 결과는 case로 기록한다.
9. 반복되는 문제는 proposed-rules로 개선안을 남긴다.
10. 승인한 개선안만 kit에 반영한다.
11. eval로 개선 여부를 확인하고 다른 프로젝트에 업데이트한다.
```

## 구조

```text
codex-agentic-dev-kit/
├── core/                 # 프로젝트에 복사될 기본 AGENTS.md, .codex, .agents
│   ├── AGENTS.md
│   ├── .codex/
│   └── .agents/
├── profiles/             # 프로젝트 종류별 기본 세팅
├── templates/            # docs/ai 기록 템플릿
├── evals/                # AI 세팅 품질 검증 케이스
├── scripts/              # install, update, check, doctor-codex
├── docs/                 # kit 설명 문서
├── examples/             # 예시 프롬프트
├── CHANGELOG.md
└── README.md
```

## 새 프로젝트에 설치하기

새 사이드 프로젝트 루트에서 실행합니다.

```bash
/path/to/codex-agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

예를 들어 데스크톱에 이 kit가 있다면:

```bash
cd ~/Desktop/my-side-project
~/Desktop/codex-agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

설치 후 프로젝트 안에 다음 파일들이 생깁니다.

```text
AGENTS.md
.codex/
.agents/
.ai-local/project-profile.yaml
.ai-local/agent-mode.yaml
docs/ai/
```

## Profile

`profile`은 프로젝트 타입별 기본값입니다.

사용 가능한 profile:

- `react-vite`
- `nextjs`
- `react-native-firebase`
- `spring-kotlin`
- `node-api`
- `mobile`

예:

```bash
# React Vite 프로젝트
install.sh --profile react-vite

# Next.js 프로젝트
install.sh --profile nextjs

# React Native + Firebase 프로젝트
install.sh --profile react-native-firebase

# 아직 구체 스택이 애매한 모바일 프로젝트
install.sh --profile mobile
```

## Mode

`mode`는 AI가 얼마나 무겁게 프로세스를 적용할지 정합니다.

- `light`: 빠른 작업용. 기록과 heavy workflow를 최소화
- `standard`: 기본 추천값. 의미 있는 작업은 기록하고 필요한 경우 subagent 사용
- `full`: 성숙한 운영 모드. orchestrate, ultrawork, ralph, verifier, eval loop까지 적극 사용

추천:

```bash
# 대부분의 사이드 프로젝트
install.sh --profile react-vite --mode standard

# 중요한 프로젝트 또는 품질 루프까지 쓰고 싶을 때
install.sh --profile react-vite --mode full
```

## 새 컴퓨터에서 확인하기

Codex가 이미 설치되어 있다는 전제로, 이 kit의 환경 점검을 실행할 수 있습니다.

```bash
/path/to/codex-agentic-dev-kit/scripts/doctor-codex.sh
```

기본 설정은 Serena, Context7, Chrome MCP, Node, npx를 필수로 요구하지 않습니다.

선택 MCP 설정은 별도 파일로 제공됩니다.

```text
core/.codex/config.with-optional-mcp.toml
```

## 프로젝트 온보딩

설치 후 Codex에게 프로젝트 설명을 말합니다.

예:

```text
이 프로젝트는 React Vite로 만드는 일기 앱이야.
로그인, 일기 작성, 태그, 검색, 마이페이지 기능이 필요해.
필요해 보이는 MVP 기능도 제안해주고,
확정 기능과 제안 기능을 나눠서 docs/ai에 정리한 다음
구현 계획 세우고 시작해줘.
```

Codex는 다음 파일들을 업데이트해야 합니다.

- `docs/ai/conventions.md`
- `.ai-local/project-profile.yaml`
- 필요할 경우 `AGENTS.md`
- 필요할 경우 `.agents/rules/*.md`

## 기본 컨벤션

별도 지시가 없으면 다음 기본값을 사용합니다.

```text
src/features 기준 기능 분리
src/shared에는 공통 UI, 유틸, 상수, 공통 헬퍼
src/shared/api 또는 src/shared/services에 API/Firebase 래퍼
기능 구현 후 docs/ai/feature-log 기록
에러/반복 실패는 docs/ai/error-cases 기록
리뷰 결과는 docs/ai/review-cases 기록
제품/구조 결정은 docs/ai/decisions 기록
```

프로젝트가 이미 다른 구조를 갖고 있으면 기존 프로젝트 구조가 우선입니다.

## Subagents

큰 작업은 하나의 에이전트가 전부 처리하지 않고 역할을 나눕니다.

- `orchestrator`: 큰 작업을 역할별로 분배
- `pm-planner`: 요구사항, 범위, 수용 기준 정리
- `architecture-reviewer`: 구조, 경계, 트레이드오프 검토
- `frontend-engineer`: 웹 UI와 클라이언트 구현
- `mobile-engineer`: 모바일 UI, 디바이스 흐름 구현
- `backend-engineer`: API, 서버, 인증, 연동 구현
- `db-engineer`: 스키마, 쿼리, 데이터 무결성
- `debug-investigator`: 버그 재현, 원인 분석, 최소 수정
- `qa-reviewer`: 보안, 성능, 접근성, 품질 리뷰
- `independent-verifier`: Ralph 완료 기준 독립 검증
- `docs-curator`: feature-log, error-case, docs 정리
- `scm-manager`: git status, stage, commit, PR 문구

## Workflows

주요 workflow:

- `project-onboarding`: 프로젝트 설명을 컨벤션과 계획으로 정리
- `product-discovery`: 앱 아이디어에서 MVP 기능 제안
- `implement`: 일반 기능 구현
- `debug`: 버그 재현, 원인 분석, 최소 수정
- `review`: QA/code review
- `orchestrate`: 큰 작업을 여러 subagent로 분배
- `ultrawork`: plan -> implement -> verify -> refine -> ship
- `ralph`: ultrawork 실행 후 독립 검증, 실패 시 반복
- `eval`: AI 세팅 변경이 좋아졌는지 검증
- `scm`: git, commit, PR 작업

## Ralph / Ultrawork

품질이 중요한 작업은 더 강한 루프를 사용할 수 있습니다.

```text
ultrawork:
INIT -> PLAN -> IMPL -> VERIFY -> REFINE -> SHIP
```

```text
ralph:
완료 기준 정의 -> ultrawork 실행 -> independent-verifier 검증 -> 실패분 재실행
```

예:

```text
랄프 방식으로 돌려줘.
완료 기준은 lint 통과, build 통과, 로그인 MVP 동작, feature-log 작성이야.
될 때까지 반복하되 같은 기준이 3번 실패하면 멈추고 이유를 알려줘.
```

## 기록 구조

프로젝트마다 `docs/ai`에 작업 맥락을 쌓습니다.

```text
docs/ai/
├── conventions.md
├── feature-log/
├── error-cases/
├── review-cases/
├── decisions/
├── proposed-rules/
└── evals/
```

이 구조는 숨겨진 메모리보다 명시적이고, Git으로 관리하기 쉽습니다.

## Controlled Self-Improvement

AI가 실수나 반복 문제를 발견하면 바로 영구 규칙을 고치지 않습니다.

대신:

```text
에러/반복 문제
  -> docs/ai/error-cases
  -> docs/ai/proposed-rules
  -> 사람 승인
  -> kit 수정
  -> eval 검증
```

즉, AI가 배운 내용을 제안하게 만들고, 영구 규칙 반영은 검토 후 진행합니다.

## 기존 프로젝트 업데이트

kit를 개선한 뒤 기존 프로젝트에 반영하려면:

```bash
/path/to/codex-agentic-dev-kit/scripts/update.sh
```

프로젝트 로컬 문서와 `.ai-local/project-profile.yaml`은 최대한 보존합니다.

## 검증

프로젝트에 설치된 상태 확인:

```bash
/path/to/codex-agentic-dev-kit/scripts/check.sh
```

kit 레포 자체 확인:

```bash
/path/to/codex-agentic-dev-kit/scripts/check-kit.sh
```

## 안전 규칙

- secrets, token, credential을 agent 파일이나 docs에 저장하지 않습니다.
- 프로젝트 전용 비즈니스 규칙은 해당 프로젝트에 둡니다.
- 재사용 가능한 규칙도 검토 후 반영합니다.
- 의미 있는 kit 변경 후에는 eval을 실행합니다.
- generated/cache 파일은 kit에 넣지 않습니다.
