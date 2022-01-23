# machine specific setup pre zshrc:
[ -e "$HOME/pre.zshrc" ] && source ~/pre.zshrc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship" # https://github.com/denysdovhan/spaceship-prompt
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  time          # Time stamps section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_DIR_TRUNC_PREFIX=…/
SPACESHIP_DIR_COLOR=blue
SPACESHIP_GIT_BRANCH_COLOR=cyan
SPACESHIP_GIT_STATUS_COLOR=cyan
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=false
SPACESHIP_TIME_COLOR=241
SPACESHIP_EXEC_TIME_COLOR=241
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL=
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "

# oh-my-zsh settings
HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd" # three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

plugins=(
  copydir # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copydir
  docker-compose # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose
  sudo # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
  z # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z
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
alias dc="docker compose"
alias alpha="echo a b c d e f g h i j k l m n o p q r s t u v w x y z"

# usage: dkill {container name excerpt}
# example: dkill db
dkill() {
	docker ps -a -f status=running | grep $1 | awk '{ print $1 }' | xargs docker kill
}

ts() {
  date +"%s"
}

# macos date doesn't support milliseconds
milli() {
  date +"%s000"
}

# usage: tsdate {unix timestamp}
# example: tsdate 1606857140
tsdate() {
	date -u -r $1 +"%Y-%m-%d %H:%M:%S %Z"
}

# usage: millidate {millisecond timestamp}
# example: millidate 1605294533718
millidate() {
	date -u -r $(( ($1 + 500) / 1000 )) +"%Y-%m-%d %H:%M:%S %Z" 
}

# sources env variables for an aws profile
# usage: aws_profile {profile name}
aws_profile() {
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1);
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1);
  export AWS_DEFAULT_REGION=$(aws configure get region --profile $1);
  echo "$1 environment variables exported";
}

# intellij fixes
export HISTFILE=$HOME/.zsh_history # fix history
bindkey "\e\eOD" backward-word # fix moving cursor by word in intellij terminal
bindkey "\e\eOC" forward-word # fix moving cursor by word in intellij terminal

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)

# machine specific setup post zshrc:
[ -e "$HOME/post.zshrc" ] && source ~/post.zshrc
