#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Source System Bash

#Fedora/Redhat/CentOS
if [ -f /etc/bashrc ]; then source /etc/bashrc; fi

#Debian/Ubuntu
if [ -f /etc/bash.bashrc ]; then source /etc/bash.bashrc; fi

#ARCH
if [ -f /etc/skel/.bashrc-latest ]; then source /etc/skel/.bashrc-latest; fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#My Servers use this
if [ -f ~/.config/bash/rc ]; then source ~/.config/bash/rc ; fi

#
#if [ -n "$PS1" ]; then source ~/.bash_profile ; fi

#System specific
if [ -f ~/.local/.configs/$(hostname -s).bash ]; then source ~/.local/.configs/$(hostname -s).bash ; fi

#Local file
if [ -f ~/.local/.configs/bash.local ]; then source ~/.local/.configs/bash.local ; fi
  
