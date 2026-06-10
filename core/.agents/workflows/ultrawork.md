# Ultrawork Workflow

Use this for high-quality implementation work that needs planning,
implementation, QA, refinement, and shipping discipline.

## Purpose

Run a 5-phase development loop with explicit gates.

```text
INIT
  -> PLAN
  -> IMPL
  -> VERIFY
  -> REFINE
  -> SHIP
```

## When To Use

- multi-file features
- risky refactors
- feature work touching frontend and backend
- work that needs QA before completion
- tasks where regressions would be expensive

Do not use for tiny edits.

## Phase 0: INIT

1. Read:
   - `AGENTS.md`
   - `.ai-local/project-profile.yaml`
   - `docs/ai/conventions.md`
   - `.agents/skills/_shared/core/context-loading.md`
   - `.agents/skills/_shared/core/quality-principles.md`
   - `.agents/workflows/ultrawork/resources/phase-gates.md`
   - `.agents/workflows/ultrawork/resources/multi-review-protocol.md`
2. Summarize:
   - goal
   - constraints
   - non-goals
   - validation commands
3. Decide which subagents are needed.

## Phase 1: PLAN

Owner: `pm-planner`, with `architecture-reviewer` if structure is significant.

Create:

- task breakdown
- acceptance criteria
- affected areas
- validation plan
- risk list

Gate:

- [ ] requirements mapped
- [ ] assumptions listed
- [ ] non-goals listed
- [ ] validation method defined

## Phase 2: IMPL

Owners: implementation agents.

Use only the agents needed:

- `frontend-engineer`
- `backend-engineer`
- `db-engineer`
- `debug-investigator`

Rules:

- keep changes scoped
- preserve project conventions
- avoid unrelated refactors
- update tests when useful

Gate:

- [ ] planned behavior implemented
- [ ] no unrelated files changed
- [ ] validation commands attempted

## Phase 3: VERIFY

Owner: `qa-reviewer`.

Review:

- requirement alignment
- security
- correctness
- performance
- accessibility
- maintainability
- test coverage

Gate:

- [ ] no critical/high verified findings
- [ ] no obvious regression
- [ ] validation evidence exists

## Phase 4: REFINE

Owner: `debug-investigator` or implementation agent.

Address only verified issues from Phase 3.

Rules:

- fix root causes
- avoid tactical silencing
- keep the patch smaller than the original implementation when possible
- re-run affected validation

Gate:

- [ ] QA findings resolved or explicitly deferred
- [ ] validation re-run

## Phase 5: SHIP

Owners: `docs-curator`, optionally `scm-manager`.

Do:

- write or update feature log
- record error/review cases if useful
- write proposed rules only for reusable lessons
- summarize validation
- prepare commit/PR text only if requested

Gate:

- [ ] feature log written for meaningful work
- [ ] final summary includes validation
- [ ] risks and follow-ups listed
