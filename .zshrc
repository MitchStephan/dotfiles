# shell startup profile (see corresponding line at end of .zshrc)
# zmodload zsh/zprof

# usage: load_dotfile {filename}
load_dotfile() {
  [ -e "$HOME/$1" ] && source ~/$1
}

# [required] load machine specific setup `~/pre.zshrc` file (defines $DOTFILES)
load_dotfile "pre.zshrc"

source "$DOTFILES/zshrc/main.zsh"

# intellij fixes
export HISTFILE=$HOME/.zsh_history # fix history
bindkey "\e\eOD" backward-word # fix moving cursor by word in intellij terminal
bindkey "\e\eOC" forward-word # fix moving cursor by word in intellij terminal

# [optional] load machine specific setup `~/post.zshrc` file
load_dotfile "post.zshrc"

# shell startup profiler
# zprof
