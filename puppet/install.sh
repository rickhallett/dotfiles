set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

install () {
    if ! is_gem_command_available
    then
        echo "Will not install puppet-lint as gem is not available." >&3
        return ${STATUS_SKIPPED}
    fi

    install_puppet_lint || return ${STATUS_ERROR}

    return ${STATUS_OK}
}

install_puppet_lint () {
    gem install --user puppet-lint
}

install
