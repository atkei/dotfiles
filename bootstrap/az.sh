#!/usr/bin/env bash

set -e

# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

if [ $(command -v az) ]; then
  echo Azure CLI is already installed.
  exit 0
fi

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
