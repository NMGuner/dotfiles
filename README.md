# NMGuner’s dotfiles

Personal configuration for setting up a MacOS system including the dotfiles, tools and applications.

## Installation

Firstly, clone the repository and review the contents and configuration in order to adjust to your liking. Following that, run the install script;

```bash
./bootstrap.sh
```
### Updating dotfiles

After the initial installation, making changes in the files inside `dotfiles` directory and executing `dotfiles.sh` will update the files in home directory.

### Other scripts

There are certain shell scripts here that setup more than just dotfiles in home directory such as `android.sh`, `asdf.sh` and so on. These can be used to update setup confiurations for the associated tools or system settings.

## Making updates

### Updating Brewfile

In order to update the Brewfile, you can run the following command to generate a new one:

```bash
brew bundle dump --file=Brewfile-$(date +%Y.%m.%d-%H.%M.%S) --force
```

This will create a new Brewfile with the current state of installed packages, which can then be reviewed and merged into the main `Brewfile`. The generated file will have a timestamp in its name for easy identification and these files are ignored in version control.

If you want to update the Brewfile without creating a new one and skip reviewing, you can run:

```bash
brew bundle dump --file=Brewfile --force
```
