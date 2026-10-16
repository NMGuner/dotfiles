#!/usr/bin/env bash

set -e

# Run from the repo root so the ./scripts paths below work from any folder
cd "$(dirname "$0")" || exit 1

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

    # Load Homebrew into PATH for the remaining scripts (needed on a fresh install)
    eval "$(/opt/homebrew/bin/brew shellenv)"

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