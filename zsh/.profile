#source /etc/profile

# alias
test -r $HOME/.alias && source $HOME/.alias

# nvim
export EDITOR="nvim"
export VISUAL="nvim"

# tmux
export TMUX_TMPDIR="/tmp"

# proxy
proxy_host=127.0.0.1
#proxy_host="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
proxy_port=1999
set_proxy() {
  export http_proxy=http://${proxy_host}:${proxy_port}
  export https_proxy=http://${proxy_host}:${proxy_port}
  export all_proxy=http://${proxy_host}:${proxy_port}
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
  export ALL_PROXY=$all_proxy
}
unset_proxy() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset ALL_PROXY
}

#export PATH=$PATH:"/mnt/c/Users/myuser/AppData/Local/Programs/Microsoft VS Code/bin"
test -r $HOME/.profile.local && source $HOME/.profile.local

# Set non-default Git remotes for Homebrew/brew and Homebrew/homebrew-core.
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

# /home/linuxbrew/.linuxbrew/bin/brew shellenv zsh
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
# fpath[1,0]="/home/linuxbrew/.linuxbrew/share/zsh/site-functions";
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:${PATH}"


# rust
export RUSTUP_DIST_SERVER=https://mirrors.cernet.edu.cn/rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.cernet.edu.cn/rustup/rustup
test -r $HOME/.cargo/env && source $HOME/.cargo/env

# golang
#eval `go env`
export PATH=$PATH:$(go env GOPATH)/bin
# used by go-torch
#export PATH=$PATH:~/tools/FlameGraph


# js
# export PATH=$PATH:~/.yarn/bin
# export PATH=$HOME/.npm-global/bin:$PATH
