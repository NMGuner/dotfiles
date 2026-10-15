#!/usr/bin/env zsh

# Check if oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # --unattended: don't change the default shell or start a new zsh session
    # --keep-zshrc: keep the .zshrc copied from this repo instead of replacing it
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

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
