# Dotfiles

### Set Up
1. install homebrew via `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. install git via `brew install git`
3. clone this repo
4. install brew bundle via `brew bundle install`
5. create machine specific setup `~/pre.zshrc` file (it should at least export the `$DOTFILES` env variable)
6. install dotfile via `./scripts/install_dotfile.sh {dotfile}`

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
