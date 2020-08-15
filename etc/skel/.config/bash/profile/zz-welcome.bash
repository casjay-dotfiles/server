#!/usr/bin/env bash
if [ -f $HOME/.config/bash/welcome.msg ]; then
    echo -e "
    \tWelcome to your system!
    \tIt would appear that it
    \thas been setup successfully.
    \tThe .sample files can be edited
    \tand renamed as they wont be
    \toverwritten on any updates.
    \t
    "
 if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
   if sudo bash -c  '[ -f /var/lib/tor/hidden_service/hostname ]'; then
    sudo echo -e "\tthe tor hostname of this system is:"
    sudo echo -e "\t$(sudo cat /var/lib/tor/hidden_service/hostname)"
    sudo echo -e ""
  fi
 fi
    rm -Rf $HOME/.config/bash/welcome.msg
fi
