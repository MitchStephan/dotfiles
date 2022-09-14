source $DOTFILES/zshrc/aliases.zshrc
source $DOTFILES/zshrc/exports.zshrc
source $DOTFILES/zshrc/functions.zshrc

# load prompt
source $DOTFILES/zshrc/prompt/starship/starship_prompt.zshrc

# to install: brew install zsh-autosuggestions
try_src /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# set history settings (used by autosuggestions)
setopt share_history          # share command history data across terminals
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space

# to install: brew install sh-syntax-highlighting
try_src /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
