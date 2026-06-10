# Codex Portability

## Baseline Assumption

This kit assumes Codex is already installed on the machine.

The kit itself provides project files that Codex can read:

- `AGENTS.md`
- `.codex/config.toml`
- `.codex/agents/*.toml`
- `.agents/workflows/*.md`
- `.agents/rules/*.md`
- `docs/ai/*`

## What Works With Only Codex

- project onboarding
- default conventions
- subagent role definitions
- implement/debug/review workflows
- ultrawork workflow
- ralph workflow
- feature logs
- error cases
- proposed rules
- eval records

## Optional Extras

These are not required by the default config:

- Serena MCP
- Context7 MCP
- Chrome DevTools MCP
- Node/npx for MCP packages

If you want optional MCP tools, copy:

```text
core/.codex/config.with-optional-mcp.toml
```

over:

```text
.codex/config.toml
```

inside the target project, then install the external tools it references.

## New Machine Flow

```bash
git clone <your-agentic-dev-kit-repo> ~/agentic-dev-kit
cd ~/agentic-dev-kit
./scripts/doctor-codex.sh

cd ~/your-side-project
~/agentic-dev-kit/scripts/install.sh --profile react-vite
```

