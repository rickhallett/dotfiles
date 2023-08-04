set -eu

. "`dirname \`dirname \\\`readlink -f $0\\\`\``/script/lib.sh"

install () {
    if ! is_git_command_available
    then
        echo "Unable to install zsh... git command not found" >&2
        return ${STATUS_ERROR}
    fi

    install_zplug      || return ${STATUS_ERROR}
    install_oh_my_zsh  || return ${STATUS_ERROR}
    install_sdkman     || return ${STATUS_ERROR}
    install_pipx       || return ${STATUS_ERROR}
    install_youtube_dl || return ${STATUS_ERROR}
}

is_git_command_available () {
    which git >/dev/null
}

install_zplug () {
    git clone https://github.com/zplug/zplug "${HOME}/.zplug"
}

install_oh_my_zsh () {
    export ZSH=$HOME/.oh-my-zsh

    if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
        mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh
    fi

    get_url_to_file "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh" - | zsh 2>&1
    if [ -e ~/.zshrc ]; then
        rm ~/.zshrc
    fi

    if [ -f ~/.zshrc.pre-oh-my-zsh ] || [ -h ~/.zshrc.pre-oh-my-zsh ]; then
        mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
    fi
}

install_sdkman () {
    curl -s "https://get.sdkman.io" | bash
}

install_youtube_dl() {
    pipx install youtube-dl
}

install
