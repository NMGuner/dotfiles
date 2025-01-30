#!/usr/bin/env zsh

function configureIt() {
	rsync -avh --no-perms dotfiles/ ~;
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
	configureIt;
else
	if [[ "$SHELL" == *"zsh" ]]; then
        echo "This may overwrite existing files in your home directory. Are you sure? (y/n) \c";
        read -q REPLY;
        echo "";
    else
        read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
        echo "";
    fi

	if [[ $REPLY =~ ^[Yy]$ ]]; then
		configureIt;
	fi;
fi;
unset configureIt;

echo "Dotfiles have been copied to your home directory.";
