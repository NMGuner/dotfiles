#!/usr/bin/env zsh

echo "Installing asdf plugins and packages..."

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 22.13.1
asdf set --home nodejs latest
corepack enable
asdf reshim nodejs

asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf set --home golang latest

asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java latest:temurin-17
asdf set --home java latest:temurin-17

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf set --home ruby latest

asdf plugin add python
asdf install python 3.13.1
asdf install python 2.7.18
asdf set --home python 3.13.1 2.7.18

echo "asdf plugins and packages have been installed."
