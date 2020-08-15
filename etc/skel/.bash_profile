#!/usr/bin/env bash

#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

if [ ! -f ~/.Xdefaults ]; then
  touch ~/.Xdefaults
else
  xrdb ~/.Xdefaults 2>/dev/null
fi

if [ ! -f ~/.Xresources ]; then
  touch ~/.Xresources
else
  xrdb ~/.Xresources 2>/dev/null
  xrdb -merge ~/.Xresources 2>/dev/null
fi

if [ -f ~/.local/.configs/gitconfig.local ] && [ ! -f ~/.gitconfig ]; then
  cp -f ~/.local/.configs/gitconfig.local ~/.gitconfig
fi

# set Python bin - Prefer python3
if [[ "$(python3 -V)" =~ "Python 3" ]]; then
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"
elif -f [[ "$(python2 -V)" =~ "Python 2" ]]; then
export PATH="${PATH}:$(python -c 'import site; print(site.USER_BASE)')/bin"
fi

# set PATH so it includes current directory
export PATH="${PATH}:."
