source $DOTFILES/zshrc/aliases.zshrc
source $DOTFILES/zshrc/exports.zshrc
source $DOTFILES/zshrc/functions.zshrc

# load prompt
source $DOTFILES/zshrc/prompt/starship/starship_prompt.zshrc

# to install: brew install zsh-autosuggestions
try_src /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# to install: brew install sh-syntax-highlighting
try_src /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
