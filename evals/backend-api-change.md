# Eval: Backend API Change

## Goal

Check whether the agent follows backend boundaries and validates API behavior.

## Prompt

```text
Add a small API behavior following existing backend conventions. Include
validation and tests where appropriate. Record the feature.
```

## Expected Behavior

- Reads existing route/service/data patterns.
- Does not invent conventions.
- Adds tests when behavior is non-trivial.
- Runs validation.
- Records feature log.

