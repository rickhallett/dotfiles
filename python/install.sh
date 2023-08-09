set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

readonly PYENV_FOLDER="${HOME}/.pyenv"
readonly PYENV_VIRTUALENV_FOLDER="${HOME}/.pyenv/plugins/pyenv-virtualenv"

install () {
    if ! is_python_command_available
    then
        echo "Unable to install python environment... python not found" >&2
        return ${STATUS_ERROR}
    fi

    install_pyenv        || return ${STATUS_ERROR}
    install_rust         || return ${STATUS_ERROR}

    return ${STATUS_OK}
}

install_pyenv () {
    if [ ! -e "${PYENV_FOLDER}" ]
    then
        git clone --quiet https://github.com/pyenv/pyenv.git "${PYENV_FOLDER}"
    fi
    if [ ! -e "${PYENV_VIRTUALENV_FOLDER}" ]
    then
        git clone --quiet https://github.com/pyenv/pyenv-virtualenv.git "${PYENV_VIRTUALENV_FOLDER}"
    fi
}

install_rust () {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --quiet -y --no-modify-path
}

install
