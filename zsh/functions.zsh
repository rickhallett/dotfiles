# Join a list of arguments by the first argument
function join () {
    local IFS=$1
    shift
    echo $*
}

function all_paths_exist () {
    for file in "${@}"
    do
        if [ ! -e "${file}" ]
        then
            echo "Path does not exist: ${file}" >&2
            return 1
        fi
    done
    return 0
}

function has_folder () {
    for file in "${@}"
    do
        if [ -d "${file}" ]
        then
            return 0
        fi
    done
    return 1
}

function watch_and_execute () {
    local watched_file="$1"
    shift

    while wait_until_change "${watched_file}"
    do
        eval "${@}"
    done
}

function is_zip_file () {
    local file="${1}"

    [ "$(file --brief --mime-type ${file})" = "application/zip" ]
}

function zip_recursive_search () {
    local zipfile="${1}"
    local pattern="${2}"
    local result=""

    result=$(zipinfo -1 "${zipfile}" | egrep "${pattern}" 2>/dev/null | head -n1)

    if [ -n "${result}" ]
    then
        echo "${result}"
        return 0
    fi

    for inner in $(zipinfo -1 "${zipfile}")
    do
        if ! is_zip_file =(unzip -p "${zipfile}" "${inner}")
        then
            continue
        fi

        local result=$(zip_recursive_search =(unzip -p "${zipfile}" "${inner}") "${pattern}")

        if [ -n "${result}" ]
        then
            echo "${inner} -> ${result}"
            return 0
        fi
    done

    return 1
}

# vim: set ai et sw=4 syntax=zsh :
