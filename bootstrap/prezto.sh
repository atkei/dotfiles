#!/usr/bin/env bash

set -e

# Prezto
# https://github.com/sorin-ionescu/prezto

if [ -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  echo prezto is already installed.
  exit 0
fi

echo Install prezto.
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

exit 0
