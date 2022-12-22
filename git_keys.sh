#!/bin/bash

echo "Generating git keys..."
if [[ ! -e ~/.ssh/id_ed25519 ]] then
    ssh-keygen -t ed25519 -C "evelyn@snctfd.io" -f ~/.ssh/id_ed25519
    ssh-add ~/.ssh/id_ed25519
fi