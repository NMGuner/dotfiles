#!/usr/bin/env zsh

# Sourcing zsh and zprofile to apply changes
source ~/.zshrc;
source ~/.zprofile;

# Update zinit if needed
zinit self-update

# Update plugins
zinit update --all

# Clear completions
zinit cclear

# Clear compdef
zinit cdclear

echo "Zsh setup is complete. Open a new terminal or run 'exec zsh' to load the changes."
