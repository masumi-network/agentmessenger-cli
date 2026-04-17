#!/usr/bin/env bash
# Installs the agent-messenger CLI globally via npm.
# Run this once before using the agent-messenger skill.

set -euo pipefail

if command -v agent-messenger &>/dev/null; then
  echo "agent-messenger already installed: $(agent-messenger --version 2>/dev/null || echo 'ok')"
  exit 0
fi

echo "Installing @agentmessenger/cli..."
npm install -g @agentmessenger/cli

echo "Done. Run 'agent-messenger --help' to verify."
