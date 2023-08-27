# Disable ctrl-s ctrl-q (suspend, resume. frequently really really annoying!)
# http://geekanova.blogspot.co.uk/2012/11/ctrl-s-freezes-terminal.html
stty -ixon -ixoff

# Fix delete, home and end which would otherwise just caps a random bunch of
# characters. Thanks to Michael Francis for this fix!
# (Amazingly these bindings vary, so this may not work for you. inputrc is
# supposed to be the source for this sort of thing)
source =(
    cat /etc/inputrc |
        sed -ne '/^#/d'        \
            -e 's/://'         \
            -e 's/^/bindkey /' \
            -e '/\(delete-char\|beginning-of-line\|end-of-line\)/p'
)

# Prevent ESC eating the next character when in vim normal mode.
# See: http://superuser.com/a/516524
noop () { }
zle -N noop
bindkey -M vicmd '\e' noop

# vim: set ai et sw=4 syntax=zsh :
