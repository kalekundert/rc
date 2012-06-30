# Future Directions
# =================
# 1. I think zsh has builtin module for handling both colors and prompts.  Both
#    of these are worth looking into.  
#
# 2. It's possible to put a prompt on the right-hand side of each line.  This
#    is an interesting concept, because there's usually plenty of space over
#    there.  Furthermore, on long lines, the right hand prompt will get
#    overwritten.
#
#    It might be worth considering that this effect would be difficult to
#    duplicate in ipython.

# Define a number of colors using the standard shell escape codes.  The color
# that gets used will depend on the role of this machine.  Note that these
# colors will only work in fairly modern terminals.

normal=$'%{\e[0m%}'

black=$'%{\e[1;30m%}'
white=$'%{\e[1;37m%}'

red=$'%{\e[1;31m%}'
green=$'%{\e[1;32m%}'
blue=$'%{\e[1;34m%}'

yellow=$'%{\e[1;33m%}'
purple=$'%{\e[1;35m%}'
cyan=$'%{\e[1;36m%}'

user_color=$yellow
admin_color=$red
remote_color=$blue

# Define a few different prompt templates.  The template that gets used will
# also depend on the role of this computer.

[ $USER = $HOME_USER ] && [ $HOST = $HOME_HOST ] && prompt='[%c] '
[ $USER = $HOME_USER ] && [ $HOST != $HOME_HOST ] && prompt='[%c] %m: '
[ $USER != $HOME_USER ] && [ $HOST = $HOME_HOST ] && prompt='[%c] %n: '
[ $USER != $HOME_USER ] && [ $HOST != $HOME_HOST ] && prompt='[%c] %n@%m: '

# Choose a color and a prompt string.  Both of these decisions depend on which
# user is logged in and where they are logged in from.

[ $HOST = $HOME_HOST ] && color=$yellow || color=$blue
[[ $USER = 'root' ]] && color=$red

# Set the two variables that are used to display the prompt.

PS1=$color$prompt$normal

function precmd {

    # This returns the size of the current prompt, accounting for all of the
    # various escape codes.  I have no idea how it works.  If you really want
    # to know, the manual page for `zshexpn' might be a good place to start
    # looking.

    local zero='%([BSUbfksu]|([FB]|){*})'
    length=${#${(S%%)PS1//$~zero/}} 
    padding=${(l.(($length - 4)).. .)}'... '

    PS2=$color$padding$normal
}

# Add an extra control sequence to have the prompt string echoed in the
# terminal's title bar.

if [[ $TERM != "linux" ]] ; then
    PS1=$'%{\e]0;%~\007%}'$PS1
fi
