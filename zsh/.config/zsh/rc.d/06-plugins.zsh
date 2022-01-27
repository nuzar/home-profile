##
# Plugins
#

source <(antibody init)

# some omz plugins need this
# export ZSH="$(antibody path ohmyzsh/ohmyzsh)"
DISABLE_MAGIC_FUNCTIONS=true
# export ZSH_CACHE_DIR=$HOME/.zsh/cache

antibody bundle <<EOF
# plugins
# ohmyzsh/ohmyzsh path:lib
zsh-users/zsh-syntax-highlighting    
zsh-users/zsh-completions    
zsh-users/zsh-autosuggestions 
#ohmyzsh/ohmyzsh path:plugins/git    
#ohmyzsh/ohmyzsh path:plugins/pip    
#ohmyzsh/ohmyzsh path:plugins/kubectl    
#ohmyzsh/ohmyzsh path:plugins/golang    
#ohmyzsh/ohmyzsh path:plugins/docker    
#ohmyzsh/ohmyzsh path:plugins/command-not-found    
# theme    
#mafredri/zsh-async    
#sindresorhus/pure
#romkatv/powerlevel10k
EOF