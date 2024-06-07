#!/usr/bin/env bash

set -e

SUPABSE_CLI_VERSION=1.172.2

if [ $(command -v supabase) ]; then
  echo Supabase CLI is already installed.
  exit 0
fi


curl -o /tmp/supabase_${SUPABSE_CLI_VERSION}_linux_amd64.deb \
  -sOL https://github.com/supabase/cli/releases/download/v${SUPABSE_CLI_VERSION}/supabase_${SUPABSE_CLI_VERSION}_linux_amd64.deb
sudo apt install /tmp/supabase_${SUPABSE_CLI_VERSION}_linux_amd64.deb

exit 0
