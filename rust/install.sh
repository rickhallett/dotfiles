set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

readonly CARGO_FOLDER="${HOME}/.cargo"

install () {
    install_rust || return ${STATUS_ERROR}

    return ${STATUS_OK}
}

install_rust () {
    if [ ! -e "${CARGO_FOLDER}" ]; then
        curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
    fi
}

install
