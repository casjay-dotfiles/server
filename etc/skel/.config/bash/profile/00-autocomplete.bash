#!/usr/bin/env bash

# [!] Do not rename this file to `bash_completion`
#     as it will create an infinite loop!

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if
    [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
elif
    [ -f /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix; then
    . /usr/share/bash-completion/bash_completion
fi
