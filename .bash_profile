#!/usr/bin/env bash

unset MAILCHECK
export BASH_IT="/Users/codesavvy/.bash_it"
export BASH_IT_THEME='bobby-custom'
export SCM_CHECK=true
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

source ~/.custom_aliases

# Everything else
eval "$(thefuck --alias)"

# TMUX on startup
tmux attach &> /dev/null
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

# Load z
. /usr/local/etc/profile.d/z.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/codesavvy/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/codesavvy/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/codesavvy/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/codesavvy/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# GVM
[[ -s "/Users/codesavvy/.gvm/scripts/gvm" ]] && source "/Users/codesavvy/.gvm/scripts/gvm"

# PATH stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

