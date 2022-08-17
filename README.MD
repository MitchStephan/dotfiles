# Dotfiles

This is my own variant of a dotfiles repo. This repo does not install dependencies (I haven't needed to setup machines enough to do this yet), it only documents dependencies and manages shared configuration files.

### Set Up
1. install homebrew and git
1. clone this repo
1. create machine specific setup `~/pre.zshrc` file (defines `$DOTFILES`)
1. install dotfile via `./scripts/install_dotfile.sh {dotfile}`

### Supported dotfiles
- `.gitconfig`
- `.tmux.conf`
- `.zshrc`

### Scripts
Backup existing (if exists) and install dotfile:  
```
./scripts/install_dotfile.sh {dotfile}
```
Refer to [supported dotfiles](supported-dotfiles) section for {dotfile} input
