#!/usr/bin/env bash

set -e

if [ -d "${HOME}/.tmux/plugins/tpm" ]; then
  echo Tmux Plugin Manager is already installed.
  exit 0
fi

echo Install Tmux Plugin Manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

exit 0
