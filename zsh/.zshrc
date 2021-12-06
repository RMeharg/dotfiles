if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG="en_US.UTF-8" # Fix for OneDark Theme

# Oh-My-ZSH + P10k
plugins=(macos git git-flow history systemadmin nmap kubectl helm golang fzf vi-mode tmux fancy-ctrl-z dotenv colorize common-aliases)
ZSH_TMUX_AUTOSTART=true
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto      
zstyle ':omz:update' frequency 13
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

# Homebrew add sbin to PATH
export PATH="/usr/local/sbin:$PATH"

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
	  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
	    zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
    }
pastefinish() {
	  zle -N self-insert $OLD_SELF_INSERT
  }
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

HISTFILE=~/.zsh_history # I'll cry if I lose my history
HISTSIZE=500000
SAVEHIST=$HISTSIZE

# Aliases
alias gs='git status'
alias gaa='git add -A'
alias gam='git commit --amend --no-edit --reset-author'
alias push='git push'
alias fpush='git push --force'
alias repush='git add -A && git commit --amend --no-edit --reset-author && git push --force'
alias pull='git pull --rebase'
alias gc='git commit -S -m'
alias gp='git pull --rebase'
alias finder='open .'
alias watch='watch '
alias vim='nvim'

# JDK Path
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Python
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3.9
export PATH="$PATH:/Users/altoros/Library/Python/3.9/bin"

# Golang
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Vi-mode
bindkey -v

# buildpacks.io completion
. $(pack completion --shell zsh)

# GPG Keys for krypt
export GPG_TTY=$(tty)

# Helm
source ~/.helmrc

# Slows shell alot but use kubecolor autocomplete
autoload -U compinit
compinit
alias k=kubecolor

## kubectl krew plugins
export PATH="${PATH}:${HOME}/.krew/bin"

# load z
if command -v brew >/dev/null 2>&1; then
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
