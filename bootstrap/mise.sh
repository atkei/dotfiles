#!/usr/bin/env bash

set -e

# https://mise.jdx.dev/installing-mise.html

if [ $(command -v mise) ]; then
  echo mise is already installed.
  exit 0
fi

sudo install -dm 755 /etc/apt/keyrings
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list

sudo apt-get -y update
sudo apt-get -y install mise

exit 0
