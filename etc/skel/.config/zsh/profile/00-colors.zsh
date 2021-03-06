# Enable dircolors
if (( $+commands[dircolors] )); then
  if [ -f "$HOME"/.dircolors ]; then
    eval "$(dircolors $HOME/.dircolors)"
  else
    eval "$(dircolors --sh)"
  fi
fi

# Set grep colors
export GREP_COLOR="37;45"
export GREP_COLORS="mt=${GREP_COLOR}"

export LSCOLORS="ExGxcxdxCxegedabagacad"
export CLICOLOR=1

# Colorize man page output
export LESS_TERMCAP_mb=$(printf "\e[1;31m")
export LESS_TERMCAP_md=$(printf "\e[1;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

