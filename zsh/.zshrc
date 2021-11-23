if [ "$TMUX" = "" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Load Antigen & config
source ~/.antigen.zsh
antigen init ~/.antigenrc

# Powerlevel10k
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# ZSH plugins
plugins=(osx git git-flow brew history node npm kubectl vi-mode tmux)

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

# Neovim all the way!
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim

# Vi-mode
#bindkey -v

# buildpacks.io completion
. $(pack completion --shell zsh)

# GPG Keys for krypt
export GPG_TTY=$(tty)

# Helm
source ~/.helmrc

# gcloud
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

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

