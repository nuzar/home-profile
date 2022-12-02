#!/bin/zsh

##
# Environment variables
#

# -U ensures each entry in these is Unique (that is, discards duplicates).
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath  # -T creates a "tied" pair; see below.

# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# Note that each value in an array is expanded separately. Thus, we can use ~
# for $HOME in each $path entry.
path=(
    $path
    ~/.local/bin
    ~/bin
    #/home/linuxbrew/.linuxbrew/bin(N)   # (N): null if file doesn't exist
)

# Add your functions to your $fpath, so you can autoload them.
fpath=(
    $ZDOTDIR/functions
    $fpath
    ~/.nix-profile/share/zsh/site-functions
    ~/.local/share/zsh/site-functions
)

if command -v brew > /dev/null; then
  # Add dirs containing completion functions to your $fpath and they will be
  # picked up automatically when the completion is initialized.
  # Here, we add it to the end of $fpath, so that we use brew's completions
  # only for those commands that zsh doesn't already know how to complete.
  fpath+=( $HOMEBREW_PREFIX/share/zsh/site-functions )
fi

autoload -Uz compinit
compinit

# don't make ssh completion based on hosts file
zstyle ':completion:*:ssh:*' hosts off
