#!/usr/bin/env zsh

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
# System Aliases
alias :q="exit"
alias c="clear"
alias e="vim --"
alias g="git"
alias ll="ls -l"
alias la="ls -a"
alias m="man"
alias map="xargs -n1"
alias zshrc="clear && source ~/.zshrc"
alias n="npm"
alias path='printf "%b\n" "${PATH//:/\\n}"'
alias q="exit"
alias t="tmux"
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

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# My git aliases from bash
alias gitreinit="rm -Rf .git && git init && git add . && git commit -S -m "Initial Commit""
alias gitcommit="git add . && git commit -S && git push -f"
alias gitup="git pull >/dev/null 2>&1 && echo "Commiting Changes" && git add . && git commit -S && git push -f"
alias gitpu="echo "Running git pull" && git pull"
alias gitremoteaddgh="git remote add origin https://github.com/$1"
alias gitremoteremgh="git remote rm https://github.com/$1"
alias gitremoteaddgl="git remote add origin https://gitlab.com/$1"
alias gitremoteremgl="git remote rm https://gitlab.com/$1"
alias gitremoteaddpr="git remote add origin https://git.casjay.in/$1"
alias gitremoterempr="git remote rm https://git.casjay.in/$1"

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
 alias pacu="sudo $distpkmgr update && sudo $distpkmgr upgrade -y"
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
alias rr="curl -LSs https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
alias command-not-found="fuck"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
