alias alpha="echo a b c d e f g h i j k l m n o p q r s t u v w x y z"
alias dc="docker-compose"
alias dotfiles="cd $DOTFILES"
alias vi="vim"

# prefer zoxide (z) over cd
# install: brew install zoxide
if [ -x "$(command -v z)" ]; then
	alias cd="z" # (z => zoxide)
fi
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# prefer eza over ls & ll for colors and better info
# install: brew install eza
if [ -x "$(command -v eza)" ]; then
	alias ll="ls" # ll => ls => eza
	alias ls="eza -a --long --header --group-directories-first"
	alias tree="eza -a --long --header --group-directories-first --tree --level 2"
else
	alias ll="ls -al"
fi

# prefer bat over cat
# brew install bat
if [ -x "$(command -v bat)" ]; then
	alias cat="bat" # (use cat -p for normal cat behavior)
fi