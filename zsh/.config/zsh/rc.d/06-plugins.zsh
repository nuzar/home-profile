##
# Plugins
#

# source <(antibody init)

# # some omz plugins need this
# # export ZSH="$(antibody path ohmyzsh/ohmyzsh)"
# DISABLE_MAGIC_FUNCTIONS=true
# # export ZSH_CACHE_DIR=$HOME/.zsh/cache

# antibody bundle <<EOF
# # plugins
# # ohmyzsh/ohmyzsh path:lib
# zsh-users/zsh-syntax-highlighting
# zsh-users/zsh-completions
# zsh-users/zsh-autosuggestions
# #ohmyzsh/ohmyzsh path:plugins/git
# #ohmyzsh/ohmyzsh path:plugins/pip
# #ohmyzsh/ohmyzsh path:plugins/kubectl
# #ohmyzsh/ohmyzsh path:plugins/golang
# #ohmyzsh/ohmyzsh path:plugins/docker
# #ohmyzsh/ohmyzsh path:plugins/command-not-found
# # theme
# #mafredri/zsh-async
# #sindresorhus/pure
# #romkatv/powerlevel10k
# EOF



source /usr/share/zplug/init.zsh

# Supports oh-my-zsh plugins and the like
#zplug "plugins/git",   from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
    HISTORY_SUBSTRING_SEARCH_PREFIXED=1


# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load
