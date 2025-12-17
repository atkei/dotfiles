#!/usr/bin/env bash

set -e

CWD=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

function task(){
  echo ============================================================================
  echo ${1}
  echo ============================================================================

  bash ${CWD}/${2}
  echo

  return 0
}

task "Install dotfiles" "../install.sh -f"
task "Create private dotfiles" "private-dots.sh"

if [ "$(uname)" == "Linux" ]; then
  task "Install apt packages" "apt.sh"
  task "Install snap packages" "snap.sh"
elif [ "$(uname)" == "Darwin" ]; then
  task "Install Homebrew packages" "brew.sh"
fi

task "Install prezto" "prezto.sh"
task "Install Tmux Plugin Manager" "tpm.sh"
task "Install fzf" "fzf.sh"
task "Install asdf" "asdf.sh"
task "Install asdf plugins" "asdf-plugins.sh"
task "Install rulesync" "rulesync.sh"

if [ "$(uname)" == "Linux" ]; then
  task "Install Docker" "docker.sh"
  task "Install Azure CLI" "az.sh"
  task "Install Supabase CLI" "supabase.sh"
  task "Install Google Chrome" "google-chrome.sh"
  task "Change default shell to zsh" "chsh.sh"
fi

exit 0
