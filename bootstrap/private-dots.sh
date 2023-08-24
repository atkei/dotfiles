#!/usr/bin/env bash

set -e

function create() {
  if [ -e ${1} ]; then
    echo Private dotfile: ${1} already exists. Skipped to created.
    return 0
  fi
  
  touch ${1}
  echo Created private dotfile: ${1}
  
  return 0
}

create ${HOME}/.zshrc.private
create ${HOME}/.gitconfig.private

exit 0
