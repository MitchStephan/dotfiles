# https://github.com/starship/starship

# to install fonts for terminal:
# brew tap homebrew/cask-fonts
# brew install --cask font-hack-nerd-font font-fira-code-nerd-font

export STARSHIP_CONFIG=$DOTFILES/zshrc/prompt/starship/starship.toml

eval "$(starship init zsh)"
