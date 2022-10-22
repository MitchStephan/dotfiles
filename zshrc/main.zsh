source $DOTFILES/zshrc/aliases.zsh
source $DOTFILES/zshrc/exports.zsh
source $DOTFILES/zshrc/functions.zsh

# history settings
export SAVEHIST=10000         # number of commands that are stored in the zsh history file
export HISTSIZE=10000         # number of commands that are loaded into memory from the history file
setopt share_history          # share command history data across terminals (implicit inc_append_history)
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space

# load prompt
source $DOTFILES/zshrc/prompt/starship/starship_prompt.zsh

# to install: brew install sh-syntax-highlighting
try_src /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# to install: brew install zsh-autosuggestions
try_src /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# to install: brew install fzf
source $DOTFILES/zshrc/fzf.zsh

# to install: brew install zoxide
type zoxide &> /dev/null && eval "$(zoxide init zsh)"
