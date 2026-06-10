# Self-Improvement

## Goal

Make the AI setup improve from real project experience without letting it drift
into a large, stale, contradictory rule set.

## Rule

The agent can write observations and proposals. Permanent changes require
review.

## Flow

```text
error, review finding, or repeated friction
  ↓
record case
  ↓
extract lesson
  ↓
write proposed rule
  ↓
review proposal
  ↓
promote into kit or project-local rules
  ↓
run evals
```

## Promotion Targets

| Lesson | Promote To |
|---|---|
| applies to every project | `core/AGENTS.md` |
| frontend behavior | `core/.agents/rules/frontend.md` |
| backend behavior | `core/.agents/rules/backend.md` |
| debugging process | `core/.agents/workflows/debug.md` |
| review process | `core/.agents/workflows/review.md` |
| stack-specific | `profiles/<profile>/` |
| project-only | project `docs/ai/conventions.md` |

## Promotion Checklist

Promote only if the proposed rule is:

- based on a real repeated issue
- short
- actionable
- scoped to the right layer
- not already covered
- not project-specific unless stored in the project
- easy to verify later

