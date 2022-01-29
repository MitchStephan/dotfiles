# source installed dotfile if installed
# usage: zsh_source_dotfile {filename}
zsh_source_dotfile() {
  [ -e "$HOME/$1" ] && source ~/$1
}

# install machine specific setup pre zshrc:
zsh_source_dotfile "pre.zshrc"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# install spaceship prompt
zsh_source_dotfile "spaceship_prompt.zshrc"

# oh-my-zsh settings
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

source $ZSH/oh-my-zsh.sh

# exports
export PATH="/usr/local/sbin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export EDITOR='vim'
export NVM_DIR="$HOME/.nvm"

# prefer exa over ls & ll for colors and better info
if [ -x "$(command -v exa)" ]; then
	alias ll="ls" # ll => ls => exa
	alias ls="exa -a --long --header --group-directories-first"
	alias tree="exa -a --long --header --group-directories-first --tree --level 2"
else
	alias ll="ls -al"
fi

# alises
alias dotfiles="cd ~/dotfiles"
alias vi="vim"
alias dc="docker-compose"
alias alpha="echo a b c d e f g h i j k l m n o p q r s t u v w x y z"

# usage: dkill {container name excerpt}
# example: dkill db
dkill() {
	docker ps -a -f status=running | grep $1 | awk '{ print $1 }' | xargs docker kill
}

# (epoch has better version of this)
ts() {
  date +"%s"
}

# macos date doesn't support milliseconds (epoch has better version of this)
milli() {
  date +"%s000"
}

# usage: tsdate {unix timestamp}
# example: tsdate 1606857140
# (epoch has better version of this)
tsdate() {
	date -u -r $1 +"%Y-%m-%d %H:%M:%S %Z"
}

# usage: millidate {millisecond timestamp}
# example: millidate 1605294533718
# (epoch has better version of this)
millidate() {
	date -u -r $(( ($1 + 500) / 1000 )) +"%Y-%m-%d %H:%M:%S %Z" 
}

# intellij fixes
export HISTFILE=$HOME/.zsh_history # fix history
bindkey "\e\eOD" backward-word # fix moving cursor by word in intellij terminal
bindkey "\e\eOC" forward-word # fix moving cursor by word in intellij terminal

# install machine specific setup post zshrc:
zsh_source_dotfile "post.zshrc"