#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} cmus media playet ${normal}\n"
    printf "${menu}**${number} 2)${menu} castero podcast ${normal}\n"
    printf "${menu}**${number} 3)${menu} mplayer ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

if [ -n "$(which cmus 2>/dev/null)" ]; then
__cmus () { cmus; } ; else 
__cmus () { printf "Not installed\n"; }
fi

if [ -n "$(which castero 2>/dev/null)" ]; then
__castero () { castero; } ; else 
__castero () { printf "Not installed\n"; }
fi

if  [ ! -d ~/Movies ]; then
__mplayer () { printf "No media found\n"; }
elif [ -n "$(which mplayer 2>/dev/null)" ]; then
__mplayer () { select FILENAME in ~/Movies/*; do mplayer "$FILENAME"; done; } ; else 
__mplayer () { printf "Not installed or no media found\n"; }
fi

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "launching cmus && sleep 3";
            printf "__cmus; #cmus music player";
            show_menu;
        ;;
        2) clear;
            option_picked "launching castero && sleep 3";
            printf "__castero; #castero podcast client";
            show_menu;
        ;;
        3) clear;
            option_picked "launching player && sleep 3";
            printf "__mplayer";
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done
