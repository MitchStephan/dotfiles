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
try_src $BREWHOME/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# to install: brew install zsh-autosuggestions
try_src $BREWHOME/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/junegunn/fzf to install: brew install fzf
try_src ~/.fzf.zsh

# to install: brew install zoxide
type zoxide &> /dev/null && eval "$(zoxide init zsh)"

# intellij fixes
export HISTFILE=$HOME/.zsh_history # fix history
bindkey "\e\eOD" backward-word # fix moving cursor by word in intellij terminal
bindkey "\e\eOC" forward-word # fix moving cursor by word in intellij terminal

# setup tab completion (init once per day)
autoload -Uz compinit
if [ $(find $HOME/.zcompdump -mtime +1 | wc -l) -gt 0 ]; then
  echo "initializing completion"
  compinit
  touch $HOME/.zcompdump # modify .zcompdump in case compinit didn't make changes
else
  compinit -C
fi
