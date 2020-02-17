# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# machine specific setup pre zshrc:
[ -e "$HOME/pre.zshrc" ] && source ~/pre.zshrc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship" # https://github.com/denysdovhan/spaceship-prompt
SPACESHIP_PROMPT_ORDER=(
#   user          # Username section
  dir           # Current directory section
#   host          # Hostname section
  git           # Git section (git_branch + git_status)
  time          # Time stamps section
#   docker        # Docker section
#   aws           # Amazon Web Services section
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

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="`true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  docker-compose
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  # zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"e

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
alias vi="vim"
alias dc="docker-compose"
alias alpha="echo a b c d e f g h i j k m n o p q r s t u v w x y z"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'

# usage: dkill {string}
dkill() {
	docker ps -a -f status=running | grep $1 | awk '{ print $1 }' | xargs docker kill
}

# fix moving cursor by word in intellij terminal
bindkey "\e\eOD" backward-word
bindkey "\e\eOC" forward-word

# machine specific setup post zshrc:
[ -e "$HOME/post.zshrc" ] && source ~/post.zshrc
