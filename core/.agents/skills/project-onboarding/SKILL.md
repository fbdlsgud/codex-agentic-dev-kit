# Project Onboarding Skill

Use when the user describes a new project's stack, conventions, features,
commands, folder structure, or quality expectations.

## Goal

Convert user-provided project context into files the agent will read every time.

## Process

1. Read current context:
   - `AGENTS.md`
   - `.ai-local/project-profile.yaml`
   - `docs/ai/conventions.md`
2. Extract durable information:
   - stack
   - package manager
   - source directories
   - test/build/lint commands
   - planned features
   - architecture preferences
   - forbidden changes
   - review expectations
3. Update:
   - `docs/ai/conventions.md`
   - `.ai-local/project-profile.yaml`
4. Update `AGENTS.md` only for durable rules.
5. If a reusable kit-level lesson appears, write a proposed rule instead of
   directly editing the kit.

## Output

Summarize:

- what context was added
- which files changed
- what the agent will do differently next time

