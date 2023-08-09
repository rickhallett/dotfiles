#!/usr/bin/zsh

_DEBUG_PLUGINS=

function install_plugins() {
    plugin::log "Starting..."
    source "${DOTFILES}/plugin-manager/@init" load
    plugin::log "Applied plugins"

    # Set the autocomplete color for zsh-autocomplete.
    # Has to be done after loading.
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"
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

install_plugins

unfunction install_plugins
unfunction plugin::log
unset PLUGIN_START_TIME
unset PLUGIN_LAST_TIME
unset _DEBUG_PLUGINS

# vim: set ai et sw=4 syntax=zsh :
