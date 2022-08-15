test -z "$PROFILEREAD" && . /etc/profile || true

export EDITOR="nvim"
export VISUAL="nvim"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export TMUX_TMPDIR="/tmp"

# ssh
if ! pgrep -u "$USER" ssh-agent &> /dev/null; then
    ssh-agent > "/tmp/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"/tmp/ssh-agent.env")" > /dev/null
fi

# alias
source $HOME/.alias

# golang
#eval `go env`
export PATH=$PATH:$(go env GOPATH)/bin
# used by go-torch
#export PATH=$PATH:~/tools/FlameGraph

# proxy
#proxy_host=localhost
proxy_host="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
set_proxy() {
  export http_proxy=http://${proxy_host}:1080
  export https_proxy=http://${proxy_host}:1080
  export ALL_PROXY=http://${proxy_host}:1080
}
unset_proxy() {
  unset http_proxy
  unset https_proxy
  unset ALL_PROXY
}

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

# local
export PATH=$PATH:~/.local/bin

# podman
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$UID
  if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    export XDG_RUNTIME_DIR=/tmp/$USER-runtime
    if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
      mkdir -m 0700 "$XDG_RUNTIME_DIR"
    fi
  fi
fi

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
