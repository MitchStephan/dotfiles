# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd" # three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

plugins=(
  # oh-my-zsh core plugins (~/.oh-my-zsh/plugins/)
  copydir # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copydir
  sudo # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
  z # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z

  # custom plugins (~/.oh-my-zsh/custom/plugins/)
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# source prompt before starting oh-my-zsh
# source $DOTFILES/zshrc/prompt/spaceship_prompt.zshrc
source $DOTFILES/zshrc/prompt/starship_prompt.zshrc

source $ZSH/oh-my-zsh.sh
