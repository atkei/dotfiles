#!/usr/bin/env bash

set -e

# asdf
# https://asdf-vm.com/

if [ -d "${HOME}/.asdf" ]; then
  echo asdf is already installed.
  exit 0
fi

echo Install asdf.

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

exit 0
