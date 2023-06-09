set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

HUB_VERSION="2.14.2"
HUB_URL="https://github.com/github/hub/releases/download/v${HUB_VERSION}/hub-linux-amd64-${HUB_VERSION}.tgz"
HUB_DOWNLOAD="/tmp/hub.tgz"
HUB_COMMAND="${LOCAL_BIN_FOLDER}/hub"

install () {
    if [ -e "${HUB_COMMAND}" ]
    then
        return ${STATUS_OK}
    fi

    make_local_bin || return ${STATUS_ERROR}
    install_hub    || return ${STATUS_ERROR}

    return ${STATUS_OK}
}

install_hub () {
    get_url_to_file "${HUB_URL}" "${HUB_DOWNLOAD}"
    local folder="$(mktemp -d)"

    (
        cd "${folder}"
        tar xzf "${HUB_DOWNLOAD}"
        mv */bin/hub "${HUB_COMMAND}"
    )

    chmod 755 "${HUB_COMMAND}"
    rm -rf "${folder}"
}

install
