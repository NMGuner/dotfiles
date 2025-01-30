#!/usr/bin/env zsh

# Check if oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Sourcing zsh and zprofile to apply changes
source ~/.zshrc;
source ~/.zprofile;

# Update zinit if needed
zinit self-update

# Update plugins
zinit update

# Clear completions
zinit cclear

# Clear compdef
zinit cdclear

exec zsh
