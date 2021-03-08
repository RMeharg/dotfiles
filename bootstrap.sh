#!/usr/bin/env bash

set -euf -o pipefail

root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck source=helpers/utils.sh
source "$root_dir/helpers/utils.sh"

if ! is_macos; then
  echo "Unrecognized system uname: $(uname -s) - exiting"
else
  "$root_dir"/homebrew/install.sh
  "$root_dir"/vim/install.sh
  "$root_dir"/zsh/install.sh
  "$root_dir"/homeshick/install.sh
  "$root_dir"/tmux/install.sh
fi

exit 0 

echo "Creating/updating symlinks..."
ln -sf "${SCRIPT_DIR}"/.zshrc ~/.zshrc
ln -sf "${SCRIPT_DIR}"/.antigen.zsh ~/.antigen.zsh
ln -sf "${SCRIPT_DIR}"/.antigenrc ~/.antigenrc
ln -sf "${SCRIPT_DIR}"/.p10k.zsh ~/.p10k.zsh

ln -sf "${SCRIPT_DIR}"/.brewfile ~/.brewfile

ln -sf "${SCRIPT_DIR}"/.inputrc ~/.inputrc

ln -sf "${SCRIPT_DIR}"/.custom_aliases ~/.custom_aliases

ln -sf "${SCRIPT_DIR}"/.tmux ~/.tmux
ln -sf "${SCRIPT_DIR}"/.tmux.conf.local ~/.tmux.conf.local

ln -sf "${SCRIPT_DIR}"/.vim ~/.vim
ln -sf "${SCRIPT_DIR}"/.vimrc.local ~/.vimrc.local

ln -sf "${SCRIPT_DIR}"/.git-authors ~/.git-authors
ln -sf "${SCRIPT_DIR}"/.gitconfig ~/.gitconfig
ln -sf "${SCRIPT_DIR}"/.gitignore_global ~/.gitignore_global

ln -sf "${SCRIPT_DIR}"/com.googlecode.iterm2.plist ~/com.googlecode.iterm2.plist

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # If available, use LSB to identify distribution
  if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
    export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
  # Otherwise, use release info file
  else
    export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
  fi
  # For everything else (or if above failed), just use generic identifier
  [ "$DISTRO" == "" ] && export DISTRO=$OSTYPE

  # Check package manager...
  if [[ -n "command -v apt-get" ]]; then
    sudo apt-get install -y zsh
  elif [[ -n "command -v yum" ]]; then
    sudo yum install -y zsh
  else
    echo "Unsupported distro, exiting..."
    exit 1 
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew update
  brew tap Homebrew/bundle
  brew bundle --file="${SCRIPT_DIR}/.brewfile"
  if [[ "$SHELL" -ne "/bin/zsh" ]]; then
  chsh -s $(which zsh)
  fi
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
  echo "TODO: Support cygwin, exiting..."
  exit 1 
elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  echo "TODO: Support MinGW, exiting..."
  exit 1 
elif [[ "$OSTYPE" == "win32" ]]; then
  # I'm not sure this can happen.
  echo "Unsupported distro, exiting..."
  exit 1 
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # no.
  echo "Unsupported distro, exiting..."
  exit 1 
else
  # Unknown.
  echo "Unknown distro, exiting..."
  exit 1
fi
