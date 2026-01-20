#!/usr/bin/env bash

set -e

# https://code.claude.com/docs/ja/quickstart#native-install-recommended

if command -v claude &> /dev/null; then
  echo "claude is already installed."
  exit 0
fi

OS=$(uname -s)
if [ "$OS" != "Linux" ] && [ "$OS" != "Darwin" ]; then
  echo "This script supports macOS and Linux only."
  exit 1
fi

curl -fsSL https://claude.ai/install.sh | bash

exit 0
