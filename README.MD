# Dotfiles

This is my own variant of a dotfiles repo. This repo does not install dependencies (I haven't needed to setup machines enough to do this yet), it only documents dependencies and manages shared configuration files.


### Supported dotfiles
- `.gitconfig`
- `.tmux.conf`
- `.zshrc`

### Usage
Backup existing (if exists) and install dotfile:  
```
./scripts/install_dotfile.sh {dotfile}
```
