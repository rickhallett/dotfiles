set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

install () {
    curl -s "https://get.sdkman.io?rcupdate=false" | bash || return ${STATUS_ERROR}

    return ${STATUS_OK}
}

install
