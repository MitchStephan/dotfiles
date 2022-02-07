# shell startup profile (see corresponding line at end of .zshrc)
# zmodload zsh/zprof

# usage: load_dotfile {filename}
load_dotfile() {
  [ -e "$HOME/$1" ] && source ~/$1
}

# install machine specific setup pre zshrc (pre.zshrc defines $DOTFILES)
load_dotfile "pre.zshrc"

source "$DOTFILES/zshrc/zshrc.zshrc"

# intellij fixes
export HISTFILE=$HOME/.zsh_history # fix history
bindkey "\e\eOD" backward-word # fix moving cursor by word in intellij terminal
bindkey "\e\eOC" forward-word # fix moving cursor by word in intellij terminal

# install machine specific setup post zshrc
load_dotfile "post.zshrc"

# shell startup profiler
# zprof
