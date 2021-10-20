typeset -gU path cdpath fpath mailpath
typeset -gU PATH CDPATH FPATH MAILPATH

autoload -Uz compinit && compinit

# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'

# Aliases
alias watch='watch '
alias k='kubectl'
alias awsp='source _awsp'
alias g='git'
alias so='source'
alias soz='source ~/.zshrc'
alias sot='tmux source ~/.tmux.conf'
alias h='fc -lt "%F %T" 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias diff='diff -U1'
alias -g G='| grep -i'
alias -g L='| less'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias zmv='noglob zmv -W'

if [[ `command -v nvim` ]]; then
  alias v='nvim'
  alias vim='nvim'
  alias vimdiff='nvim -d'
else
  alias v='vim'
fi

url-encode() {echo $1 | nkf -WwMQ | sed 's/=$//g' | tr = % | tr -d '\n'}

# Disable beep
setopt no_beep
setopt no_list_beep

# Base directory for cd
cdpath=(
  ${HOME}/github/`whoami`
  ${HOME}/gitlab/work
  ${HOME}/bitbucket/work
  ${cdpath}
)

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history

# cdr
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true

# cdf with fzf
function fzf-cdr(){
  local sd=$(cdr -l | awk '{ print $2 }' | fzf --preview 'f() { sh -c "ls -AhFGl $1" }; f {}')
  if [ -n "$sd" ]; then
    BUFFER="cd ${sd}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-cdr
bindkey '^@' fzf-cdr

# direnv
[[ `command -v direnv` ]] && eval "$(direnv hook zsh)"

# pyenv
if [ -d "${HOME}/.pyenv" ]; then
   eval "$(pyenv init -)"
fi

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# goenv
if [ -d "${HOME}/.goenv" ]; then
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# kubectl autocomplete
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/#zsh
if [[ $commands[kubectl] ]] then;
  source <(kubectl completion zsh)
  complete -F __start_kubectl k
fi

# zsh-kubectl-prompt
# https://github.com/superbrothers/zsh-kubectl-prompt
if [[ -d "${HOME}/zsh-kubectl-prompt" ]] then;
  autoload -U colors; colors
  source ${HOME}/zsh-kubectl-prompt/kubectl.zsh
  RPROMPT='%{$fg[cyan]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
fi

# Docker rootless mode
# https://docs.docker.com/engine/security/rootless/
[[ "$(systemctl --user is-active docker.service 2> /dev/null)" = "active" ]] && export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Private settings that can not be published in the repository
[[ -f "${HOME}/.zshrc.private" ]] && source "${HOME}/.zshrc.private"

