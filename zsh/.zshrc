if test ! -r /etc/zshrc; then
	source $HOME/.config/zsh/suse-zshrc
fi

# User configuration
if [[ PROFILE_IMPORTED -ne 1 ]] {
    test -r ~/.profile && source ~/.profile
}

HISTFILE="$HOME/.zsh_history"    
HISTSIZE=10000    
SAVEHIST=$HISTSIZE    
setopt extended_history       # record timestamp of command in HISTFILE    
setopt share_history          # share command history data

autoload -Uz compinit
compinit

source <(antibody init)

# some omz plugins need this
export ZSH="$(antibody path ohmyzsh/ohmyzsh)"
DISABLE_MAGIC_FUNCTIONS=true
#export ZSH_CACHE_DIR=$HOME/.zsh/cache

antibody bundle <<EOF
# plugins
ohmyzsh/ohmyzsh path:lib
zsh-users/zsh-syntax-highlighting    
zsh-users/zsh-completions    
zsh-users/zsh-autosuggestions 
ohmyzsh/ohmyzsh path:plugins/git    
ohmyzsh/ohmyzsh path:plugins/pip    
#ohmyzsh/ohmyzsh path:plugins/kubectl    
ohmyzsh/ohmyzsh path:plugins/golang    
#ohmyzsh/ohmyzsh path:plugins/docker    
#ohmyzsh/ohmyzsh path:plugins/command-not-found    
# theme    
#mafredri/zsh-async    
#sindresorhus/pure
#romkatv/powerlevel10k
EOF

eval "$(starship init zsh)"

#eval `pip completion --zsh`
source <(kubectl completion zsh)

alias k=kubectl
complete -F __start_kubectl k

source $HOME/.nix-profile/share/fzf/completion.zsh     
source $HOME/.nix-profile/share/fzf/key-bindings.zsh
