#!/usr/bin/env bash

set -e

sudo -v;

# Get confirmation from user
read -p "This may overwrite existing files and configurations in your home directory. Are you sure? (y/n) " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Starting bootstrap process...";

    # Run dotfiles.sh
    ./dotfiles.sh --force

    # Run brew.sh
    ./brew.sh

    # Run asdf.sh
    ./asdf.sh

    # Run android.sh
    ./android.sh

    # Run zsh.sh
    ./zsh.sh

    # Run macos.sh
    ./macos.sh --force

    echo "Bootstrap process completed.";
fi;