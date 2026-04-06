#!/usr/bin/env bash

set -e

# https://cursor.com/docs/cli/installation

if command -v agent &> /dev/null; then
  echo "cursor agent is already installed."
  exit 0
fi

curl -fsSL https://cursor.com/install | bash

exit 0
