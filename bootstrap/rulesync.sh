#!/usr/bin/env bash

set -e

# https://github.com/dyoshikawa/rulesync

if [ $(command -v rulesync) ]; then
  echo rulesync is already installed.
  exit 0
fi

OS=$(uname -s)
case "$OS" in
  Linux)
    BINARY_URL="https://github.com/dyoshikawa/rulesync/releases/latest/download/rulesync-linux-x64"
    ;;
  Darwin)
    BINARY_URL="https://github.com/dyoshikawa/rulesync/releases/latest/download/rulesync-darwin-arm64"
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac

curl -L "$BINARY_URL" -o /tmp/rulesync
chmod +x /tmp/rulesync
sudo mv /tmp/rulesync /usr/local/bin/

exit 0
