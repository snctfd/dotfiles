#!/bin/bash

# TODO Assumes apt package manager - may add support for pacman etc in the future
sudo apt update
sudo apt dist-upgrade

function apt_install() {
    if [[ ! -e "/usr/bin/$1" ]] then
        sudo apt install -y $1
    else
        echo "$1 already installed -- skipping"
    fi
}

apt_install zsh

./setup-zsh.sh
./git_keys.sh
