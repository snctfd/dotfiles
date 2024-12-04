#!/bin/bash

# TODO Assumes apt package manager - may add support for pacman etc in the future
sudo apt update
sudo apt dist-upgrade

INSTALL_PACKAGES="zsh git fzf"
sudo apt install -y $INSTALL_PACKAGES

./setup-git.sh
./setup-zsh.sh
