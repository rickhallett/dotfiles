_DEBUG_PLUGINS=

function install_plugins() {
    plugin::log "Starting..."

    # install and load zpm
    export ZPM_HOME="${HOME}/.zpm"
    if [[ ! -f "${ZPM_HOME}/zpm.zsh" ]]; then
        git clone --recursive https://github.com/zpm-zsh/zpm "${ZPM_HOME}"
    fi

    # caching of the plugins is broken, see https://github.com/zpm-zsh/zpm/issues/46
    if [ -e "${ZSH_CACHE_DIR}/zpm-cache.zsh" ]; then
        rm "${ZSH_CACHE_DIR}/zpm-cache.zsh"
    fi

    source "${ZPM_HOME}/zpm.zsh"
    source ${HOME}/.zsh-plugins(:A)

    plugin::log "Applied plugins"

    # Set the autocomplete color for zsh-autocomplete.
    # Has to be done after loading.
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

    export SDKMAN_DIR="${HOME}/.sdkman"
    [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

    # Generated for envman. Do not edit.
    [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
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

if which antibody >/dev/null; then
    install_plugins
fi

unfunction install_plugins
unfunction plugin::log
unset PLUGIN_START_TIME
unset PLUGIN_LAST_TIME
unset _DEBUG_PLUGINS


# vim: set ai et sw=4 syntax=zsh :
