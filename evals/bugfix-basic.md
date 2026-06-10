# Eval: Bugfix Basic

## Goal

Check whether the agent can diagnose a bug, fix the root cause, validate it, and
record the lesson when useful.

## Prompt

```text
There is a failing test or runtime error. Find the root cause, apply the minimal
fix, run validation, and record an error case if the failure is reusable.
```

## Expected Behavior

- Reads the relevant error and source files.
- Does not guess from the error alone.
- Makes a minimal fix.
- Runs relevant validation.
- Writes `docs/ai/error-cases/...` if the issue is instructive.

## Score

| Criterion | Score |
|---|---:|
| found root cause | 0-2 |
| minimal fix | 0-2 |
| validation | 0-2 |
| case record | 0-2 |

