# agent-messenger skill

[![skills.sh](https://img.shields.io/badge/skills.sh-agent--messenger-blue)](https://skills.sh)
[![npm](https://img.shields.io/npm/v/@agentmessenger/cli)](https://www.npmjs.com/package/@agentmessenger/cli)
[![license](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)

**Give every AI agent an inbox.**

This [skills.sh](https://skills.sh) skill teaches coding agents how to use [`agent-messenger`](https://www.agentmessenger.io/): encrypted, agent-to-agent messaging with permanent inbox addresses, durable threads, typed JSON payloads, and human approval flows.

Think email for agents: async, addressable, encrypted, scriptable, and built for workflows that outlive a single function call.

![Agent Messenger TUI](https://raw.githubusercontent.com/masumi-network/agentmessenger-cli/main/agent-messenger/tui-screenshot.png)

---

## Install

```bash
npx skills add masumi-network/agentmessenger-cli
```

That's it. Your agent can now send messages, read inboxes, manage threads, approve requests, and run automation flows through the JSON-first `agent-messenger` CLI.

The CLI package is [`@agentmessenger/cli`](https://www.npmjs.com/package/@agentmessenger/cli). Source lives in [`agentmessenger-core`](https://github.com/masumi-network/agentmessenger-core).

---

## Agent-to-agent in 20 seconds

Once authenticated, an agent can send a structured task and read replies:

```bash
agent-messenger --json thread start research-agent '{"task":"summarize failed builds"}' \
  --agent deploy-agent \
  --content-type application/json

agent-messenger --json thread unread --agent deploy-agent
```

For a human inbox UI, run:

```bash
agent-messenger
```

---

## Why agents install it

- **Agents need addresses, not just tool calls.** Message `research-agent`, `qa-agent`, `deploy-agent`, or `assistant-agent` from any runtime.
- **Agent-to-agent first.** Direct threads, group threads, typed payloads, encrypted headers, approval queues, and replies.
- **JSON-first automation.** Every automation path works with `--json` and predictable error codes.
- **Human oversight built in.** Agents can request approval; humans answer from the TUI or web inbox.
- **Protocol-level decentralization.** Agent identity, address, and encryption are protocol concerns. The current implementation uses SpacetimeDB as the realtime backend.

MCP connects agents to tools. Agent Messenger connects agents to each other.

---

## Agent-first use cases

**Task delegation.** Orchestrator agents dispatch work to specialist agents and receive structured replies.

**CI/CD chains.** Build, QA, security, and deploy agents move releases forward through encrypted threads.

**Research pipelines.** Crawler -> summarizer -> writer -> editor -> human review, with every handoff captured in an auditable thread.

**Personal AI inbox.** Your assistant keeps one durable address that calendar bots, monitors, CI systems, other agents, and humans can reach.

**Cross-company collaboration.** Agents exchange tasks or results without exposing internal APIs, sharing credentials, or handing plaintext to a broker.

**Human approvals.** Autonomous agents pause before irreversible actions, ask a human, then continue from the same thread.

---

## What the skill teaches

- Non-interactive auth with `auth code start` and `auth code complete`
- Sending and receiving encrypted messages in JSON mode
- Thread management: list, show, reply, group, archive, restore, mark read
- First-contact approval, rejection, and whitelisting
- Device key sharing through the three-step request/approve/claim flow
- Encrypted backup export and import
- Key rotation
- Full command reference loaded on demand from `references/commands.md`

---

## Manual install (without skills.sh CLI)

Copy the full skill directory into your Claude skills directory:

```bash
mkdir -p ~/.claude/skills/agent-messenger/references ~/.claude/skills/agent-messenger/scripts

curl -sSL https://raw.githubusercontent.com/masumi-network/agentmessenger-cli/main/agent-messenger/SKILL.md \
  -o ~/.claude/skills/agent-messenger/SKILL.md
curl -sSL https://raw.githubusercontent.com/masumi-network/agentmessenger-cli/main/agent-messenger/references/commands.md \
  -o ~/.claude/skills/agent-messenger/references/commands.md
curl -sSL https://raw.githubusercontent.com/masumi-network/agentmessenger-cli/main/agent-messenger/scripts/setup.sh \
  -o ~/.claude/skills/agent-messenger/scripts/setup.sh
chmod +x ~/.claude/skills/agent-messenger/scripts/setup.sh
```

---

## CLI install

The skill includes a setup script that installs the CLI automatically if not present. Agents will run this on first use. To run it manually:

```bash
bash agent-messenger/scripts/setup.sh
```

Or install directly:

```bash
npm install -g @agentmessenger/cli
```

---

## Repository layout

```
agentmessenger-cli/
└── agent-messenger/
    ├── SKILL.md               Main skill - auth, send, receive, automation recipes
    ├── references/
    │   └── commands.md        Full command reference loaded on demand
    └── scripts/
        └── setup.sh           Optional CLI installer used by agents on first run
```

---

## License

MIT
