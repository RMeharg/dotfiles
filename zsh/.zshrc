if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/homebrew/bin:$PATH
export LANG="en_US.UTF-8" # Fix for OneDark Theme

# Oh-My-ZSH + P10k
plugins=(macos git git-flow history systemadmin nmap kubectl helm golang fzf tmux fancy-ctrl-z dotenv colorize common-aliases)
#plugins=(macos git git-flow history systemadmin nmap kubectl helm golang fzf vi-mode tmux fancy-ctrl-z dotenv colorize common-aliases)
ZSH_TMUX_AUTOSTART=true
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

# load z
if command -v brew >/dev/null 2>&1; then
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

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
alias gam='git duet-commit -v --amend --no-edit --reset-author'
alias push='git push'
alias fpush='git push --force'
alias repush='git add -A && git duet-commit -v --amend --no-edit --reset-author && git push --force'
alias pull='git pull --rebase'
alias gc='git duet-commit -v -S -m'
alias squash='git reset $(git merge-base main $(git branch --show-current))'
alias gitsuperclean='git reset --hard; git clean --force -d -x'
alias branches='git branch -a'
alias checkout='git checkout '
alias stash='git stash --include-untracked'
alias pop='git stash pop'

alias finder='open .'
alias watch='watch '
alias vim='nvim'
alias zshrc='vim ~/.zshrc'

alias bosh='bosh-cli '

export GIT_DUET_GLOBAL=true

# JDK Path
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Python
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3.9
export PATH="$PATH:/Users/altoros/Library/Python/3.9/bin"

# Golang
export GOPATH=$(go env GOPATH)
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#export GOPRIVATE=go.video.xarth.tv,code.justin.tv
#export GO111MODULE=on

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Ruby rbenv
eval "$(rbenv init -)"

# Node Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Vi-mode
bindkey -v

# buildpacks.io completion
. $(pack completion --shell zsh)

# GPG Keys for krypt
export GPG_TTY=$TTY

# Helm
[ -f ~/.helmrc ] && source ~/.helmrc

# Slows shell alot but use kubecolor autocomplete
# autoload -U compinit
# compinit
# alias k=kubecolor

## kubectl krew plugins
export PATH="${PATH}:${HOME}/.krew/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s "/Users/altoros/.gvm/scripts/gvm" ]] && source "/Users/altoros/.gvm/scripts/gvm"

export TFENV_ARCH=amd64

alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'
alias axbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

alias cf6='/usr/local/homebrew/Cellar/cf-cli@6/6.53.0/bin/cf6 '
