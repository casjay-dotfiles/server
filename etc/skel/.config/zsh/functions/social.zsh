# functions
wttrin () { curl -LSs http://wttr.in/$1\?AFu$2 | grep -v "Location" && echo -e "\n\n" };
wttrin2 () { curl -LSs http://v2.wttr.in/$1\?AFu$2 | grep -v "Location" && echo -e "\n\n" };

tweet () { twitter set $1 };
mastodon () { toot post "$1" };
social () { tweet "$1" ; mastodon "$1" };
