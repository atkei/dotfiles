# Private settings that can not be published in the repository
[[ -f "${HOME}/.zshrc.private" ]] && source "${HOME}/.zshrc.private"

# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

typeset -gU path cdpath fpath mailpath
typeset -gU PATH CDPATH FPATH MAILPATH

# Completion
autoload -U bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'

# Aliases
alias watch='watch '
alias k='kubectl'
alias awsp='source ~/.awsp-wrapper'
alias g='git'
alias so='source'
alias soz='source ~/.zshrc'
alias sot='tmux source ~/.tmux.conf'
alias h='fc -lt "%F %T" 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='cd ../'
alias diff='diff -U1'
alias -g G='| grep -i'
alias -g L='| less'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias zmv='noglob zmv -W'
alias tf='terraform'
alias v='vim'
alias vim='vim'
alias vimdiff='vim -d'

url-encode() {echo $1 | nkf -WwMQ | sed 's/=$//g' | tr = % | tr -d '\n'}

# Disable beep
setopt no_beep
setopt no_list_beep

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
[ $commands[direnv] ] && eval "$(direnv hook zsh)"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# kubectl completion
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


# Helm completion
[ $commands[helm] ] && source <(helm completion zsh)

# Minikube completion
[ $commands[minikube] ] && source <(minikube completion zsh)

# Github CLI completion
[ $commands[gh] ] && source <(gh completion -s zsh)

# Pulumi completion
[ $commands[pulumi] ] && source <(pulumi gen-completion zsh)

# JAVA_HOME (asdf)
[ -s ~/.asdf/plugins/java/set-java-home.zsh ] && . ~/.asdf/plugins/java/set-java-home.zsh

# FLUTTER_ROOT (asdf)
[[ $(asdf where flutter 2> /dev/null) ]] && export FLUTTER_ROOT="$(asdf where flutter)"

# AWS CLI completion (asdf)
[ -s $HOME/.asdf/shims/aws_completer ] && complete -C '$HOME/.asdf/shims/aws_completer' aws

# Terraform completion (asdf)
[ -s $HOME/.asdf/shims/terraform ] && complete -o nospace -C "$HOME/.asdf/shims/terraform" terraform

# Azure CLI completion
if [[ -f "$HOME/.azure/az.completion" ]] then;
  source $HOME/.azure/az.completion
fi

# Docker rootless mode
# https://docs.docker.com/engine/security/rootless/
[[ "$(systemctl --user is-active docker.service 2> /dev/null)" = "active" ]] && export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# WSL
if [ -n "$(which wslpath)" ]; then
  export DONT_PROMPT_WSL_INSTALL=true
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx
  if ! pgrep -x fcitx >/dev/null; then
    fcitx > /dev/null 2>&1
  fi
fi

function aws-mfa() {
  local MFA_ARN=$1
  local MFA_CODE=$2

  if [[ -z "$MFA_ARN" || -z "$MFA_CODE" ]]; then
    echo "Usage: mfa <MFA_ARN> <MFA_CODE>"
    return 1
  fi

  local SESSION_JSON=$(aws sts get-session-token --serial-number "$MFA_ARN" --token-code "$MFA_CODE" --output json 2>/dev/null)

  if [[ -z "$SESSION_JSON" ]]; then
    echo "Failed to get session token. Check your MFA ARN and code."
    return 1
  fi

  export AWS_ACCESS_KEY_ID=$(echo "$SESSION_JSON" | jq -r '.Credentials.AccessKeyId')
  export AWS_SECRET_ACCESS_KEY=$(echo "$SESSION_JSON" | jq -r '.Credentials.SecretAccessKey')
  export AWS_SESSION_TOKEN=$(echo "$SESSION_JSON" | jq -r '.Credentials.SessionToken')

  echo "AWS credentials updated successfully."
}

function unset-aws-mfa() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
}
