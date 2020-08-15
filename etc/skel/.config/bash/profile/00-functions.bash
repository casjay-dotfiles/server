#!/usr/bin/env bash

# Define colors
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[32m'
NC='\033[0m'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Create data URI from a file.
datauri() {

    local mimeType=""

    if [ -f "$1" ]; then
        mimeType=$(file -b --mime-type "$1")
        #                └─ do not prepend the filename to the output

        if [[ $mimeType == text/* ]]; then
            mimeType="$mimeType;charset=utf-8"
        fi

        printf "data:%s;base64,%s" \
                    "$mimeType" \
                    "$(openssl base64 -in "$1" | tr -d "\n")"
    else
        printf "%s is not a file.\n" "$1"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Delete files that match a certain pattern from the current directory.

#delete-files() {
#    local q="${1:-*.DS_Store}"
#    find . -type f -name "$q" -ls -delete
#}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Get gzip information (gzipped file size + reduction size).

gz() {

    declare -i gzippedSize=0
    declare -i originalSize=0

    if [ -f "$1" ]; then
        if [ -s "$1" ]; then

            originalSize=$( wc -c < "$1" )
            printf "\n original size:   %12s\n" "$(hrfs "$originalSize")"

            gzippedSize=$( gzip -c "$1" | wc -c )
            printf " gzipped size:    %12s\n" "$(hrfs "$gzippedSize")"

            printf " ─────────────────────────────\n"
            printf " reduction:       %12s [%s%%]\n\n" \
                        "$( hrfs $((originalSize - gzippedSize)) )" \
                        "$( printf "%s" "$originalSize $gzippedSize" | \
                            awk '{ printf "%.1f", 100 - $2 * 100 / $1 }' | \
                            sed -e "s/0*$//;s/\.$//" )"
                            #              └─ remove tailing zeros

        else
            printf "\"%s\" is empty.\n" "$1"
        fi
    else
        printf "\"%s\" is not a file.\n" "$1"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Human readable file size
# (because `du -h` doesn't cut it for me).

hrfs() {

    printf "%s" "$1" |
    awk '{
            i = 1;
            split("B KB MB GB TB PB EB ZB YB WTFB", v);
            value = $1;

            # confirm that the input is a number
            if ( value + .0 == value ) {

                while ( value >= 1024 ) {
                    value/=1024;
                    i++;
                }

                if ( value == int(value) ) {
                    printf "%d %s", value, v[i]
                } else {
                    printf "%.1f %s", value, v[i]
                }

            }
        }' |
    sed -e ":l" \
        -e "s/\([0-9]\)\([0-9]\{3\}\)/\1,\2/; t l"
    #    └─ add thousands separator
    #       (changes "1023.2 KB" to "1,023.2 KB")
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Create new directories and enter the first one.

mkd() {
    if [ -n "$*" ]; then

        mkdir -p "$@"
        #      └─ make parent directories if needed

        cd "$@" \
            || exit 1

    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Process phone images.

ppi() {
    command -v "convert" &> /dev/null \
        || exit 0;

    declare query="${1:-*.jpg}"
    declare geometry="${2:-50%}"

    for i in "$query"; do

        if [[ "$(echo ${i##*.} | tr '[:upper:]' '[:lower:]')" != "png" ]]; then
            imgName="${i%.*}.png"
        else
            imgName="_${i%.*}.png"
        fi

        convert "$i" \
            -colorspace RGB \
            +sigmoidal-contrast 11.6933 \
            -define filter:filter=Sinc \
            -define filter:window=Jinc \
            -define filter:lobes=3 \
            -sigmoidal-contrast 11.6933 \
            -colorspace sRGB \
            -background transparent \
            -gravity center \
            -resize "$geometry" \
            +append \
            "$imgName" \
        && printf "* %s (%s)\n" \
            "$imgName" \
            "$geometry"

    done
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Search history.

qh() {
    #           ┌─ enable colors for pipe
    #           │  ("--color=auto" enables colors only if
    #           │  the output is in the terminal)
    grep --color=always "$*" "$HISTFILE" |       less -RX
    # display ANSI color escape sequences in raw form ─┘│
    #       don't clear the screen after quitting less ─┘
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Search for text within the current directory.

qt() {
    grep -ir --color=always "$*" --exclude-dir=".git" --exclude-dir="node_modules" . | less -RX
    #     │└─ search all files under each directory, recursively
    #     └─ ignore case
}

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

pathmunge () {
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}

#Git Functions
gitreinit () {
    rm -Rf .git && \
	git init && \
	git add . && \
	git commit -S -m "Initial Commit"
}

gitcommit () {
    git add . && \
	git commit -S && \
	git push -f
}

gitup () {
    git pull >/dev/null 2>&1 && \
    echo "Commiting Changes" && \
	git add . && \
	git commit -S && \
	git push -f
}

gitpu () {
    echo "Running git pull" && \
	git pull
}

#Git add github remote
gitremoteaddgh () {
    git remote add origin https://github.com/$1
}

#Git remove github remote
gitremoteremgh () {
    git remote rm https://github.com/$1
}

#Git add gitlab remote
gitremoteaddgl () {
    git remote add origin https://gitlab.com/$1
}

#Git remove gitlab remote
gitremoteremgl () {
    git remote rm https://gitlab.com/$1
}

#Git add private remote
gitremoteaddpr () {
    git remote add origin https://git.casjay.in/$1
}

#Git remove private remote
gitremoterempr () {
    git remote rm https://git.casjay.in/$1
}

#Fun functions
rr () {
    curl -LSs https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash
}

wttrin () {
    curl -LSs http://wttr.in/$1?AFu$2 | grep -v "Location" && echo -e "\n\n"
}

wttrin2 () {
    curl -LSs http://v2.wttr.in/$1?AFu$2 | grep -v "Location" && echo -e "\n\n"
}

tweet() {
    twitter set "$1"
}

mastodon() {
    toot post "$1"
}

social() {
    tweet "$1"
    mastodon "$1"
}

fuck () {
    TF_CMD=$(TF_ALIAS=fuck \
    PYTHONIOENCODING=utf-8 \
    TF_SHELL_ALIASES=$(alias)
    thefuck $(fc -ln -1)) && \
    eval $TF_CMD && history -s $TF_CMD
}

# netstat functions
netstatl() {
    sudo netstat -taupln | grep "$@"
}

netstatg() {
    sudo netstat "-$1" | grep "$2"
}
