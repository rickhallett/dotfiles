export PIP_REQUIRE_VIRTUALENV=true

# Pipenv completion
_pipenv() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
}
compdef _pipenv pipenv
