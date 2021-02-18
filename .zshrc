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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/altoros/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/altoros/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/altoros/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/altoros/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
