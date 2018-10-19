_DEBUG_PLUGINS=

function install_plugins() {
    plugin::log "Starting..."
    source ~/.antigen.zsh

    [ -e ~/.antigen-plugins.zsh ] && source ~/.antigen-plugins.zsh
    plugin::log "Registered external plugins"

    antigen_bundles+=(
        Tarrasch/zsh-colors
        Tarrasch/zsh-functional
        bobthecow/git-flow-completion
        https://gitlab.com/matthewfranglen/docker-go
        https://gitlab.com/matthewfranglen/format-python
        https://gitlab.com/matthewfranglen/git-stashes
        https://gitlab.com/matthewfranglen/random
        "matthewfranglen/gitflow-avh --branch=master"
        supercrabtree/k
        zsh-users/zsh-autosuggestions
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-syntax-highlighting
    )

    for bundle in $antigen_bundles
    do
        antigen-bundle ${=bundle}
    done
    plugin::log "Registered bundles"
    unset antigen_bundles

    antigen-apply
    plugin::log "Applied plugins"

    # Set the autocomplete color for zsh-autocomplete.
    # Has to be done after loading.
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

    source ~/.fzf.zsh
    plugin::log "Sourced fzf"
}

if [ -n "${_DEBUG_PLUGINS}" ]; then
    PLUGIN_START_TIME="$(date "+%s.%N")"
    PLUGIN_LAST_TIME="${PLUGIN_START_TIME}"

    function plugin::log {
        local current_time="$(date "+%s.%N")"
        debug::log " - plugins" "${PLUGIN_START_TIME}" "${PLUGIN_LAST_TIME}" "${current_time}" "${1}"
        PLUGIN_LAST_TIME="${current_time}"
    }
else
    function plugin::log {

    }
fi

if ! which antigen >/dev/null; then
    install_plugins
fi

unfunction install_plugins
unfunction plugin::log
unset PLUGIN_START_TIME
unset PLUGIN_LAST_TIME
unset _DEBUG_PLUGINS

# vim: set ai et sw=4 syntax=zsh :
