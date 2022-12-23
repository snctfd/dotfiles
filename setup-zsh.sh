#!/bin/bash

echo "Setting up zsh..."

ZSH=~/.oh-my-zsh
ZSH_CUSTOM="$ZSH/custom"

function zsh_plugin_install() {
    local PLUGIN_DIR="$ZSH_CUSTOM/plugins/$1"
    if [[ ! -e "$PLUGIN_DIR" ]] then
        echo "Installing oh-my-zsh plugin $1..."
        git clone "https://github.com/zsh-users/$1.git" "$PLUGIN_DIR"
    else 
        echo "$1 already installed at $PLUGIN_DIR -- skipping"
    fi
}


cp -n ~/.zshrc ~/.zshrc.bak
cp -f .zshrc ~

# install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc 
zsh_plugin_install zsh-syntax-highlighting
zsh_plugin_install zsh-autosuggestions