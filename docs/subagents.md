# Subagents

## Why

One agent doing everything tends to mix planning, coding, QA, and documentation.
Subagents make work smaller and easier to verify.

## Default Roles

| Role | Responsibility | Access |
|---|---|---|
| `pm-planner` | requirements, scope, acceptance criteria | read-only |
| `architecture-reviewer` | architecture, boundaries, tradeoffs | read-only |
| `frontend-engineer` | UI and client implementation | write |
| `mobile-engineer` | mobile UI, device flows, React Native/Flutter/native work | write |
| `backend-engineer` | API and server implementation | write |
| `db-engineer` | schema and query design | write |
| `debug-investigator` | reproduce, diagnose, minimal fix | write |
| `qa-reviewer` | security, performance, accessibility, quality | read-only |
| `independent-verifier` | Ralph judge, criterion verification, regression detection | read-only |
| `docs-curator` | feature logs and docs sync | write docs |
| `scm-manager` | git status, staging, commit, PR text | write git metadata |

## Coordination

```text
orchestrator
  ├─ pm-planner
  ├─ architecture-reviewer
  ├─ frontend-engineer
  ├─ mobile-engineer
  ├─ backend-engineer
  ├─ db-engineer
  ├─ debug-investigator
  ├─ qa-reviewer
  ├─ independent-verifier
  ├─ docs-curator
  └─ scm-manager
```

## Rules

- Orchestrator coordinates; it does not implement unless the task is tiny.
- PM plans; it does not change code.
- QA reviews; it does not fix code.
- Independent verifier judges Ralph criteria; it does not fix code.
- Docs records; it does not change source code.
- Debug fixes the root cause with minimal changes.
- Implementation agents run relevant checks.
- SCM runs only after implementation and review are complete.
