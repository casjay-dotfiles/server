#!/usr/bin/env bash

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"

APPNAME="$(basename $0)"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# @Author          : Jason
# @Contact         : casjaysdev@casjay.net
# @File            : install.sh
# @Created         : Wed, Aug 09, 2020, 02:00 EST
# @License         : WTFPL
# @Copyright       : Copyright (c) CasjaysDev
# @Description     : server installer
#
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


##################################################################################################
# Additional Deps
# Debian/Ubuntu - apt install python3-pip python-dev libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
# CentOS/Fedora - yum install python-devel libjpeg-devel python3-pip

#Modify and set if using the auth token
AUTHTOKEN=""
# either http https or git if git remember proto is git@git
GITPROTO="https://"
#Your git repo
GITREPO="github.com/casjay-dotfiles/minimal"
# Git Command - Private Repo
#GITURL="$GITPROTO$AUTHTOKEN:x-oauth-basic@$GITREPO"
#Public Repo
GITURL="$GITPROTO$GITREPO"
# Default NTP Server
NTPSERVER="ntp.casjay.net"
# Set the temp directory
DOTTEMP="/tmp/dotfiles-minimal-$USER"
# Default dotfiles dir
# Set primary dir
DOTFILES="$HOME/.local/dotfiles"

echo -e "\t\t Not ready yet"
exit 1

##################################################################################################

if [[ "$(python3 -V 2>/dev/null)" =~ "Python 3" ]]; then
PYTHONVER="python3"
PIP="pip3"
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"
elif [[ "$(python2 -V 2>/dev/null)" =~ "Python 2" ]]; then
PYTHONVER="python"
PIP="pip"
export PATH="${PATH}:$(python -c 'import site; print(site.USER_BASE)')/bin"
fi

##################################################################################################

