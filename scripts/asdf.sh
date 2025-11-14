#!/usr/bin/env zsh

echo "Updating existing asdf plugins..."
asdf plugin update --all

echo "Installing asdf plugins and packages..."

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf cmd nodejs update-nodebuild
asdf install nodejs lts
asdf set --u nodejs latest
corepack enable
corepack prepare pnpm@latest --activate
asdf reshim nodejs

asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf set --u golang latest

asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java latest:temurin-17
asdf set --u java latest:temurin-17

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf set --u ruby latest

asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf install python 3.14.0
asdf install python 2.7.18
asdf set --u python 3.14.0 2.7.18

asdf plugin add pipx https://github.com/yozachar/asdf-pipx.git
asdf install pipx latest
asdf set --u pipx latest

asdf plugin add uv https://github.com/asdf-community/asdf-uv.git
asdf install uv latest
asdf set --u uv latest

echo "asdf plugins and packages have been installed."
