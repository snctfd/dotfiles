#!/bin/bash

# TODO Assumes apt package manager - may add support for pacman etc in the future
sudo apt update
sudo apt dist-upgrade

ZSH=~/.oh-my-zsh
ZSH_CUSTOM="$ZSH/custom"

function apt_install() {
    if [[ ! -e "/usr/bin/$1" ]] then
        sudo apt install -y $1
    else
        echo "$1 already installed -- skipping"
    fi
}

function zsh_plugin_install() {
    local PLUGIN_DIR="$ZSH_CUSTOM/plugins/$1"
    if [[ ! -e "$PLUGIN_DIR" ]] then
        git clone "https://github.com/zsh-users/$1.git" "$PLUGIN_DIR"
    else 
        echo "$1 already installed at $PLUGIN_DIR -- skipping"
    fi
}

apt_install zsh

cp ~/.zshrc ~/.zshrc.bak
cp -f .zshrc ~


# install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc 
zsh_plugin_install zsh-syntax-highlighting
zsh_plugin_install zsh-autosuggestions

