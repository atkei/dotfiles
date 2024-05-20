typeset -gU cdpath fpath mailpath path
typeset -gU CDPATH FPATH MAILPATH PATH

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

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

# Snap bin
snap_bin_path="/snap/bin"
if [ -n "${PATH##*${snap_bin_path}}" -a -n "${PATH##*${snap_bin_path}:*}" ]; then
  export PATH=$PATH:${snap_bin_path}
fi

# Android tools
export PATH=$PATH:"$HOME/Android/Sdk/platform-tools"

# asdf completion
# https://asdf-vm.com/guide/getting-started.html
if [[ -s $HOME/.asdf/asdf.sh ]]; then
  . "$HOME/.asdf/asdf.sh"
  fpath=(${ASDF_DIR}/completions $fpath)
fi

if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
