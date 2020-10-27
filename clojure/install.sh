set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

install () {
    make_local_bin || return ${STATUS_ERROR}
    install_lein   || return ${STATUS_ERROR}

    return ${STATUS_OK}
}

readonly LEIN_URL="https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein"
readonly LEIN_FILE="${LOCAL_BIN_FOLDER}/lein"

install_lein () {
    get_url_to_file "${LEIN_URL}" "${LEIN_FILE}"
    chmod 755 "${LEIN_FILE}"
}

install
