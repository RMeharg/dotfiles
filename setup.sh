#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

MY_DIR="$(dirname "$0")"

echo "Creating/updating symlinks..."
ln -sf "${MY_DIR}"/.bash_it ~/.bash_it
ln -sf "${MY_DIR}"/.bash_profile ~/.bash_profile
ln -sf "${MY_DIR}"/.custom_aliases ~/.custom_aliases
ln -sf "${MY_DIR}"/.inputrc ~/.inputrc

ln -sf "${MY_DIR}"/.tmux ~/.tmux
ln -sf "${MY_DIR}"/.tmux.conf.local ~/.tmux.conf.local

ln -sf "${MY_DIR}"/.vim ~/.vim
ln -sf "${MY_DIR}"/.vimrc.local ~/.vimrc.local

ln -sf "${MY_DIR}"/.git-authors ~/.git-authors
ln -sf "${MY_DIR}"/.gitconfig ~/.gitconfig
ln -sf "${MY_DIR}"/.gitignore_global ~/.gitignore_global

ln -sf "${MY_DIR}"/com.googlecode.iterm2.plist ~/com.googlecode.iterm2.plist

echo "Patching bobby-custom bash-it theme..."
mkdir -p ~/.bash_it/themes/bobby-custom/
cp "${MY_DIR}"/bobby-custom.theme.bash ~/.bash_it/themes/bobby-custom/
