#!/bin/zsh

##
# Commands, funtions and aliases
#
# Always set aliases _last,_ so they don't class with function definitions.
#


# These aliases enable us to paste example code into the terminal without the
# shell complaining about the pasted prompt symbol.
#alias %= \$=


# zmv lets you batch rename (or copy or link) files by using pattern matching.
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zmv
#autoload -Uz zmv
#alias zmv='zmv -Mv'
#alias zcp='zmv -Cv'
#alias zln='zmv -Lv'

# Note that, unlike Bash, there's no need to inform Zsh's completion system
# of your aliases. It will figure them out automatically.


# Set $PAGER if it hasn't been set yet. We need it below.
# `:` is a builtin command that does nothing. We use it here to stop Zsh from
# evaluating the value of our $expansion as a command.
# : ${PAGER:=less}


# Associate file .extensions with programs.
# This lets you open a file just by typing its name and pressing enter.
# Note that the dot is implicit. So, `gz` below stands for files ending in .gz
#alias -s {css,gradle,html,js,json,md,patch,properties,txt,xml,yml}=$PAGER
#alias -s gz='gzip -l'
#alias -s {log,out}='tail -F'


# Use `< file` to quickly view the contents of any file.
#READNULLCMD=$PAGER  # Set the program to use for this.

source ~/.nix-profile/share/fzf/key-bindings.zsh
source ~/.nix-profile/share/fzf/completion.zsh

# golang
#eval `go env`
export PATH=$PATH:$(go env GOPATH)/bin
# used by go-torch
#export PATH=$PATH:~/tools/FlameGraph

# rust
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
test -r $HOME/.cargo/env && source $HOME/.cargo/env

# python
export PYCURL_SSL_LIBRARY=nss
if test -d "$HOME/.pyenv"; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
  eval "$(pyenv init --path zsh)"
fi

# js
export PATH=$PATH:~/.yarn/bin

# java
#export JAVA_HOME=/etc/alternatives/java_sdk
