source ~/.antigen.zsh

[ -e ~/.antigen-plugins.zsh ] && source ~/.antigen-plugins.zsh
antigen_bundles+=(
    Tarrasch/zsh-colors
    Tarrasch/zsh-functional
    bobthecow/git-flow-completion
    https://gitlab.com/matthewfranglen/docker-go
    https://gitlab.com/matthewfranglen/format-python
    https://gitlab.com/matthewfranglen/git-stashes
    https://gitlab.com/matthewfranglen/git-update
    https://gitlab.com/matthewfranglen/random
    matthewfranglen/gitflow-avh --branch=master
    supercrabtree/k
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
)

for bundle in $antigen_bundles
do
    antigen-bundle ${bundle}
done
unset antigen_bundles

antigen-apply

# Set the autocomplete color for zsh-autocomplete.
# Has to be done after loading.
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

source ~/.fzf.zsh

# vim: set ai et sw=4 syntax=zsh :
