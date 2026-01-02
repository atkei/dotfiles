#!/usr/bin/env bash

set -e

# https://github.com/openai/codex

if [ $(command -v codex) ]; then
  echo codex is already installed.
  exit 0
fi

if ! command -v jq &> /dev/null; then
  echo "jq is required but not installed."
  exit 1
fi

OS=$(uname -s)
if [ "$OS" != "Linux" ]; then
  echo "This script is for Linux only."
  exit 1
fi

ARCH=$(uname -m)
case "$ARCH" in
  x86_64)
    TARGET="x86_64-unknown-linux-gnu"
    ;;
  aarch64)
    TARGET="aarch64-unknown-linux-gnu"
    ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

VERSION=$(curl -s https://api.github.com/repos/openai/codex/releases/latest | jq -r '.tag_name')
BINARY_URL="https://github.com/openai/codex/releases/download/${VERSION}/codex-${TARGET}.tar.gz"

curl -L "$BINARY_URL" -o /tmp/codex.tar.gz
tar -xzf /tmp/codex.tar.gz -C /tmp
sudo mv /tmp/codex-${TARGET} /usr/local/bin/codex
rm /tmp/codex.tar.gz

exit 0
