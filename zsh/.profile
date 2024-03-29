#source /etc/profile

# alias
test -r $HOME/.alias && source $HOME/.alias

# proxy
proxy_host=127.0.0.1
#proxy_host="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
proxy_port=50000
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
