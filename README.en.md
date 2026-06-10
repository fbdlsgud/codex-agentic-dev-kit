# Codex Agentic Dev Kit

<p align="right">
  <a href="README.en.md"><strong>ENG</strong></a> |
  <a href="README.md"><strong>KOR</strong></a>
</p>

A personal Codex starter kit for repeatable AI-assisted side projects.

This repository is not an app project. It is a reusable **Codex-oriented agentic development kit** that installs project instructions, Codex agents, workflows, rules, and AI work records into new projects.

## Quick Summary

```text
this repo = your reusable AI development setup
install.sh = copies that setup into a new project
profile = default settings for a project type
mode = how much workflow discipline the agent should apply
docs/ai = project conventions, feature logs, error cases, and decisions
```

## Assumption

- Codex is already installed on the machine.
- The default config does not require Serena, Context7, Chrome MCP, Node, or npx.
- Optional MCP config is available at `core/.codex/config.with-optional-mcp.toml`.

## Basic Usage

Clone this kit:

```bash
git clone <YOUR_REPO_URL> ~/codex-agentic-dev-kit
```

Move into a new side project:

```bash
mkdir ~/Desktop/my-side-project
cd ~/Desktop/my-side-project
```

Install the AI setup:

```bash
~/codex-agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

The project will receive:

```text
AGENTS.md
.codex/
.agents/
.ai-local/project-profile.yaml
.ai-local/agent-mode.yaml
docs/ai/
```

Then tell Codex what you are building:

```text
This is a React Vite diary app.
It needs login, diary writing, tags, search, and my page.
Suggest missing MVP features, separate confirmed features from suggestions,
record the project context in docs/ai, then plan and start implementation.
```

## Install Command

```bash
<kit-path>/scripts/install.sh --profile <profile> --mode <mode>
```

Example:

```bash
~/codex-agentic-dev-kit/scripts/install.sh --profile react-vite --mode standard
```

## Profiles

| Profile | Use Case | Default Shape |
|---|---|---|
| `react-vite` | React + Vite web app | `src`, `npm run dev`, `npm run build` |
| `nextjs` | Next.js app | App Router or Pages Router projects |
| `react-native-firebase` | React Native + Firebase app | Auth, Firestore, Storage, push notifications |
| `spring-kotlin` | Kotlin Spring backend | Gradle test/build flow |
| `node-api` | Node.js API server | route/service/data access structure |
| `mobile` | unspecified mobile app | before choosing React Native/Flutter/native |

## Modes

| Mode | Standard | When To Use | Main Behavior |
|---|---|---|---|
| `light` | fast | experiments, small apps, simple features | implement/debug/review with minimal ceremony |
| `standard` | recommended | most side projects | onboarding, subagents, feature logs, error cases |
| `full` | strongest | important projects, large features, repeat verification | orchestrate, ultrawork, ralph, verifier, eval loop |

Recommended default:

```bash
install.sh --profile react-vite --mode standard
```

Use `full` for larger or quality-sensitive work:

```bash
install.sh --profile react-vite --mode full
```

## Scripts

| Script | Purpose |
|---|---|
| `scripts/install.sh` | install this AI setup into a project |
| `scripts/update.sh` | refresh managed common files in an existing project |
| `scripts/check.sh` | validate an installed project setup |
| `scripts/check-kit.sh` | validate this kit repository |
| `scripts/doctor-codex.sh` | check Codex-oriented assumptions |
| `scripts/promote-learning.sh` | review a proposed rule before promoting it |

## Subagents

| Agent | Responsibility |
|---|---|
| `orchestrator` | route broad work |
| `pm-planner` | requirements and acceptance criteria |
| `architecture-reviewer` | architecture and tradeoffs |
| `frontend-engineer` | web UI and client work |
| `mobile-engineer` | mobile UI and device flows |
| `backend-engineer` | API, server, auth, integrations |
| `db-engineer` | schema, queries, data integrity |
| `debug-investigator` | reproduce, diagnose, minimal fix |
| `qa-reviewer` | security, performance, accessibility, quality |
| `independent-verifier` | Ralph judge and regression detection |
| `docs-curator` | feature logs and docs sync |
| `scm-manager` | git, commit, PR text |

## Workflows

| Workflow | Purpose |
|---|---|
| `project-onboarding` | turn project description into conventions and plan |
| `product-discovery` | suggest MVP features from an app idea |
| `implement` | normal feature work |
| `debug` | reproduce, diagnose, and fix root cause |
| `review` | QA/code review |
| `orchestrate` | split broad work across subagents |
| `ultrawork` | plan -> implement -> verify -> refine -> ship |
| `ralph` | repeat work until mechanical criteria pass or safeguards trigger |
| `eval` | evaluate whether AI setup changes improved quality |
| `scm` | git, commit, PR work |

## Ralph / Ultrawork

Use stronger loops for high-quality work.

```text
ultrawork:
INIT -> PLAN -> IMPL -> VERIFY -> REFINE -> SHIP
```

```text
ralph:
define criteria -> run ultrawork -> independent verification -> retry failures
```

Example:

```text
Run this in Ralph mode.
Completion criteria: lint passes, build passes, login MVP works, feature-log is written.
Repeat until done, but stop and report if the same criterion fails 3 times.
```

## Default Conventions

Unless the project says otherwise:

```text
split feature code under src/features
keep shared UI, utilities, constants, and helpers under src/shared
keep API/Firebase wrappers under src/shared/api or src/shared/services
write meaningful feature work to docs/ai/feature-log
write repeated failures to docs/ai/error-cases
write review findings to docs/ai/review-cases
write product/architecture decisions to docs/ai/decisions
```

Existing project conventions always win.

## docs/ai

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

This keeps project memory explicit and version-controlled.

## Controlled Self-Improvement

The agent records lessons and proposes improvements, but permanent rules require review.

```text
error or repeated issue
  -> docs/ai/error-cases
  -> docs/ai/proposed-rules
  -> human approval
  -> kit update
  -> eval verification
```

## Updating Existing Projects

```bash
~/codex-agentic-dev-kit/scripts/update.sh
```

Project-local docs and `.ai-local/project-profile.yaml` are preserved where possible.

## Safety

- Do not store secrets, tokens, or credentials in agent files or docs.
- Keep project-specific business rules inside the project.
- Promote reusable rules only after review.
- Run evals after meaningful kit changes.
- Keep generated/cache files out of the kit.