PURPLE='\033[0;35m'
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[32m'
NC='\033[0m'

##################################################################################################

# Setup functions

# Lets check for required programs
__requiredpkgs() {
GIT="$(which git 2>/dev/null)"
CURL="$(which curl 2>/dev/null)"
WGET="$(which wget 2>/dev/null)"
VIM="$(which vim 2>/dev/null)"
NVIM="$(which nvim 2>/dev/null)"
TMUX="$(which tmux 2>/dev/null)"
ZSH="$(which zsh 2>/dev/null)"
FISH="$(which fish 2>/dev/null)"
SUDO="$(which sudo 2>/dev/null)"
NEOFETCH="$(which neofetch 2>/dev/null)"
GPG="$(which gpg 2>/dev/null)"
NETTOOLS="$(which ifconfig 2>/dev/null)"
LSBR="$(which lsb_release 2>/dev/null)"
POWERLINE="$(which powerline-daemon 2>/dev/null)"
HTOP="$(which htop 2>/dev/null)"
LSOF="$(which lsof 2>/dev/null)"
HG="$(which hg 2>/dev/null)"
BZR="$(which bzr 2>/dev/null)"
STRACE="$(which strace 2>/dev/null)"
COWSAY="$(which cowsay 2>/dev/null)"
TF="$(which thefuck 2>/dev/null)"
SCREEN="$(which screen 2>/dev/null)"
SVN="$(which svn 2>/dev/null)"
CMUS="$(which cmus 2>/dev/null)"
PYPIP="$(which $PIP 2>/dev/null)"
SENDXMPP="$(which sendxmpp 2>/dev/null)"
IRSSI="$(which irssi 2>/dev/null)"
FINCH="$(which finch 2>/dev/null)"
XTERM="$(which xterm 2>/dev/null)"
FORTUNE="$(which fortune 2>/dev/null)"
FIGLET="$(which figlet 2>/dev/null)"
TOR="$(which tor 2>/dev/null)"
POSTFIX="$(which postfix 2>/dev/null)"
DENV="$(which direnv 2>/dev/null)"
APACHE="$(which $APACHE2 2>/dev/null)"
NGINX="$(which nginx 2>/dev/null)"

}

##################################################################################################

__missingpkg() {
unset MISSING
if [[ ! "$GIT" ]]; then MISSING+="git "; fi
if [[ ! "$CURL" ]]; then MISSING+="curl "; fi
if [[ ! "$WGET" ]]; then MISSING+="wget "; fi
if [[ ! "$VIM" ]]; then MISSING+="vim "; fi
if [[ ! "$NVIM" ]]; then MISSING+="neovim "; fi
if [[ ! "$TMUX" ]]; then MISSING+="tmux "; fi
if [[ ! "$ZSH" ]]; then MISSING+="zsh "; fi
if [[ ! "$FISH" ]]; then MISSING+="fish "; fi
if [[ ! "$SUDO" ]]; then MISSING+="sudo "; fi
if [[ ! "$NEOFETCH" ]]; then MISSING+="neofetch "; fi
if [[ ! "$GPG" ]]; then MISSING+="gnupg "; fi
if [[ ! "$NETTOOLS" ]]; then MISSING+="net-tools "; fi
if [[ ! "$LSBR" ]]; then MISSING+="$LSBPAC "; fi
if [[ ! "$POWERLINE" ]]; then MISSING+="powerline "; fi
if [[ ! "$HTOP" ]]; then MISSING+="htop "; fi
if [[ ! "$LSOF" ]]; then MISSING+="lsof "; fi
if [[ ! "$HG" ]]; then MISSING+="mercurial "; fi
if [[ ! "$BZR" ]]; then MISSING+="bzr "; fi
if [[ ! "$STRACE" ]]; then MISSING+="strace "; fi
if [[ ! "$COWSAY" ]]; then MISSING+="cowsay "; fi
if [[ ! "$TF" ]]; then MISSING+="thefuck "; fi
if [[ ! "$SCREEN" ]]; then MISSING+="screen "; fi
if [[ ! "$SVN" ]]; then MISSING+="subversion "; fi
if [[ ! "$CMUS" ]]; then MISSING+="cmus "; fi
if [[ ! "$PYPIP" ]]; then MISSING+="$PYTHONVER-pip "; fi
if [[ ! "$SENDXMPP" ]]; then MISSING+="sendxmpp "; fi
if [[ ! "$IRSSI" ]]; then MISSING+="irssi "; fi
if [[ ! "$FINCH" ]]; then MISSING+="finch "; fi
if [[ ! "$XTERM" ]]; then MISSING+="xterm "; fi
if [[ ! "$FORTUNE" ]]; then MISSING+="fortune-mod "; fi
if [[ ! "$FIGLET" ]]; then MISSING+="figlet "; fi
if [[ ! "$TOR" ]]; then MISSING+="tor "; fi
if [[ ! "$POSTFIX" ]]; then MISSING+="postfix "; fi
if [[ ! "$DENV" ]]; then MISSING+="direnv "; fi
if [[ ! "$APACHE" ]]; then MISSING+="$APACHE2 "; fi
if [[ ! "$NGINX" ]]; then MISSING+="nginx "; fi
}

##################################################################################################

function RequireSudo {
  # Print message if sudo password needs to be entered
  # Workaround for: https://github.com/travis-ci/travis-ci/issues/9608
  sudo -n true &>/dev/null || true
  if [ "$TRAVIS_OS_NAME" != "linux" ]; then
  sudo -v
    # Print message if sudo password needs to be entered
  # keep sudo priviledges alive
    sudo -n true &>/dev/null || echo "Some commands in this script require sudo priviledges"
  # kill -0 "$$": checks if parent process is still running
    sudo -v
  # https://github.com/mathiasbynens/dotfiles/blob/master/.macos
    # keep sudo priviledges alive
  while true; do sudo -n true; sleep 10; kill -0 "$$" || exit; done 2>/dev/null &
    # kill -0 "$$": checks if parent process is still running
    # https://github.com/mathiasbynens/dotfiles/blob/master/.macos
  while true; do sudo -n true; sleep 10; kill -0 "$$" || exit; done 2>/dev/null &
  fi
}

##################################################################################################
clear
sleep 1
printf "\n\n\n\n\n\t\t ${RED} *** Initializing the installer please wait *** ${NC} \n\n "
sleep 2
##################################################################################################

# Remove previous installs
if [ -d "$DOTFILES".git ]; then cd "$DOTFILES" && git pull ; else rm -Rf "$DOTFILES"; fi
if [ -d "$HOME"/.config/bash/profile ]; then rm -Rf "$HOME"/.config/bash/profile/zz-*; fi
if [ -d "$HOME"/.config/bash/profile ]; then rm -Rf "$HOME"/.config/bash/profile/00-*; fi
if [ -d "$HOME"/.config/bash/profile ]; then rm -Rf "$HOME"/.config/bash/profile/*.win; fi
if [ -d "$DOTTEMP" ]; then rm -Rf "$DOTTEMP" ; fi

if [ ! -f /etc/casjaysdev/.srvinst ]
    if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
        # Define the package manager and install option
        # Ubuntu/Debian
        if [ -f /usr/local/bin/apt-get ]; then
            pkgmgr="DEBIAN_FRONTEND=noninteractive apt-get"
            instoption="-yy -qq install"
            instupdateoption="update ; sudo $pkgmgr upgrade -yy -qq"
            pkgmgrman="apt-get install"
            LSBPAC=lsb-release
            APACHE=apache2
            OS=apt

            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Initializing the system time *** ${NC} \n "
            ##################################################################################################
             if [ -f "$(which chronyd 2>/dev/null)" ]; then
              sudo chronyd -q "server pool.ntp.org iburst" >/dev/null 2>&1
             elif [ ! -f "$(which ntpd 2>/dev/null)" ]; then
              sudo $pkgmgr $instoption ntp ntpdate -yy -qq >/dev/null 2>&1
              sudo ntpdate $NTPSERVER >/dev/null 2>&1
             fi

            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Update Check *** ${NC} \n "
            ##################################################################################################
            instchkupdatecmd="$(sudo apt-get update >/dev/null && apt-get --just-print upgrade | grep "Inst " | wc -l)"

        # Ubuntu/Debian
        elif [ -f /usr/bin/apt ]; then
            pkgmgr="DEBIAN_FRONTEND=noninteractive apt-get"
            instoption="-yy -qq install"
            instupdateoption="update ; sudo $pkgmgr upgrade -yy -qq"
            pkgmgrman="apt install"
            LSBPAC=lsb-release
            APACHE=apache2
            OS=apt

            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Initializing the system time *** ${NC} \n "
            ##################################################################################################
             if [ -f "$(which chronyd 2>/dev/null)" ]; then
              sudo chronyd -q "server pool.ntp.org iburst" >/dev/null 2>&1
             elif [ ! -f "$(which ntpd 2>/dev/null)" ]; then
              sudo $pkgmgr $instoption ntp ntpdate -yy -qq >/dev/null 2>&1
              sudo ntpdate $NTPSERVER >/dev/null 2>&1
             fi
            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Update Check *** ${NC} \n "
            ##################################################################################################
            instchkupdatecmd="$(sudo apt-get update >/dev/null && apt-get --just-print upgrade | grep "Inst " | wc -l)"

        # Redhat/Fedora
        elif [ -f /usr/bin/dnf ]; then
            pkgmgr="dnf"
            instoption="install -y -q --skip-broken"
            instupdateoption="update -y -q"
            pkgmgrman="dnf install"
            LSBPAC=redhat-lsb
            APACHE=httpd
            OS=yum

            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Initializing the system time *** ${NC} \n "
            ##################################################################################################
             if [ -f "$(which chronyd 2>/dev/null)" ]; then
              sudo chronyd -q "server pool.ntp.org iburst" >/dev/null 2>&1
             elif [ ! -f "$(which ntpd 2>/dev/null)" ]; then
              sudo $pkgmgr $instoption ntp ntpdate -yy -qq >/dev/null 2>&1
              sudo ntpdate $NTPSERVER >/dev/null 2>&1
             fi
            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Update Check *** ${NC} \n "
            ##################################################################################################
            instchkupdatecmd="$(sudo dnf check-update -q | grep -v Security | wc -l)"

        # Redhat/Fedora
        elif [ -f /usr/bin/yum ]; then
            pkgmgr="yum"
            instoption="install -y -q"
            instupdateoption="update -y -q"
            pkgmgrman="yum install"
            LSBPAC=redhat-lsb
            APACHE=httpd
            OS=yum

            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Initializing the system time *** ${NC} \n "
            ##################################################################################################
            instupdateoption="install -y -q --skip-broken"
             if [ -f "$(which chronyd 2>/dev/null)" ]; then
              sudo chronyd -q "server pool.ntp.org iburst" >/dev/null 2>&1
             elif [ ! -f "$(which ntpd 2>/dev/null)" ]; then
              sudo $pkgmgr $instoption ntp ntpdate -yy -qq >/dev/null 2>&1
              sudo ntpdate $NTPSERVER >/dev/null 2>&1
             fi
            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Update Check *** ${NC} \n "
            ##################################################################################################
            instchkupdatecmd="$(sudo yum check-update -q | grep -v Security | wc -l)"

        # ArchLinux
        elif [ -f /usr/bin/pacman ]; then
            pkgmgr="pacman"
            instoption="-Syy --needed --noconfirm"
            instupdateoption="--Syyu --noconfirm"
            pkgmgrman="pacman -S"
            LSBPAC=lsb-release
            APACHE=apache2
            OS=pacman

            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Initializing the system time *** ${NC} \n "
            ##################################################################################################
             if [ -f "$(which chronyd 2>/dev/null)" ]; then
              sudo chronyd -q "server pool.ntp.org iburst" >/dev/null 2>&1
             elif [ ! -f "$(which ntpd 2>/dev/null)" ]; then
              sudo $pkgmgr $instoption ntp ntpdate -yy -qq >/dev/null 2>&1
              sudo ntpdate $NTPSERVER >/dev/null 2>&1
             fi
            ##################################################################################################
            printf "\n\t\t ${BLUE} *** Update Check *** ${NC} \n "
            ##################################################################################################
            instchkupdatecmd="$(checkupdates 2>/dev/null | wc -l)"
        fi

        # Execute update check
        if [[ "$instchkupdatecmd" != 0 ]]; then
            ##################################################################################################
            printf "\n\t\t ${RED} *** You have $instchkupdatecmd update available ***${NC}\n"
            printf "\t\t ${RED} *** Attemping to update your system ***${NC}\n\n"
            sudo $pkgmgr $instupdateoption >/dev/null 2>&1 ; RETVAL=$?
          if [ $RETVAL -ne 0 ]; then
           printf "\n\t\t ${RED} *** Update has failed exit code was: $RETVAL - Please do a manual update ***${NC}\n"
           printf "\t\t ${RED} *** sudo $pkgmgr $instupdateoption ***${NC}\n"
          fi
            ##################################################################################################
        fi
    fi
fi
##################################################################################################
printf "\n\t\t ${BLUE} *** Checking for required packages *** ${NC} \n "
##################################################################################################

__requiredpkgs
__missingpkg

if [ -z "$DENV" ] || [ -z "$POSTFIX" ] || [ -z "$TOR" ] ||  [ -z "$FORTUNE" ] || [ -z "$FIGLET" ] || \
[ -z "$XTERM" ] || [ -z "$FINCH" ] || [ -z "$IRSSI" ] || [ -z "$SENDXMPP" ] || [ -z "$PYPIP" ] || \
[ -z "$CMUS" ] || [ -z "$SVN"    ] || [ -z "$SCREEN"   ] || [ -z "$TF"  ] || [ -z "$POWERLINE" ] || \
[ -z "$HTOP" ] || [ -z "$LSOF" ] || [ -z "$HG" ] || [ -z "$BZR" ] || [ -z "$STRACE" ] || [ -z "$COWSAY" ] || \
[ -z "$LSBR" ] || [ -z "$GIT" ] || [ -z "$CURL" ] || [ -z "$WGET" ] || [ -z "$VIM" ] || [ -z "$VIM" ] || \
[ -z "$TMUX" ] || [ -z "$ZSH" ] || [ -z "$FISH" ] || [ -z "$SUDO" ] || [ -z "$NEOFETCH" ] || [ -z "$GPG" ] || \
[ -z "$NETTOOLS" ]  || [ -z "$APACHE" ] || [ -z "$NGINX" ]; then

    ##################################################################################################
    printf "\n\t\t ${RED} *** • The following are needed: • ***${NC}\n"
    printf "\n\t\t ${RED} *** • ${MISSING} • ***${NC}\n"
    printf "\n\t\t ${RED} *** • Attempting to install the missing package[s] • ***${NC}\n\n"
    ##################################################################################################
    if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
     for MISSINGPKG in ${MISSING} ; do
      sudo $pkgmgr $instoption ${MISSINGPKG} >/dev/null 2>&1
     done
     __requiredpkgs
     __missingpkg
     if [ -n "$MISSING" ]; then
         printf "\t\t ${RED} *** • Install failed please install the packages manually • ***${NC}\n"
         printf "\t\t ${RED} *** • $pkgmgrman ${MISSING} • ***${NC}\n\n\n"
         sleep 5
     fi
    else
    ##################################################################################################
    printf "\t\t ${RED} *** • I can't get root access You will have to manually install the missing programs • ***${NC}\n"
    printf "\t\t ${RED} *** • "${MISSING}" • ***${NC}\n\n\n"
    ##################################################################################################
    exit
    fi
fi

##################################################################################################
printf "\n\t\t ${BLUE} *** Setting up the git repo *** ${NC} \n "
##################################################################################################
find "$HOME" -xtype l -delete
mkdir -p "$HOME"/.ssh $HOME/.gnupg

if [ -d "$DOTFILES"/.git ]; then
 cd "$DOTFILES" && git pull
 [ $? -eq 0 ] || exit 1
else
 git clone -q "$GITURL" "$DOTTEMP" >/dev/null 2>&1
 [ $? -eq 0 ] || exit 1
fi

##################################################################################################
printf "\n\t\t ${BLUE} *** Installing your dotfiles *** ${NC} \n "
##################################################################################################
# fix hostname and ip
CURRIP4="$(/sbin/ifconfig | grep -E "venet|inet" | grep -v "127.0.0." | grep 'inet' | grep -v inet6 | awk '{print $2}' | sed s#addr:##g | head -n1)"
find $DOTTEMP -type f -exec sed -i "s#MYHOSTIP#$CURRIP4#g" {} \; >/dev/null 2>&1
find $DOTTEMP -type f -exec sed -i "s#MYHOSTNAME#$(hostname -s)#g" {} \; >/dev/null 2>&1


# Fix permissions
find "$DOTTEMP"/ -type f -iname "**bash" -exec chmod 755 -Rf {} \;
find "$DOTTEMP"/ -type f -iname "*.sh" -exec chmod 755 -Rf {} \;
find "$DOTTEMP"/ -type f -iname "*.pl" -exec chmod 755 -Rf {} \;
find "$DOTTEMP"/ -type f -iname "*.cgi" -exec chmod 755 -Rf {} \;
unalias cp 2>/dev/null
rm -Rf "$DOTTEMP"/etc/skel/.config/bash/profile/*.win
cp -Rfa "$DOTTEMP"/etc/skel/. "$HOME"/

# Needed for gpg
export GPG_TTY="$(tty)"

# Import gpg keys
gpg --import "$DOTTEMP"/tmp/*.gpg >/dev/null 2>&1

# Set correct Permissions
find "$HOME"/.gnupg "$HOME"/.ssh -type f -exec chmod 600 {} \;
find "$HOME"/.gnupg "$HOME"/.ssh -type d -exec chmod 700 {} \;
chmod 755 -f "$HOME"

# Setup vim
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is setting up vim *** ${NC} \n "
##################################################################################################
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
 git clone -q https://github.com/VundleVim/Vundle.vim.git "$HOME"/.vim/bundle/Vundle.vim 2>/dev/null
fi
 vim +PluginInstall +qall 2>/dev/null
##################################################################################################

# Setup neovim
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is setting up neovim *** ${NC} \n "
##################################################################################################
if [ ! -d $HOME/.SpaceVim ]; then
 curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim 2>/dev/null
fi
 nvim +PluginInstall +qall 2>/dev/null
##################################################################################################

# Setup tmux
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is setting up tmux *** ${NC} \n "
##################################################################################################
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
 git clone -q https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm >/dev/null 2>&1
fi
 bash $HOME/.tmux/plugins/tpm/scripts/install_plugins.sh >/dev/null 2>&1
##################################################################################################

# Setup git
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is setting up git *** ${NC} \n "
##################################################################################################
if [ ! -d $HOME/.config/git/plugins/.git ]; then
 git clone -q https://github.com/arialdomartini/oh-my-git.git $HOME/.config/git/plugins >/dev/null 2>&1
fi
##################################################################################################

# Setup zsh
printf "\n\t\t ${BLUE} *** The installer is setting up the zsh Shell *** ${NC} \n "
##################################################################################################
if [ ! -d $HOME/.config/zsh/plugins/.git ]; then
 git clone -q https://github.com/robbyrussell/oh-my-zsh.git $HOME/.config/zsh/plugins >/dev/null 2>&1
fi
if [ ! -d $HOME/.config/zsh/themes/powerlevel9k/.git ]; then
 git clone -q https://github.com/bhilburn/powerlevel9k.git $HOME/.config/zsh/themes/powerlevel9k >/dev/null 2>&1
fi
if [ ! -d $HOME/.config/zsh/themes/powerlevel10k/.git ]; then
 git clone -q https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/themes/powerlevel10k >/dev/null 2>&1
fi
##################################################################################################

# Setup Fish
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is setting up the fish Shell *** ${NC} \n "
##################################################################################################
if [ ! -d $HOME/.config/fish/plugins/.git ]; then
 fish $HOME/.config/fish/omf-install --path=~/.config/fish/plugins --config=~/.config/fish/omf --noninteractive --yes >/dev/null 2>&1
 fish $HOME/.config/fish/plugins.fish >/dev/null 2>&1
 rm -Rf $HOME/.config/fish/omf-install
fi

# Setup twitter client
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is setting up terminal apps *** ${NC} \n "
##################################################################################################
#Install global if possible
if [ -n $(which rainbowstream 2>/dev/null) ] ||  [ -n $(which toot 2>/dev/null) ] || [ -n $(which castero 2>/dev/null) ]; then
 if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
  sudo sh -c "$PIP install toot castero rainbowstream git+https://github.com/sixohsix/python-irclib >/dev/null 2>&1"
 else
  sh -c "$PIP install --user toot castero rainbowstream git+https://github.com/sixohsix/python-irclib >/dev/null 2>&1"
 fi
fi

# Make this default for all new users
if [ ! -f $HOME/.sudo ]; then
 if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
  ##################################################################################################
  printf "\n\t\t ${BLUE} *** The installer is installing system wide *** ${NC} \n "
  ##################################################################################################
if [ -f /etc/postfix/.installed ]; then rm -Rf $DOTTEMP/etc/postfix; fi
 sudo cp -Rf $DOTTEMP/etc/* /etc/ >/dev/null 2>&1
 sudo cp -Rf $DOTTEMP/usr/* /usr/ >/dev/null 2>&1
 sudo cp -Rf $DOTTEMP/var/* /var/ >/dev/null 2>&1
 sudo cp -Rf $DOTTEMP/OS/* / >/dev/null 2>&1

 if [ -f /etc/bash.bashrc ]; then sudo mv -f /etc/bashrc /etc/bash.bashrc ; fi
 if [ -d /etc/profile.d ]; then sudo rm -Rf /etc/profile.d/zz-* ; fi
 if [ -d /usr/local/share/ca-certificates ]; then sudo cp -Rf /etc/ssl/CA/CasjaysDev/certs/ca.crt /usr/local/share/ca-certificates/CasjaysDev.crt
 elif [ -d /etc/pki/ca-trust/source/anchors ]; then sudo cp -Rf /etc/ssl/CA/CasjaysDev/certs/ca.crt /etc/pki/ca-trust/source/anchors/CasjaysDev.crt
 fi
 sudo update-ca-certificates >/dev/null 2>&1
 sudo rm -Rf $HOME/motd
 echo -e "\n\n" > $HOME/motd 2>/dev/null
 if [ -f "$(which fortune 2>/dev/null)" ] && [ -f "$(which cowsay 2>/dev/null)" ]; then
  sh -c "$(which fortune 2>/dev/null) | $(which cowsay 2>/dev/null) >> $HOME/motd 2>/dev/null"
 fi
 echo -e "\n\n" >> $HOME/motd
 sudo mv -f $HOME/motd /etc/motd 2>/dev/null
 sudo touch /etc/postfix/.installed
 sudo mkdir -p /var/lib/tor/hidden_service
 sudo systemctl enable tor postfix >/dev/null 2>&1
 sudo systemctl restart tor postfix >/dev/null 2>&1
 fi
fi

# Apply any patches
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is applying patches *** ${NC} \n "
##################################################################################################
if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
 bash -c "./patches/apply-patches.sh >/dev/null 2>&1"
fi

##################################################################################################

# Finalizing
##################################################################################################
printf "\n\t\t ${BLUE} *** The installer is running post install commands *** ${NC} \n "
##################################################################################################
fc-cache -f >/dev/null 2>&1
rm -Rf $DOTTEMP
unset __requiredpkgs __missingpkg $DOTTEMP >/dev/null 2>&1
sudo systemctl enable nginx $APACHE

##################################################################################################

##################################################################################################
printf "\n\t\t ${BLUE} *** The installer has finished *** ${NC} \n\n "
printf "\t\t ${RED} *** For the configurations to take effect *** ${NC} \n "
printf "\t\t ${RED} *** you should logout or restart your system *** ${NC} \n\n\n\n "
##################################################################################################
