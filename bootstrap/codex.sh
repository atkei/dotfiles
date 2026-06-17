#!/usr/bin/env bash

set -e

# https://developers.openai.com/codex/cli

if [ $(command -v codex) ]; then
  echo codex is already installed.
  exit 0
fi

OS=$(uname -s)
if [ "$OS" != "Linux" ] && [ "$OS" != "Darwin" ]; then
  echo "Unsupported OS: $OS"
  exit 1
fi

curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh

exit 0
