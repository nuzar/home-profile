##
# Plugins
#

base_dir="$HOME/.nix-profile/share"
# these plugins should be put under nix-profile/share/zsh/plugins
source $base_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $base_dir/zsh-autosuggestions/zsh-autosuggestions.zsh
source $base_dir/zsh-history-substring-search/zsh-history-substring-search.zsh

# plugin opts
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

