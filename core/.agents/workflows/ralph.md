# Ralph Workflow

Use this when the user wants the agent to keep working until verifiable
completion criteria pass, or until safeguards stop the loop.

Ralph wraps Ultrawork with an independent judge loop.

```text
INIT criteria
  -> EXEC ultrawork
  -> JUDGE independent verification
  -> REPLAN remaining failures
  -> repeat
  -> DONE or SAFEGUARD
```

## When To Use

- broad tasks with clear verification criteria
- tasks where "keep going until done" is desired
- quality-critical work
- work that benefits from independent verification after implementation

Do not use when the task has subjective completion only.

## Safeguards

- Default max iterations: 5
- Stop if the same criterion fails 3 times.
- Stop if verification cannot be made mechanical.
- Ask the user before destructive actions.

## Phase 0: INIT

1. Read:
   - `AGENTS.md`
   - `.ai-local/project-profile.yaml`
   - `docs/ai/conventions.md`
   - `.agents/skills/_shared/core/context-loading.md`
   - `.agents/skills/_shared/runtime/memory-protocol.md`
   - `.agents/workflows/ralph/resources/judge-protocol.md`
2. Convert the user's request into completion criteria.
3. Each criterion must have:
   - id
   - description
   - verification method
   - status
   - fail count
4. If a criterion is subjective, ask for clarification or convert it into an
   observable check.

Example:

```yaml
criteria:
  - id: C1
    description: "Login screen exists and submits credentials"
    verification: "run app and inspect login route or component test"
    status: PENDING
    fail_count: 0
```

## Phase 1: EXEC

Run `.agents/workflows/ultrawork.md` for all PENDING, FAIL, or REGRESSED
criteria.

Pass the current criteria and prior judge results as context.

## Phase 2: JUDGE

Owner: `independent-verifier`.

The judge is not the implementer.

For every criterion:

- execute or inspect the verification method
- record concrete evidence
- mark PASS, FAIL, BLOCKED, or REGRESSED
- re-check prior PASS criteria to detect regressions

Output:

```text
JUDGE Result - Iteration N
C1 PASS evidence: ...
C2 FAIL evidence: ...
verdict: PASS | FAIL
```

## Phase 3: REPLAN

If any criterion failed:

1. Keep already passing criteria out of implementation scope.
2. Keep passing criteria in judge scope.
3. Build a focused task for failed/regressed criteria.
4. Loop back to Phase 1.

## Done

Finish when all criteria are PASS or explicitly BLOCKED.

Write:

- summary
- validation evidence
- feature log or case records
- unresolved blocked items
