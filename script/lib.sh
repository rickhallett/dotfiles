# It is not possible to determine the location of this file because this will
# be run with `sh` and that does not provide any way to reliably determine
# that. See http://unix.stackexchange.com/a/96238
#
# Thus this uses the convention that the sourcing script is in a subdirectory
# of the dotfiles directory and that ${0} contains the relative path to that
# script. The DOTFILES path will be wrong if this is not true.

readonly STATUS_OK=0
readonly STATUS_SKIPPED=1
readonly STATUS_ERROR=2

readonly LOCAL_BIN_FOLDER="${HOME}/.local/bin"
readonly DOTFILES="$(dirname $(dirname \`readlink -f $0\`))"
readonly LOGS_FOLDER="${DOTFILES}/logs"
readonly PYENV_FOLDER="${HOME}/.pyenv"

readonly STDOUT_LOGFILE="${LOGS_FOLDER}/install.log"
readonly STDERR_LOGFILE="${LOGS_FOLDER}/error.log"
readonly SKIP_LOGFILE="${LOGS_FOLDER}/skip.log"

readonly PYTHON_VERSION="$(cat ${DOTFILES}/python/version)"

info() {
    printf "  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
    printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

skip() {
    printf "\r\033[2K  [\033[0;34mSKIP\033[0m] $1\n"
}

fail() {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
}

is_on_local_machine() {
    [ -z ${SSH_CONNECTION+x} ]
}

make_local_bin() {
    if [ ! -e "${LOCAL_BIN_FOLDER}" ]; then
        mkdir -p "${LOCAL_BIN_FOLDER}"
    fi
    if ! echo ":${PATH}:" | fgrep -q ":${LOCAL_BIN_FOLDER}"; then
        export PATH="${LOCAL_BIN_FOLDER}:${PATH}"
    fi
}
prepare_pyenv () {
    if ! is_pyenv_command_available; then
        install_pyenv && pyenv_init_command
    fi
}

prepare_pyenv_python () {
    pyenv install --skip-existing "${PYTHON_VERSION}" && pyenv global "${PYTHON_VERSION}"
}

prepare_pipx () {
    if ! is_pipx_command_available; then
        make_local_bin && install_pip && install_pipx
    fi
}

install_pyenv () {
    if [ ! -e "${PYENV_FOLDER}" ]
    then
        git clone --quiet https://github.com/pyenv/pyenv.git "${PYENV_FOLDER}"
    fi
}

pyenv_init_command () {
    "${PYENV_FOLDER}/bin/pyenv" init zsh
}


install_pip() {
    PIP_COMMAND="$(which pip)"
    if [ $? -eq 0 ]; then
        return
    fi

    make_local_bin
    local get_pip_file="/tmp/get-pip.py"
    get_url_to_file "https://bootstrap.pypa.io/get-pip.py" "${get_pip_file}" || return 1

    python "${get_pip_file}" --user
    local status=$?
    rm "${get_pip_file}"

    if [ ${status} -eq 0 ]; then
        if which pip >/dev/null; then
            PIP_COMMAND="$(which pip)"
        else
            PIP_COMMAND="${LOCAL_BIN_FOLDER}/pip"
        fi
    else
        PIP_COMMAND="/bin/false"
    fi

    return $status
}

install_pipx() {
    make_local_bin
    PIP_REQUIRE_VIRTUALENV= python -m pip install --user pipx
}

is_gem_command_available() {
    which gem >/dev/null
}

is_python_command_available() {
    which python >/dev/null
}

get_url_to_file() {
    local url="$1"
    local filename="$2"

    if which wget >/dev/null; then
        wget --quiet --output-document "${filename}" "${url}"
    elif which curl >/dev/null; then
        curl --fail --silent --show-error --location --output "${filename}" "${url}"
    else
        printf "Unable to download ${filename} from ${url}... wget and curl commands not found\n" >&2
        return 1
    fi
}

