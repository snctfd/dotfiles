#!/bin/bash

if [[ ! -e ~/.ssh/id_ed25519 ]] then
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "evelyn@snctfd.io" -f ~/.ssh/id_ed25519
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
else 
    echo "Skipping generation of SSH key!"
fi

git config --global user.email "evelyn@snctfd.io"
git config --global user.name "Evelyn Beck"