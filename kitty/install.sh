set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

install () {
    if ! is_on_local_machine
    then
        echo "Not installing kitty... currently running on remote host" >&3
        return ${STATUS_SKIPPED}
    fi

    install_kitty_themes || return ${STATUS_ERROR}

    return ${STATUS_OK}
}

readonly KITTY_THEMES_REPO="https://github.com/dexpota/kitty-themes.git"
readonly KITTY_THEMES_FOLDER="${HOME}/.config/kitty/kitty-themes"

install_kitty_themes () {
    [ ! -e "${KITTY_THEMES_FOLDER}" ] && mkdir -p "${KITTY_THEMES_FOLDER}"
    git clone --depth 1 "${KITTY_THEMES_REPO}" "${KITTY_THEMES_FOLDER}"
}

install
