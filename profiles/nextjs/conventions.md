# Next.js Profile

## Assumptions

- Prefer existing App Router or Pages Router patterns.
- Keep server/client component boundaries explicit.
- Use server actions or route handlers only when they match the project style.
- Keep data fetching and caching behavior clear.
- Run lint, typecheck, and build before completion when available.

## Agent Notes

- Do not mark components as client components unless interactivity requires it.
- For visible UI changes, verify in browser when practical.
- Record meaningful features in `docs/ai/feature-log/`.

