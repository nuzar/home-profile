#!/bin/zsh
#
# This file, .zshrc, is sourced by zsh for each interactive shell session.
#
# Note: For historical reasons, there are other dotfiles, besides .zshenv and
# .zshrc, that zsh reads, but there is really no need to use those.

#zmodload zsh/zprof

export _MY_DEBUG=

function debug_log() {
  if test -z $_MY_DEBUG; then
    return
  fi
  echo "$(date)" "$@"
}

# User configuration
if [[ PROFILE_IMPORTED -ne 1 ]] {
    test -r ~/.profile && source ~/.profile
}

debug_log "start read nix profiles"
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/$USER/channels${NIX_PATH:+:$NIX_PATH}
source $HOME/.nix-profile/etc/profile.d/nix.sh;
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

# The construct below is what Zsh calls an anonymous function; most other
# languages would call this a lambda or scope function. It gets called right
# away with the arguments provided and is then discarded.
# Here, it enables us to use scoped variables in our dotfiles.
() {
  # `local` sets the variable's scope to this function and its descendendants.
  # local gitdir=~/Git  # Where to keep repos and plugins

  # Load all of the files in rc.d that start with <number>- and end in .zsh
  # (n) sorts the results in numerical order.
  # <-> is an open-ended range. It matches any non-negative integer.
  # <1-> matches any integer >= 1. <-9> matches any integer <= 9.
  # <1-9> matches any integer that's >= 1 and <= 9.
  local file=
  for file in $ZDOTDIR/rc.d/<->-*.zsh(n); do
    debug_log "load $file"
    source $file
  done
  debug_log "loading finish"
} "$@"
# $@ expands to all the arguments that were passed to the current context (in
# this case, to `zsh` itself).
# "Double quotes" ensures that empty arguments '' are preserved.
# It's a good practice to pass "$@" by default. You'd be surprised at all the
# bugs you avoid this way.
debug_log "finish anonymous function"


# direnv
eval "$(direnv hook zsh)"


# golang
#eval `go env`
export PATH=$PATH:$(go env GOPATH)/bin
# used by go-torch
#export PATH=$PATH:~/tools/FlameGraph


# js
export PATH=$PATH:~/.yarn/bin
export PATH=$HOME/.npm-global/bin:$PATH

# java
#export JAVA_HOME=/etc/alternatives/java_sdk


# nvim
export EDITOR="nvim"
export VISUAL="nvim"


# python
export PYCURL_SSL_LIBRARY=nss
if test -d "$HOME/.pyenv"; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
  eval "$(pyenv init --path zsh)"
fi


# rust
export RUSTUP_DIST_SERVER=https://mirrors.cernet.edu.cn/rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.cernet.edu.cn/rustup/rustup
test -r $HOME/.cargo/env && source $HOME/.cargo/env


# tmux
export TMUX_TMPDIR="/tmp"
