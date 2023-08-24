#!/usr/bin/env bash

set -e

if [ ! $(command -v pip) ]; then
  echo pip is not installed. Skipped to install pip packages.
  exit 0
fi

pip install pynvim

exit 0
