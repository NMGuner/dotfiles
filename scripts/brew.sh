#!/usr/bin/env zsh

echo "Installing Homebrew formulae and casks..."

which -s brew
if [[ $? != 0 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # A fresh install isn't on PATH yet; load it for the rest of this script
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Turn off analytics
brew analytics off

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Upgrade any already-installed cask.
brew upgrade --cask

# Check if HOMEBREW_PREFIX is defined
if [ -z "$HOMEBREW_PREFIX" ]; then
    export HOMEBREW_PREFIX="$(brew --prefix)"
fi

# Install brew formulae and casks from Brewfile
brew bundle install --file=Brewfile

# Remove stale lock files and outdated downloads for all formulae and casks, and remove old versions of installed formulae
brew cleanup

# Uninstall formulae that were only installed as a dependency of another formula and are now no longer needed
brew autoremove

echo "Homebrew formulae and casks have been installed."