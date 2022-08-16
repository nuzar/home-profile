export _MY_DEBUG=
function debug_log() {
  if test -z $_MY_DEBUG; then
    return
  fi
  echo "$(date)" "$@"
}

debug_log "start read .profile"
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

debug_log "start read nix profiles"
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
source $HOME/.nix-profile/etc/profile.d/nix.sh;
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

debug_log "finish read .profile"

