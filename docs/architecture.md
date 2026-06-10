# Architecture

## Purpose

Agentic Dev Kit standardizes how AI coding agents work across your side
projects.

It gives each project:

- a stable instruction surface
- stack-specific profiles
- role-based subagents
- workflow files
- case memory
- feature history
- controlled improvement proposals
- quality evals

## Layers

```text
coding agent runtime
  ↓
tooling and MCP
  ↓
AGENTS.md
  ↓
.agents rules, skills, workflows
  ↓
project profile
  ↓
docs/ai project memory
  ↓
source code
```

## Common Kit vs Project Context

### Common Kit

The common kit owns reusable behavior:

- collaboration rules
- safety rules
- role definitions
- workflow shapes
- documentation templates
- eval cases
- install/update behavior

### Project Context

Each side project owns local facts:

- stack
- commands
- folder layout
- architecture
- domain terms
- feature list
- API contracts
- deployment process
- project-specific mistakes

## Controlled Self-Improvement

The kit should improve from real work, but not by blindly rewriting itself.

```text
work result or failure
  ↓
case record
  ↓
lesson extraction
  ↓
proposed rule
  ↓
human approval
  ↓
kit update
  ↓
eval verification
  ↓
version release
```

This prevents rule bloat and stale assumptions.

## Role Model

Subagents should have narrow ownership.

| Role | Owns | Avoids |
|---|---|---|
| `orchestrator` | routing and coordination | direct implementation |
| `pm-planner` | requirements and acceptance criteria | code changes |
| `architecture-reviewer` | boundaries and tradeoffs | task micro-plans |
| `frontend-engineer` | UI/client code | backend contracts |
| `backend-engineer` | API/server code | UI styling |
| `db-engineer` | schema/query/data integrity | unrelated API work |
| `debug-investigator` | reproduction and minimal fix | broad refactors |
| `qa-reviewer` | verified findings | source edits |
| `independent-verifier` | Ralph criteria judging | implementation |
| `docs-curator` | logs and docs sync | source edits |
| `scm-manager` | branch/commit/PR hygiene | feature implementation |

## High-Quality Loops

### Ultrawork

Use for quality-sensitive implementation:

```text
INIT -> PLAN -> IMPL -> VERIFY -> REFINE -> SHIP
```

### Ralph

Use when the user wants repeat-until-done behavior:

```text
INIT criteria -> EXEC ultrawork -> JUDGE independent-verifier -> REPLAN -> repeat
```

Ralph should only run against mechanical completion criteria.

## Quality Attributes

The kit optimizes for:

- repeatability
- clear project context
- narrow role execution
- explicit verification
- safe AI setup updates
- portability across projects
