#!/usr/bin/env bash

set -e

if [ ! $(command -v zsh) ]; then
  echo zsh is not installed. Skipped to change default shell to zsh.
  exit 0
fi

chsh -s $(which zsh)

exit 0
