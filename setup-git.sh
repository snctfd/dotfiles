#!/bin/bash

echo "Setting up SSH key and Git config..."

read -p "Enter e-mail to use for key generation and Git config: " EMAIL
read -p "Enter full name to use for Git config: " FULLNAME

if [[ ! -e ~/.ssh/id_ed25519 ]] then
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
else 
    echo "Skipping generation of SSH key!"
fi

git config --global user.email "$EMAIL"
git config --global user.name "$FULLNAME"
