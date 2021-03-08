#!/bin/bash

# step 1
mkdir -p ~/workspace 

# step 2
git clone https://github.com/rmeharg/dotfiles.git ~/workspace/dotfiles

# step 3
~/workspace/dotfiles/bootstrap.sh
