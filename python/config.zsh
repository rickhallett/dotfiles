export PIP_REQUIRE_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Pipenv completion
_pipenv() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
}
compdef _pipenv pipenv

function python::setup_conda {
    # from conda init
    __conda_setup="$("${CONDA_HOME}/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "${CONDA_HOME}/etc/profile.d/conda.sh" ]; then
            . "${CONDA_HOME}/etc/profile.d/conda.sh"
        else
            export PATH="${CONDA_HOME}/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

if [[ -z "${CONDA_HOME}" ]]; then
    if [[ -e "${HOME}/Programming/Python/anaconda3" ]]; then
        export CONDA_HOME="${HOME}/Programming/Python/anaconda3"
        export PATH="${CONDA_HOME}/bin:${PATH}"
        python::setup_conda
    fi
# https://unix.stackexchange.com/questions/411304/how-do-i-check-whether-a-zsh-array-contains-a-given-value
elif [[ ${path[(ie)${CONDA_HOME}/bin]} -gt ${#path} ]]; then
    export PATH="${CONDA_HOME}/bin:${PATH}"
    python::setup_conda
fi

unfunction python::setup_conda
