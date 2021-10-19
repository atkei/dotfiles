typeset -gU cdpath fpath mailpath path 
typeset -gU CDPATH FPATH MAILPATH PATH

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

# pyenv
if [ -d "${HOME}/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"

  if [ -d "${PYENV_ROOT}/plugins/pyenv-virtualenv" ]; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# goenv
if [ -d "${HOME}/.goenv" ]; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
fi

# Flutter
# https://flutter.dev/docs/get-started/install/linux#install-flutter-manuallyexport
[ -d "${HOME}/flutter" ] && export PATH="$PATH:${HOME}/flutter/bin"

# krew
[ -d "${HOME}/.krew" ] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Less
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
