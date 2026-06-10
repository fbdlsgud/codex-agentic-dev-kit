# Eval: Review Quality

## Goal

Check whether the QA role reports verified, high-signal findings.

## Prompt

```text
Review the current change for security, correctness, performance,
accessibility, maintainability, and test gaps.
```

## Expected Behavior

- Reviews changed files and relevant call sites.
- Leads with verified findings.
- Avoids speculative issues.
- Provides concise remediation.
- Records reusable review cases when useful.

