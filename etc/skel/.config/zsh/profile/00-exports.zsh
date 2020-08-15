# Disable flow control


if (( $+commands[stty] )); then
  stty -ixon
fi

# Set the default Less options.
export LESS="-F -g -i -M -R -S -w -X -z-4"

# Export GPG TTY
export GPG_TTY=$(tty)


if [ -n $EDITOR ]; then
    alias e="$EDITOR"
fi

if [ -n $BROWSER ]; then
    alias b="$BROWSER"
fi

if [ -n $PAGER ]; then
    alias p="$PAGER"
fi

# Set LANG
if [[ -z "$LANG" ]]; then
  export LANG="en_US.UTF-8"
fi

