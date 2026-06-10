# Codex Agentic Dev Kit

<p align="right">
  <a href="README.en.md"><strong>ENG</strong></a> |
  <a href="README.md"><strong>KOR</strong></a>
</p>

Codex로 사이드 프로젝트를 만들 때마다 같은 AI 개발환경을 빠르게 깔기 위한 개인용 starter kit입니다.

이 레포는 앱 프로젝트가 아닙니다. 새 프로젝트 안에 `AGENTS.md`, `.codex`, `.agents`, `docs/ai` 같은 AI 작업 규칙과 기록 구조를 설치해주는 **Codex용 agentic development kit**입니다.

## 한 줄 요약

```text
이 레포 = 내 AI 개발 세팅 원본
install.sh = 새 프로젝트에 그 세팅을 깔아주는 설치 스크립트
profile = 프로젝트 종류별 기본값
mode = AI가 얼마나 무겁게 작업 프로세스를 돌릴지 정하는 단계
docs/ai = 프로젝트별 컨벤션, 기능 기록, 에러 기록 저장소
```

## 전제

- 새 컴퓨터에 Codex는 이미 설치되어 있다고 가정합니다.
- 기본 설정은 Serena, Context7, Chrome MCP, Node, npx를 필수로 요구하지 않습니다.
- 선택 MCP 설정은 `core/.codex/config.with-optional-mcp.toml`에 따로 둡니다.

## 어떻게 쓰는가

### 1. 이 레포를 clone

```bash
git clone <YOUR_REPO_URL> ~/codex-agentic-dev-kit
```

### 2. 새 사이드 프로젝트 생성 또는 이동

```bash
mkdir ~/Desktop/my-side-project
cd ~/Desktop/my-side-project
```

### 3. AI 세팅 설치

```bash
~/codex-agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

설치가 끝나면 새 프로젝트 안에 다음 파일들이 생깁니다.

```text
AGENTS.md
.codex/
.agents/
.ai-local/project-profile.yaml
.ai-local/agent-mode.yaml
docs/ai/
```

### 4. Codex에게 프로젝트 설명

```text
이 프로젝트는 React Vite로 만드는 일기 앱이야.
로그인, 일기 작성, 태그, 검색, 마이페이지 기능이 필요해.
필요해 보이는 MVP 기능도 제안해주고,
확정 기능과 제안 기능을 나눠서 docs/ai에 정리한 다음
구현 계획 세우고 시작해줘.
```

Codex는 이 내용을 바탕으로 `docs/ai/conventions.md`, `.ai-local/project-profile.yaml` 등을 업데이트하고 이후 작업 때 계속 참고합니다.

## 설치 명령어

기본 형태:

```bash
<kit-path>/scripts/install.sh --profile <profile> --mode <mode>
```

예:

```bash
~/codex-agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

데스크톱에 kit를 clone했다면:

```bash
~/Desktop/codex-agentic-dev-kit/scripts/install.sh --profile nextjs --mode full
```

## Profile

`profile`은 프로젝트 종류별 기본 세팅입니다. 프로젝트마다 명령어, 폴더 구조, 검증 방식이 다르기 때문에 설치할 때 하나를 고릅니다.

| Profile | 용도 | 기본 성격 |
|---|---|---|
| `react-vite` | React + Vite 웹앱 | `src`, `npm run dev`, `npm run build` 기준 |
| `nextjs` | Next.js 앱 | App Router/Pages Router 프로젝트용 |
| `react-native-firebase` | React Native + Firebase 앱 | Auth, Firestore, Storage, Push 고려 |
| `spring-kotlin` | Kotlin Spring 백엔드 | Gradle, test/build 중심 |
| `node-api` | Node.js API 서버 | route/service/data access 구조 기준 |
| `mobile` | 아직 스택이 애매한 모바일 앱 | React Native/Flutter/native 확정 전 |

예:

```bash
# React 웹앱
install.sh --profile react-vite --mode standard

# Next.js 앱
install.sh --profile nextjs --mode standard

# React Native + Firebase 앱
install.sh --profile react-native-firebase --mode standard

# 중요한 프로젝트라 full workflow까지 쓰고 싶을 때
install.sh --profile react-vite --mode full
```

## Mode

`mode`는 AI가 얼마나 강한 작업 프로세스를 적용할지 정하는 단계입니다.

| Mode | 기준 | 언제 쓰나 | 활성화되는 흐름 |
|---|---|---|---|
| `light` | 빠른 작업 | 작은 사이드 프로젝트, 실험, 간단한 기능 | 기본 컨벤션, implement/debug/review 중심 |
| `standard` | 기본 추천 | 대부분의 사이드 프로젝트 | project-onboarding, subagent, feature-log, error-case |
| `full` | 고품질 루프 | 중요한 프로젝트, 큰 기능, 자동 검증 루프 | orchestrate, ultrawork, ralph, independent-verifier, eval |

추천은 `standard`입니다.

```bash
# 대부분은 이걸로 충분
install.sh --profile react-vite --mode standard
```

`full`은 더 강하지만 작업이 무거워질 수 있습니다.

```bash
# 큰 기능, 품질이 중요한 작업, 반복 검증이 필요할 때
install.sh --profile react-vite --mode full
```

## Mode별 차이

### light

- 빠르게 구현하고 싶을 때
- 기록과 리뷰 부담을 최소화
- `ralph`, `ultrawork`, `orchestrate`는 사용자가 직접 요청할 때만 사용

### standard

- 기본 추천 모드
- 의미 있는 작업은 `docs/ai/feature-log`에 기록
- 에러가 반복되면 `docs/ai/error-cases`에 기록
- 필요한 경우 subagent를 나눠 사용
- heavy workflow는 위험도가 높거나 사용자가 요청할 때만 사용

