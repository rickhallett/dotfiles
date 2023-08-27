# Disable ctrl-s ctrl-q (suspend, resume. frequently really really annoying!)
# http://geekanova.blogspot.co.uk/2012/11/ctrl-s-freezes-terminal.html
stty -ixon -ixoff

# This allows control-r to be used to perform a reverse search
bindkey '^R' history-incremental-search-backward

bindkey '^S' push-line

# This allows alt-. to insert the last word of the last command (i.e. !$)
bindkey "^[." insert-last-word

function shell-fg () {
    if [ $#BUFFER -ne 0 ]
    then
        zle push-line
    fi
    BUFFER="fg"
    zle accept-line
}
zle -N       shell-fg
bindkey '^Z' shell-fg

function shell-exit () {
    BUFFER="exit"
    zle accept-line
}
zle -N       shell-exit
bindkey '^D' shell-exit

# vim: set ai et sw=4 syntax=zsh :
