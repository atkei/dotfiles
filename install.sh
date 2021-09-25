#!/usr/bin/env bash

set -e

CWD=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
CONFDIR=${XDG_CONFIG_HOME:-$HOME/.config}

function mklink() {
  local l="${2-${HOME}}/`basename ${1}`"

  if [[ -L ${l} || -e ${l} ]]; then
    rm -rf ${l}
    echo "Deleted: ${l}"
  fi

  ln -s "${CWD}/${1}" "${l}"
  echo "Created: `ls -l ${l}`"
  return 0
}

function mklinks() {
  mklink ".zshrc"
  mklink ".zprofile"
  mklink ".zpreztorc"
  mklink ".tmux.conf"
  mklink ".gitconfig"
  mklink ".keymaps.vim"
  mklink ".ideavimrc"
  mklink ".config/nvim" ${CONFDIR}
  echo "Done."
}

if [ "${1}" == "--force" -o "${1}" == "-f" ]; then
  mklinks
else
  read -p "Existing files may be overriten. Are you sure? (y/n)"
  echo ""
  if [[ "${REPLY}" =~ ^[yY]$ ]]; then
    mklinks
  else
    echo "Aborted."
  fi
fi

