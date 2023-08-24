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
task "Install apt packages" "apt.sh"
task "Install snap packages" "snap.sh"
task "Install prezto" "prezto.sh"
task "Install Tmux Plugim Manager" "tpm.sh"
task "Install fzf" "fzf.sh"
task "Install asdf" "asdf.sh"
task "Install asdf plugins" "asdf-plugins.sh"
task "Instakk global pip packages" "pip.sh"
task "Install Docker" "docker.sh"
task "Change default shell to zsh" "chsh.sh"

exit 0
