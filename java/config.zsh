if [ -e "${HOME}/.sdkman" ]; then
    export SDKMAN_DIR="${HOME}/.sdkman"
    unsetopt nounset
    [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
    setopt nounset
fi
