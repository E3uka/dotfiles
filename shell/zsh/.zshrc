. $(brew --prefix)/etc/profile.d/z.sh

# General Purpose Aliases
alias docker-compose="docker compose"
alias docker="/Applications/Docker.app/Contents/Resources/bin/docker"
alias la="eza -a"
alias ll="eza -alhF"
alias ls="eza"
alias rgfu="rg -i future --trim --no-hidden --no-ignore"
alias rgto="rg -i todo --trim --no-hidden --no-ignore"
alias srcz="source ~/Projects/dotfiles/shell/zsh/.zshrc"
alias up="cd .."
alias vbe="vi ~/Projects/dotfiles/shell/bat/config"
alias vge="vi ~/.config/ghostty/config"
alias vi="nvim"
alias vse="vi ~/Projects/dotfiles/editor/.config/nvim/init.vim"
alias vze="vi ~/Projects/dotfiles/shell/zsh/.zshrc"

# Git Aliases
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdw="git diff --word-diff=color --word-diff-regex='\\w+'"
alias gl="git log --all --graph --oneline --decorate -n"
alias gs="git status"
alias gsh="git show"
alias gshd="git show --word-diff=color --word-diff-regex='\\w+'"
alias gw="git worktree"
alias gwa="git worktree add"
alias gwl="git worktree list"
alias gwr="git worktree remove"

# Safety Aliases
alias rm="rm -i"
alias rmrf="rm -i"
alias mv="mv -i"

# Default Editor
export EDITOR='nvim'

# SSH Agent
export SSH_AUTH_SOCK='/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock'

# FZF and ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case'

# Zig
path+=('/Users/ebuka/Projects/zig')

# Jujutsu GG
path+=('/Applications/gg.app/Contents/MacOS/')

# Go
path+=('/Users/ebuka/go/bin')
path+=('/opt/homebrew/opt/go@1.24/bin')
export GOPATH='/Users/ebuka/go'

# Docker
path+=('/Applications/Docker.app/Contents/Resources/bin')

# Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS

# -- Cynergy Settings --

# Git
#export GIT_SSH_COMMAND='ssh -i ~/.ssh/id_ed25519_cynergy'
export GOPRIVATE='gitlab.com/cynergybank'

# IBM MQ
path+=('/opt/mqm/bin')
path+=('/opt/mqm/samp/bin')

# Temporal
export TEMPORAL_VERSION=1.22.4
export TEMPORAL_UI_VERSION=2.21.0
export ELASTICSEARCH_VERSION=7.16.2
export SQL_TLS=true
export SQL_TLS_DISABLE_HOST_VERIFICATION=true
export SQL_TLS_ENABLED=true
export SQL_HOST_VERIFICATION=false

# GPG Key
export GPG_PASSPHRASE='JI9Dq7CjwzkScBknvT20VHqgJEex6Txo'

# Kubernetes
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ebuka/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ebuka/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ebuka/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ebuka/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/go@1.24/bin:$PATH"
