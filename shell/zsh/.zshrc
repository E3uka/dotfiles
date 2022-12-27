. $(brew --prefix)/etc/profile.d/z.sh

# Wasmer
export WASMER_DIR="/Users/ebuka/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# General Purpose Aliases
alias vi="nvim"
alias rgto="rg -i todo --trim --no-hidden --no-ignore"
alias rgfu="rg -i future --trim --no-hidden --no-ignore"
alias ls="exa"
alias la="exa -a"
alias ll="exa -alhF"
alias tnew="tmux new -s"
alias ta="tmux attach -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"
alias gcl="git clone"
alias nvi="neovide"
alias srcz="source ~/.zshrc"
alias srct="tmux source-file ~/.tmux.conf"
alias vse="vi ~/Projects/dotfiles/editor/.config/nvim/init.vim"
alias vze="vi ~/Projects/dotfiles/shell/zsh/.zshrc"
alias up="cd .."
alias :q="exit"

# Git Aliases
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --all --graph --oneline --decorate -n"
alias gwd="git diff --word-diff=color --word-diff-regex='\\w+'"
alias gsd="git show --word-diff=color --word-diff-regex='\\w+'"

# Safety Aliases
alias rm="rm -i"
alias rmrf="rm -i"
alias mv="mv -i"

# FZF and ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git/"'

# Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS
