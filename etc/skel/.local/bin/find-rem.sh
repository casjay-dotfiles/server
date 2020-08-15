#!/usr/bin/env bash
if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' > /dev/null; then
   find /tmp/dotfiles/ -type f -iname "*.rmpnew" -exec rm -Rf {} \;
fi
    find /tmp/dotfiles/ -type f -iname "*.sample" -exec rm -Rf {} \;

