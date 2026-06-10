# Agentic Dev Kit

Personal starter kit for repeatable AI-assisted side projects.

This kit assumes **Codex is already installed** on the machine. Everything in
this repository is organized around Codex-readable project files, Codex custom
agents, and Codex-friendly workflows.

This repository gives each project a ready-to-use agentic coding environment:

- shared `AGENTS.md`
- Codex/OpenCode style agent config
- project onboarding workflow
- stack profiles
- focused subagent roles
- implementation/review/debug workflows
- feature logs
- error case records
- proposed rule updates
- evals for checking whether the AI setup is improving

## What This Is

This is an **agentic development kit**.

It is not a model, IDE, or coding agent by itself. It is the reusable operating
layer that tells an AI coding agent how to work inside your projects.

Primary target: Codex.

Other coding agents may still read the files, but this kit is optimized for
Codex first.

## Main Flow

```text
1. Keep this repo on GitHub.
2. Clone or reference it when starting a side project.
3. Install a base setup plus a stack profile into the project.
4. Tell the agent the project's conventions, features, commands, and goals.
5. The agent records that context in docs/ai and AGENTS.md.
6. Work is handled through focused workflows and subagents.
7. Completed features are recorded in feature-log.
8. Errors and review findings are recorded as cases.
9. The agent proposes rule/setup improvements.
10. You approve useful proposals and promote them into the kit.
11. Run evals, version the kit, and update other projects.
```

## Repository Layout

```text
agentic-dev-kit/
├── core/                 # Base files copied into projects
│   ├── AGENTS.md
│   ├── .codex/
│   └── .agents/
├── profiles/             # Stack-specific overlays
├── templates/            # Project docs and case templates
├── evals/                # Reusable AI quality checks
├── scripts/              # install, update, check, promote-learning
├── docs/                 # Kit documentation
├── examples/             # Example project context
├── CHANGELOG.md
└── README.md
```

## Install Into A Project

From your side project root:

```bash
/path/to/agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

Available profiles:

- `react-vite`
- `nextjs`
- `react-native-firebase`
- `spring-kotlin`
- `node-api`
- `mobile`

The install script creates:

```text
AGENTS.md
.codex/
.agents/
.ai-local/project-profile.yaml
docs/ai/
```

Modes:

- `light`: fast setup, minimal workflow ceremony
- `standard`: balanced default
- `full`: mature workflow set with orchestrate, ultrawork, ralph, verifier, and
  eval loop

## New Computer Check

If Codex is already installed, run:

```bash
/path/to/agentic-dev-kit/scripts/doctor-codex.sh
```

The default Codex config does not require Serena, Context7, Chrome MCP, Node, or
npx. Optional MCP settings are provided separately at:

```text
core/.codex/config.with-optional-mcp.toml
```

## Project Onboarding

After installing, tell the coding agent something like:

```text
이 프로젝트는 React Vite 앱이야.
src/features 기준으로 기능을 나누고,
npm run lint, npm run build를 검증으로 써.
로그인, 결제, 관리자 화면을 만들 예정이고,
모든 구현 기록은 docs/ai/feature-log에 남겨줘.
이 내용을 프로젝트 컨벤션으로 반영해줘.
```

The agent should update:

- `docs/ai/conventions.md`
- `.ai-local/project-profile.yaml`
- `AGENTS.md` when a permanent project rule is needed
- relevant `.agents/rules/*.md` when a stack rule is needed

## Work With Subagents

Use narrow roles instead of one agent doing everything:

- `orchestrator`: route broad work
- `pm-planner`: requirements and acceptance criteria
- `architecture-reviewer`: structure and tradeoffs
- `frontend-engineer`: UI/client work
- `mobile-engineer`: mobile UI/device work
- `backend-engineer`: API/server work
- `db-engineer`: schema/query work
- `debug-investigator`: reproduction and root cause fixes
- `qa-reviewer`: security/performance/accessibility/code review
- `independent-verifier`: Ralph judge and regression detection
- `docs-curator`: feature logs and docs sync
- `scm-manager`: branches, commits, PR hygiene

## High-Quality Loops

Two stronger workflows are included:

- `ultrawork`: plan -> implement -> verify -> refine -> ship
- `ralph`: repeatedly runs ultrawork, then an independent verifier judges
  mechanical completion criteria until pass or safeguard stop

The `full` mode is closest to a mature OMA-style agent setup. The `standard`
mode keeps the same files available but avoids heavy loops unless requested.

Example prompt:

```text
랄프 방식으로 돌려줘.
완료 기준은 lint 통과, build 통과, 로그인 MVP 동작, feature-log 작성이야.
될 때까지 반복하되, 같은 기준이 3번 실패하면 멈추고 이유를 알려줘.
```

## Controlled Self-Improvement

The agent may record lessons and propose changes, but permanent AI setup changes
should go through review.

```text
error or repeated issue
  -> docs/ai/error-cases
  -> docs/ai/proposed-rules
  -> human approval
  -> kit update
  -> eval verification
```

Do not blindly let every case become a permanent rule.

## Update Existing Projects

After improving this kit:

```bash
/path/to/agentic-dev-kit/scripts/update.sh
```

The update script refreshes managed common files while preserving project-local
context files where possible.

## Validate A Project Setup

```bash
/path/to/agentic-dev-kit/scripts/check.sh
```

This checks for required files and common missing sections.

Validate this kit repository itself:

```bash
/path/to/agentic-dev-kit/scripts/check-kit.sh
```

## Safety Rules

- Do not store secrets in agent files, docs, cases, or evals.
- Keep project-only business rules inside the project.
- Promote reusable rules only after review.
- Run evals after meaningful kit changes.
- Keep generated files and caches out of the kit.
