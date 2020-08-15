#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Variables
if [ -f /usr/bin/pacman ]; then
  if [ -f /usr/bin/pac ]; then
     distpkmgr=pac
  else
     distpkmgr=pacman
  fi
elif [ -f /usr/bin/apt ]; then
    distpkmgr=apt
elif [ -f /usr/bin/dnf ]; then
    distpkmgr=dnf
elif [ -f /usr/bin/yum ]; then
    distpkmgr=yum
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CD Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd..="cd .."

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# System Aliases
alias :q="exit"
alias c="clear"
alias ch="history -c && > ~/.bash_history"
alias e="vim --"
alias g="git"
alias ll="ls -l"
alias la="ls -a"
alias m="man"
alias map="xargs -n1"
alias n="npm"
alias path='printf "%b\n" "${PATH//:/\\n}"'
alias q="exit"
alias t="tmux"
alias bashrc="clear && source ~/.bashrc"
alias tailf="tail -f"
alias ipconfig="ifconfig"
alias systemctl="sudo systemctl"
alias mount='mount -l'
alias h='history'
alias j='jobs -l'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%m-%d-%Y"'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
alias docker='sudo docker'
alias dockerrun='sudo docker run --rm --network host -it $1'
alias setver='date +"%m%d%Y%H%M-git" > version.txt'
alias dotfiles='bash -c "$(curl -LsS https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/install.sh)"'
alias ssh="ssh -X"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Set vim as default
alias vi='vim'
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Lock screen.
alias afk="gnome-screensaver-command --lock"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Arch Specific
alias pacman="sudo pacman"
alias pacmani="sudo pacman -S"
alias pacmanr="sudo pacman -R"
alias pacmans="sudo pacman -Q"
alias pacmanu="sudo pacman -Syyu --noconfirm"
if [ -f /usr/bin/pac ]; then
 alias pac="sudo $distpkmgr"
 alias paci="sudo $distpkmgr install"
 alias pacr="sudo $distpkmgr remove"
 alias pacs="sudo $distpkmgr search"
 alias pacu="sudo $distpkmgr update && sudo $distpkmgr upgrade -y && sudo $distpkmgr dist-upgrade -y"
fi
#Ubuntu/Debian specific
# Shorter commands for the `Advanced Packaging Tool`
alias apt="sudo $distpkmgr"
alias apti="sudo $distpkmgr install"
alias aptr="sudo $distpkmgr remove"
alias apts="sudo $distpkmgr search"
alias aptu="sudo $distpkmgr update && sudo $distpkmgr upgrade -y && sudo $distpkmgr dist-upgrade -y"

#CentOS/Redhat Specific
alias yum="sudo $distpkmgr"
alias yumi="sudo $distpkmgr install"
alias yumr="sudo $distpkmgr remove"
alias yums="sudo $distpkmgr search"
alias yumu="sudo $distpkmgr update -y"

#Fedora Specific
alias dnf="sudo $distpkmgr"
alias dnfi="sudo $distpkmgr install"
alias dnfr="sudo $distpkmgr remove"
alias dnfs="sudo $distpkmgr search"
alias dnfu="sudo $distpkmgr update -y"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Empty trash.
alias empty-trash="rm -rf ~/.local/share/Trash/files/*"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Hide/Show desktop icons.
alias hide-desktop-icons="gsettings set org.gnome.desktop.background show-desktop-icons false"
alias show-desktop-icons="gsettings set org.gnome.desktop.background show-desktop-icons true"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Get local IP.
IFISONLINE="$(timeout 0.2 ping -c1 8.8.8.8 &> /dev/null ; echo $?)"
IFCONFIG="$(which ifconfig 2> /dev/null)"
if [ "$IFISONLINE" -ne "0" ]; then
if [ ! -z "$IFCONFIG" ]; then
alias myip-local4="echo $(/sbin/ifconfig | grep -E "venet|inet" | grep -Ev "docker|127.0.0." | grep 'inet' | grep -v inet6 | awk '{print $2}' | sed s#addr:##g | head -n1)"
alias myip-local6="echo $(/sbin/ifconfig | grep -E "venet|inet" | grep -v "docker" | grep 'inet6' | grep -i global | awk '{print $2}' | head -n1)"
alias myip-public4="curl -I4qs 2>/dev/null ifconfig.co/ip | head -1 | grep 404 >/dev/null && if [ $? == 0 ] ; then curl -4qs ifconfig.co/ip 2>/dev/null; fi"
alias myip-public6="curl -I6qs 2>/dev/null ifconfig.co/ip | head -1 | grep 404 >/dev/null && if [ $? == 0 ] ; then curl -6qs ifconfig.co/ip 2>/dev/null; fi"
alias myip4="echo -e $(myip-local4 2>/dev/null) && echo -e $(myip-public4 2>/dev/null)"
alias myip6="echo -e $(myip-local6 2>/dev/null) && echo -e $(myip-public6 2>/dev/null)"
fi
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Open from the terminal.
alias o="xdg-open"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# netstat aliases
alias ports='sudo netstat -taupln | grep LISTEN'
alias netstat="sudo netstat"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Andriod adb/fastboot
alias fastboot='sudo fastboot'
alias adb='sudo adb'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Fun alias
alias tw="rainbowstream -iot"
alias twitter="twitter"
alias weather='wttrin'
alias weather2='wttrin2'
alias command-not-found="fuck"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

