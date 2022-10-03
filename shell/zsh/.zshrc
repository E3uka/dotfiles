. $(brew --prefix)/etc/profile.d/z.sh

# Wasmer
export WASMER_DIR="/Users/ebuka/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# General Purpose Aliases
alias vi="nvim"
alias up="cd .."
alias rgto="rg -i todo --trim"
alias l="exa"
alias la="exa -a"
alias ll="exa -alhF"
alias ta="tmux attach -t"
alias tkill="tmux kill-session -t"
alias tls="tmux ls"
alias gcl="git clone"
alias nvi="neovide"

# Git Aliases
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gl="git log --all --graph --oneline --decorate -n 20"

# Safety Aliases
alias rm="rm -i"
alias mv="mv -i"

# FZF and ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git/"'

# Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS
