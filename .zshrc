# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Antigen
source ~/.antigen.zsh
# Load Antigen configurations
antigen init ~/.antigenrc

# Powerlevel10k
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/workspace/github/rmeharg/dotfiles/.p10k.zsh.
[[ ! -f ~/workspace/github/rmeharg/dotfiles/.p10k.zsh ]] || source ~/workspace/github/rmeharg/dotfiles/.p10k.zsh

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

# Add z dir nav
eval "$(zoxide init zsh)"

HISTFILE=~/.zsh_history # I'll cry if I lose my history
HISTSIZE=500000
SAVEHIST=$HISTSIZE

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/altoros/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/altoros/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/altoros/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/altoros/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Color kubectl
alias kubectl="kubecolor "
# kubectl completion
source <(kubectl completion zsh)
# kubectl Alias
alias k=kubectl
complete -F __start_kubectl k # Allow autocomplete k
# kubectl aliases from https://github.com/ahmetb/kubectl-aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
# Print full command before exec
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }
# kubectl krew plugins
export PATH="${PATH}:${HOME}/.krew/bin"

alias gs='git status'
alias gaa='git add -A'
alias gam='git commit --amend --no-edit --reset-author'
alias push='git push'
alias fpush='git push --force'
alias repush='git add -A && git commit --amend --no-edit --reset-author && git push --force'

alias watch='watch '

export PATH="/usr/local/opt/openjdk/bin:$PATH"

# buildpacks.io completion
. $(pack completion --shell zsh)
