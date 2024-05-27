#!/usr/bin/env bash

set -e

# https://github.com/junegunn/fzf

if [ -d "${HOME}/.fzf" ]; then
  echo fzf is already installed.
  exit 0
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf
git fetch --all --tags
git checkout refs/tags/0.52.1
./install --completion --key-bindings --no-update-rc

exit 0