### full

- 가장 강한 모드
- 큰 작업은 `orchestrate`로 역할 분리
- 품질이 중요한 작업은 `ultrawork`
- 완료 기준이 명확한 작업은 `ralph`
- `independent-verifier`가 완료 기준을 검증
- AI 세팅 변경은 `eval`로 검증

## 설치 후 생기는 구조

```text
my-side-project/
├── AGENTS.md
├── .codex/
│   ├── config.toml
│   ├── hooks.json
│   ├── hooks/
│   └── agents/
├── .agents/
│   ├── rules/
│   ├── workflows/
│   ├── skills/
│   └── modes/
├── .ai-local/
│   ├── project-profile.yaml
│   └── agent-mode.yaml
└── docs/ai/
    ├── conventions.md
    ├── feature-log/
    ├── error-cases/
    ├── review-cases/
    ├── decisions/
    ├── proposed-rules/
    └── evals/
```

## 주요 스크립트

| Script | 역할 |
|---|---|
| `scripts/install.sh` | 새 프로젝트에 AI 세팅 설치 |
| `scripts/update.sh` | kit 변경분을 기존 프로젝트에 반영 |
| `scripts/check.sh` | 설치된 프로젝트 구조 검사 |
| `scripts/check-kit.sh` | kit 레포 자체 구조 검사 |
| `scripts/doctor-codex.sh` | Codex 전제 환경 점검 |
| `scripts/promote-learning.sh` | proposed-rule을 kit 규칙으로 승격하기 전 체크리스트 출력 |

## 설치 상태 확인

프로젝트 안에서:

```bash
~/codex-agentic-dev-kit/scripts/check.sh
```

kit 레포 자체 확인:

```bash
~/codex-agentic-dev-kit/scripts/check-kit.sh
```

새 컴퓨터에서 Codex 환경 점검:

```bash
~/codex-agentic-dev-kit/scripts/doctor-codex.sh
```

## Subagents

큰 작업은 하나의 AI가 전부 처리하지 않고 역할을 나눕니다.

| Agent | 역할 |
|---|---|
| `orchestrator` | 큰 작업을 역할별로 분배 |
| `pm-planner` | 요구사항, 범위, 수용 기준 정리 |
| `architecture-reviewer` | 구조, 경계, 트레이드오프 검토 |
| `frontend-engineer` | 웹 UI와 클라이언트 구현 |
| `mobile-engineer` | 모바일 UI, 디바이스 흐름 구현 |
| `backend-engineer` | API, 서버, 인증, 연동 구현 |
| `db-engineer` | 스키마, 쿼리, 데이터 무결성 |
| `debug-investigator` | 버그 재현, 원인 분석, 최소 수정 |
| `qa-reviewer` | 보안, 성능, 접근성, 품질 리뷰 |
| `independent-verifier` | Ralph 완료 기준 독립 검증 |
| `docs-curator` | feature-log, error-case, docs 정리 |
| `scm-manager` | git status, stage, commit, PR 문구 |

## Workflows

| Workflow | 역할 |
|---|---|
| `project-onboarding` | 프로젝트 설명을 컨벤션과 계획으로 정리 |
| `product-discovery` | 앱 아이디어에서 MVP 기능 제안 |
| `implement` | 일반 기능 구현 |
| `debug` | 버그 재현, 원인 분석, 최소 수정 |
| `review` | QA/code review |
| `orchestrate` | 큰 작업을 여러 subagent로 분배 |
| `ultrawork` | plan -> implement -> verify -> refine -> ship |
| `ralph` | 완료 기준 검증 실패 시 반복 실행 |
| `eval` | AI 세팅 변경이 좋아졌는지 검증 |
| `scm` | git, commit, PR 작업 |

## Ralph / Ultrawork

품질이 중요한 작업은 강한 루프를 사용할 수 있습니다.

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

이미 프로젝트가 다른 구조를 갖고 있다면 기존 프로젝트 구조가 우선입니다.

## docs/ai 기록 구조

```text
docs/ai/
├── conventions.md       # 프로젝트 컨벤션과 기능 계획
├── feature-log/         # 구현한 기능 기록
├── error-cases/         # 에러와 해결 기록
├── review-cases/        # 리뷰/QA 패턴 기록
├── decisions/           # 구조/제품 결정 기록
├── proposed-rules/      # AI 세팅 개선 제안
└── evals/               # AI 세팅 품질 평가
```

이 구조는 숨겨진 메모리보다 명시적이고 Git으로 관리하기 쉽습니다.

## Controlled Self-Improvement

AI가 실수나 반복 문제를 발견해도 바로 영구 규칙을 고치지 않습니다.

```text
에러/반복 문제
  -> docs/ai/error-cases
  -> docs/ai/proposed-rules
  -> 사람 승인
  -> kit 수정
  -> eval 검증
```

AI는 개선안을 제안하고, 영구 규칙 반영은 사람이 승인합니다.

## 기존 프로젝트 업데이트

kit를 개선한 뒤 기존 프로젝트에 반영하려면:

```bash
~/codex-agentic-dev-kit/scripts/update.sh
```

프로젝트 로컬 문서와 `.ai-local/project-profile.yaml`은 최대한 보존합니다.

## 안전 규칙

- secrets, token, credential을 agent 파일이나 docs에 저장하지 않습니다.
- 프로젝트 전용 비즈니스 규칙은 해당 프로젝트에 둡니다.
- 재사용 가능한 규칙도 검토 후 반영합니다.
- 의미 있는 kit 변경 후에는 eval을 실행합니다.
- generated/cache 파일은 kit에 넣지 않습니다.

