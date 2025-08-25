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
  if [ ! -d "$CONFDIR" ]; then
    mkdir "$CONFDIR"
    echo "Created: ${CONFDIR}"
  fi

  if [ ! -d "${HOME}/.claude" ]; then
    mkdir -p "${HOME}/.claude"
    echo "Created: ${HOME}/.claude"
  fi

  mklink ".zshrc"
  mklink ".zprofile"
  mklink ".zpreztorc"
  mklink ".zlogin"
  mklink ".zlogout"
  mklink ".zshenv"
  mklink ".tmux.conf"
  mklink ".gitconfig"
  mklink ".keymaps.vim"
  mklink ".ideavimrc"
  mklink ".awsp-wrapper"
  mklink ".vimrc"
  mklink ".config/git" ${CONFDIR}
  mklink ".claude/CLAUDE.md" "${HOME}/.claude"

  if [ "$(uname)" == "Darwin" ]; then
    mklink ".Brewfile"
  fi
}

if [ "${1}" == "--force" -o "${1}" == "-f" ]; then
  mklinks
else
  read -p "Existing files may be overwritten. Are you sure? (y/n)"
  echo ""
  if [[ "${REPLY}" =~ ^[yY]$ ]]; then
    mklinks
  else
    echo "Aborted."
    exit 0
  fi
fi

echo Done.
exit 0
