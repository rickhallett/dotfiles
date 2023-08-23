# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/.local/bin:$PATH

# You may need to manually set your language environment
  export LANG=en_GB.UTF-8

# zmv allows for mass renames. Use -n to test the rename. Example:
# zmv '(*)-HDTV-WAKKA-WAKKA.(*)' '$1.$2'
autoload -U zmv

export KEYTIMEOUT=1

export VISUAL=vim
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim

# Support multiple terms each of which must match exactly (i.e. not fuzzed).
# Can fuzz a word by starting with '
export FZF_DEFAULT_OPTS="--extended-exact"
# Setting fd as the default source for fzf
# This respects .gitignore
export FZF_DEFAULT_COMMAND='fd --type f'

# This allows exclusions and the like in the pattern expansion
setopt EXTENDED_GLOB

# Report the status of background jobs immediately, rather than waiting until
# just before printing a prompt.
setopt NOTIFY

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt IGNORE_EOF
# ensure that prompt expansion works with print -P
setopt PROMPT_SUBST

# don't expand aliases _before_ completion has finished
# like: git comm-[tab]
setopt COMPLETE_ALIASES

# history settings from oh-my-zsh, adjusted
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=1000000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

source ~/.fzf.zsh

# vim: set ai et sw=4 syntax=zsh :
