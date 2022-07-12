##
# Plugins
#

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
#mafredri/zsh-async
#sindresorhus/pure
#zplug "romkatv/powerlevel10k"


# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load
