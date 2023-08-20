if [ "${ARCHITECTURE}" != "aarch64" ]; then
    export PIP_REQUIRE_VIRTUALENV=true
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1
export CONDA_INITIALIZED=
export PATH="${PATH}:${HOME}/.cargo/bin"

if [ -e "/usr/local/cuda" ]; then
    export PATH="${PATH}:/usr/local/cuda/bin"
fi

if [ -v PYENV_ROOT ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
fi

if which pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
