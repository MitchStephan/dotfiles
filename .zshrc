# shell startup profile (see corresponding line at end of .zshrc)
# zmodload zsh/zprof

# usage: load_dotfile {filename}
load_dotfile() {
  [ -e "$HOME/$1" ] && source ~/$1
}

# [required] load machine specific setup `~/pre.zshrc` file (defines $DOTFILES)
load_dotfile "pre.zshrc"

source "$DOTFILES/zshrc/main.zsh"

# [optional] load machine specific setup `~/post.zshrc` file
load_dotfile "post.zshrc"

# shell startup profiler
# zprof

