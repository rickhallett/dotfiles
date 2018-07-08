source ~/.antigen.zsh

[ -e ~/.antigen-plugins.zsh ] && source ~/.antigen-plugins.zsh
antigen-bundle Tarrasch/zsh-colors
antigen-bundle Tarrasch/zsh-functional
antigen-bundle bobthecow/git-flow-completion
antigen-bundle https://gitlab.com/matthewfranglen/docker-go
antigen-bundle https://gitlab.com/matthewfranglen/easy-ln
antigen-bundle https://gitlab.com/matthewfranglen/git-stashes
antigen-bundle https://gitlab.com/matthewfranglen/git-update
antigen-bundle https://gitlab.com/matthewfranglen/gitflow-avh --branch=master
antigen-bundle https://gitlab.com/matthewfranglen/memcached-cli
antigen-bundle https://gitlab.com/matthewfranglen/random
antigen-bundle https://gitlab.com/matthewfranglen/show-server-cert
antigen-bundle https://gitlab.com/matthewfranglen/spark
antigen-bundle https://gitlab.com/matthewfranglen/speedread
antigen-bundle https://gitlab.com/matthewfranglen/watch-me
antigen-bundle https://gitlab.com/matthewfranglen/window-to-gif
antigen-bundle https://gitlab.com/matthewfranglen/format-python
antigen-bundle supercrabtree/k
antigen-bundle zsh-users/zsh-autosuggestions
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle zsh-users/zsh-syntax-highlighting

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
