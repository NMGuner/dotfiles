#!/usr/bin/env bash

set -e

sudo -v;

# Get confirmation from user
read -p "This may overwrite existing files and configurations in your home directory. Are you sure? (y/n) " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Starting bootstrap process...";

    # Run dotfiles.sh
    ./scripts/dotfiles.sh --force

    # Run brew.sh
    ./scripts/brew.sh

    # Run asdf.sh
    ./scripts/asdf.sh

    # Run rust.sh
    ./scripts/rust.sh

    # Run android.sh
    ./scripts/android.sh

    # Run zsh.sh
    ./scripts/zsh.sh

    # Run macos.sh
    ./scripts/macos.sh --force

    echo "Bootstrap process completed.";
fi;