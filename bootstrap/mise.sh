#!/usr/bin/env bash
set -e

# mise
# https://mise.jdx.dev/

if command -v mise &> /dev/null; then
  echo mise is already installed.
  exit 0
fi

echo Install mise.

curl https://mise.run | sh

exit 0
