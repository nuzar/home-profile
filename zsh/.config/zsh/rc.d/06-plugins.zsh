##
# Plugins
#

# plugin opts
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

zsh_plugins=(
	$HOME/.nix-profile/share/zsh-history-substring-search/zsh-history-substring-search.zsh
	$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	$HOME/.nix-profile/share/fzf/key-bindings.zsh
)

for _plug in "${zsh_plugins[@]}";do 
	source $_plug
done
