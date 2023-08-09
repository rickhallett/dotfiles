set -euo pipefail

git_repo_folder () {
    local URL="${1?You must provide the https url to use}"
    local NAME="${URL:gs#/#--#:gs#:##}"

    local CACHE_FOLDER="${XDG_CACHE_DIR:-${HOME}/.cache}/dotfiles"
    local CLONE_CACHE_FOLDER="${CACHE_FOLDER}/repos/clones"
    local FOLDER_NAME="${CLONE_CACHE_FOLDER}/${NAME}"

    if [ ! -e "${CLONE_CACHE_FOLDER}" ]; then
        mkdir -p "${CLONE_CACHE_FOLDER}"
    fi

    echo "${FOLDER_NAME}"
}

github_release_folder () {
    local REPO_NAME="${1?You must provide the repo to use}"
    local NAME="${REPO_NAME:gs#/#--#:gs#:##}"

    local CACHE_FOLDER="${XDG_CACHE_DIR:-${HOME}/.cache}/dotfiles"
    local RELEASE_CACHE_FOLDER="${CACHE_FOLDER}/repos/releases"
    local FOLDER_NAME="${RELEASE_CACHE_FOLDER}/${NAME}"

    if [ ! -e "${RELEASE_CACHE_FOLDER}" ]; then
        mkdir -p "${RELEASE_CACHE_FOLDER}"
    fi

    echo "${FOLDER_NAME}"
}

log_file () {
    local FOLDER_NAME="${1?You must provide the folder name to use}"
    local NAME="${FOLDER_NAME##*/}"

    local CACHE_FOLDER="${XDG_CACHE_DIR:-${HOME}/.cache}/dotfiles"
    local LOG_FOLDER="${CACHE_FOLDER}/logs"
    if [ ! -e "${LOG_FOLDER}" ]; then
        mkdir "${LOG_FOLDER}"
    fi
    local LOG_FILE="${LOG_FOLDER}/${NAME}"

    echo "${LOG_FILE}"
}

read_tag () {
    TAG="${1?You must provide the tag to read}"
    shift

    VALUE=""
    for argument in "$@"; do
        case $argument in
            ${TAG}:*)
                VALUE="${argument/*:}"
                ;;
        esac
    done
    echo "${VALUE}"
}
