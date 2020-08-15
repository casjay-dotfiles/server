#!/usr/bin/env bash
# //TODO add ruby and nodejs virtual env
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Powerline check
if [ -f "$(which powerline-daemon 2>/dev/null)" ]; then

#Debian/Ubuntu/Arch
    if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
      source /usr/share/powerline/bindings/bash/powerline.sh
    fi

#Redhat/CentOS
    if [ -f /usr/share/powerline/bash/powerline.sh ]; then
      source /usr/share/powerline/bash/powerline.sh
    fi

#MacOS
    if [ -f /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
      source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
    fi

    powerline-daemon -q 2>/dev/null
    export POWERLINE_BASH_CONTINUATION=1
    export POWERLINE_BASH_SELECT=1
fi

# Borrowed and customized from https://github.com/riobard/bash-powerline

__powerline() {

  # Unicode symbols
  readonly PS_SYMBOL_DARWIN=' 🍎 ' 2>/dev/null
  readonly PS_SYMBOL_LINUX=' 🐧 '  >/dev/null
  readonly PS_SYMBOL_OTHER=' 👽 ' 2>/dev/null
  readonly GIT_BRANCH_SYMBOL=' 🎆 ' 2>/dev/null
  readonly GIT_BRANCH_CHANGED_SYMBOL='  ➕ ' 2>/dev/null
  readonly GIT_NEED_PUSH_SYMBOL=' 🔼 ' 2>/dev/null
  readonly GIT_NEED_PULL_SYMBOL=' 🔽 ' 2>/dev/null
  readonly RUBY_SYMBOL=' ☢️ ' 2>/dev/null
  readonly NODE_SYMBOL=' 🔥 ' 2>/dev/null
  readonly PYTHON_SYMBOL=' 🐍 ' 2>/dev/null
  readonly PHP_SYMBOL=' ♻️ ' 2>/dev/null

  #readonly GIT_BRANCH_SYMBOL='⑂' 2>/dev/null
  #readonly GIT_BRANCH_CHANGED_SYMBOL='+' 2>/dev/null
  #readonly GIT_NEED_PUSH_SYMBOL='⇡' 2>/dev/null
  #readonly GIT_NEED_PULL_SYMBOL='⇣' 2>/dev/null
  function __tput { tput $* 2> /dev/null; }

  readonly FG_BLACK="\[$(__tput setaf 0 2>/dev/null)\]"

  readonly FG_GRAY1="\[$(__tput setaf 15 2>/dev/null)\]"
  readonly FG_GRAY2="\[$(__tput setaf 7 2>/dev/null)\]"
  readonly FG_GRAY3="\[$(__tput setaf 8 2>/dev/null)\]"

  readonly FG_RED="\[$(__tput setaf 9 2>/dev/null)\]"
  readonly FG_GREEN="\[$(__tput setaf 10 2>/dev/null)\]"
  readonly FG_YELLOW="\[$(__tput setaf 11 2>/dev/null)\]"
  readonly FG_BLUE="\[$(__tput setaf 12 2>/dev/null)\]"
  readonly FG_MAGENTA="\[$(__tput setaf 13 2>/dev/null)\]"
  readonly FG_CYAN="\[$(__tput setaf 14 2>/dev/null)\]"

  readonly FG_DARK_RED="\[$(__tput setaf 1 2>/dev/null)\]"
  readonly FG_DARK_GREEN="\[$(__tput setaf 2 2>/dev/null)\]"
  readonly FG_MUSTARD="\[$(__tput setaf 3 2>/dev/null)\]"
  readonly FG_NAVY="\[$(__tput setaf 4 2>/dev/null)\]"
  readonly FG_PURPLE="\[$(__tput setaf 5 2>/dev/null)\]"
  readonly FG_TURQUOISE="\[$(__tput setaf 6 2>/dev/null)\]"

  readonly BG_BLACK="\[$(__tput setab 0 2>/dev/null)\]"

  readonly BG_GRAY1="\[$(__tput setab 15 2>/dev/null)\]"
  readonly BG_GRAY2="\[$(__tput setab 7 2>/dev/null)\]"
  readonly BG_GRAY3="\[$(__tput setab 8 2>/dev/null)\]"

  readonly BG_RED="\[$(__tput setab 9 2>/dev/null)\]"
  readonly BG_GREEN="\[$(__tput setab 10 2>/dev/null)\]"
  readonly BG_YELLOW="\[$(__tput setab 11 2>/dev/null)\]"
  readonly BG_BLUE="\[$(__tput setab 12 2>/dev/null)\]"
  readonly BG_MAGENTA="\[$(__tput setab 13 2>/dev/null)\]"
  readonly BG_CYAN="\[$(__tput setab 14 2>/dev/null)\]"

  readonly BG_DARK_RED="\[$(__tput setab 1 2>/dev/null)\]"
  readonly BG_DARK_GREEN="\[$(__tput setab 2 2>/dev/null)\]"
  readonly BG_MUSTARD="\[$(__tput setab 3 2>/dev/null)\]"
  readonly BG_NAVY="\[$(__tput setab 4 2>/dev/null)\]"
  readonly BG_PURPLE="\[$(__tput setab 5 2>/dev/null)\]"
  readonly BG_TURQUOISE="\[$(__tput setab 6 2>/dev/null)\]"

  readonly BG_DEEP_GREEN="\[$(__tput setab 22 2>/dev/null)\]"

  readonly DIM="\[$(__tput dim 2>/dev/null)\]"
  readonly REVERSE="\[$(__tput rev 2>/dev/null)\]"
  readonly RESET="\[$(__tput sgr0 2>/dev/null)\]"
  readonly BOLD="\[$(__tput bold 2>/dev/null)\]"

  # what OS?
  case "$(uname)" in
    Darwin)
      readonly PS_SYMBOL="$PS_SYMBOL_DARWIN"
      ;;
    Linux)
      readonly PS_SYMBOL="$PS_SYMBOL_LINUX"
      ;;
    *)
      readonly PS_SYMBOL="$PS_SYMBOL_OTHER"
  esac

  ### Ruby #######################################################
  if [ "$(which rbenv 2> /dev/null)" ]; then
      __ruby_version() { printf $(rbenv version-name); }
  elif [ "$(which ruby 2> /dev/null)" ]; then
      __ruby_version() { printf $(ruby --version | cut -d' ' -f2); }
  else
    __ruby_version() { return; }
  fi

  __ruby_info() {
    local version=$(__ruby_version)
    [ -z "${version}" ] && return
    printf " Ruby ${version} $RUBY_SYMBOL $RESET"
  }

  ### Node.js ####################################################
  if [ "$(which nodenv 2> /dev/null)" ]; then
    __node_version() { printf $(nodenv version-name); }
  elif [ "$(which node 2> /dev/null)" ]; then
    __node_version() { printf $(node -v | cut -d'v' -f2); }
  else
    __node_version() { return; }
  fi

  __node_info() {
    local version=$(__node_version)
    [ -z "${version}" ] && return
    printf " Node ${version}$NODE_SYMBOL"
  }

# Determine active Python virtualenv details.
  __python_info() {
  if [[ $VIRTUAL_ENV != "" ]]; then
    venv="(${VIRTUAL_ENV##*/})"
    __python_version() { printf $(python -c 'import platform; print(platform.python_version())'); }
  else
    venv=''
  if [ "$(which python3 2> /dev/null)" ]; then
    __python_version() { printf $(python3 -c 'import platform; print(platform.python_version())'); }
  elif [ "$(which python 2> /dev/null)" ]; then
    __python_version() { printf $(python -c 'import platform; print(platform.python_version())'); }
  else
    __python_version() { return; }
  fi
  fi

    local version=$(__python_version)
    [ -z "${version}" ] && return
    printf " Python ${version} ${venv}$PYTHON_SYMBOL"
  }

# PHP info
  if [ "$(which php 2>/dev/null)" ]; then
       __php_version () { printf $(php --version | awk '{print $2}' | head -n 1); }
  else
       __php_version () { return; }
  fi
  __php_info() {
    local version=$(__php_version)
    [ -z "$version" ] && return
    printf " PHP $version $BG_GRAY1$PHP_SYMBOL $RESET"
  }

### Git ########################################################
  if [ "$(which git 2> /dev/null)" ]; then
      __git_version() { printf " Git "$(git --version | awk '{print $3}')""; }
  fi
  __git_info() {
    [ -x "$(which git)" ] || return    # git not found

    local git_eng="env LANG=C git"   # force git output in English to make our work easier
    # get current branch name or short SHA1 hash for detached head
    local branch="$($git_eng symbolic-ref --short HEAD 2>/dev/null || $git_eng describe --tags --always 2>/dev/null)"
    [ -n "$branch" ] || return  # git branch not found

    local marks

    # branch is modified?
    [ -n "$($git_eng status --porcelain)" ] && marks+="$GIT_BRANCH_CHANGED_SYMBOL"

    # how many commits local branch is ahead/behind of remote?
    local stat="$($git_eng status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
    local aheadN="$(echo $stat | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    local behindN="$(echo $stat | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    [ -n "$aheadN" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
    [ -n "$behindN" ] && marks+=" $GIT_NEED_PULL_SYMBOL$behindN"

    printf " $branch$marks "
  }

  ### PROMPT #####################################################
  __title_info() { echo -ne "${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}"; }

  case $TERM in
    xterm*|rxvt|Eterm|eterm)
      title() { echo -ne "\033]0;$(__title_info)\007"; }
      ;;
    screen)
      title() { echo -ne "\033_$(__title_info)\033\\"; }
      ;;
  esac
    # ------------------------------------------------------------------
    # | PS1 - Powerline                           |
    # ------------------------------------------------------------------

  ps1() {


    local bold=$(tput bold 2> /dev/null)
    local reset=$(tput sgr0 2> /dev/null)

    local cyan=""
    local green=""
    local orange=""
    local white=""
    local yellow=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ "$(tput colors 2> /dev/null || printf "0")" -ge 256 ]; then

        cyan=$(tput setaf 37)
        green=$(tput setaf 64)
        orange=$(tput setaf 166)
        white=$(tput setaf 15)
        yellow=$(tput setaf 136)
        red=$(tput setaf 1)
        purple=$(tput setaf 5)
    fi

    # Check the exit code of the previous command and display different
    # colors in the prompt accordingly.
    if [ $? -eq 0 ]; then
      local BG_EXIT="$BG_DARK_GREEN"
    else
      local BG_EXIT="$BG_RED"
    fi

    PS_LINE=`printf -- '- %.0s' {1..2000}`
    PS_FILL=${PS_LINE:0:$COLUMNS}
    PS_TIME="$RESET$BG_PURPLE$FG_BLACK\[\033[\$((COLUMNS-10))G\][\t]$RESET"

    PS1="\${PS_FILL}\[\033[0G\]"
    PS1+="$RESET"
    PS1+="$BG_TURQUOISE$FG_BLACK \s: \v $RESET"
    PS1+="$BG_PURPLE$FG_BLACK$(__php_info)$RESET"
    PS1+="$BG_DARK_RED$FG_BLACK$(__ruby_info)$RESET"
    PS1+="$BG_DEEP_GREEN$FG_BLACK$(__node_info)$RESET"
    PS1+="$BG_RED$FG_BLACK$(__python_info)$RESET"
    PS1+="$BG_MAGENTA$FG_BLACK$(__git_version)$(__git_info)$GIT_BRANCH_SYMBOL $RESET"
    PS1+="$RESET$BG_PURPLE$FG_BLACK${PS_TIME}$RESET"
    PS1+="$RESET$BG_GRAY2$FG_BLACK \u@\H:$BG_DARK_GREEN\w$RESET\n"
    PS1+="$BG_EXIT$FG_BLACK Jobs:[\j]$BG_GRAY1$PS_SYMBOL$RESET"

  }

  PROMPT_COMMAND="ps1 && title"
}

    # ------------------------------------------------------------------
    # | PS2 - Continuation interactive prompt                          |
    # ------------------------------------------------------------------

    PS2="⚡ "

    export PS2

    # ------------------------------------------------------------------
    # | PS4 - Debug prompt                                             |
    # ------------------------------------------------------------------

    # e.g:
    #
    # The GNU `date` command has the `%N` interpreted sequence while
    # other implementations don't (on macOS `gdate` can be used instead
    # of the native `date` if the `coreutils` package has been installed).
    #
    #  local dateCmd=""
    #
    #  if [ "$(date +%N)" != "N" ] || \
    #     [ ! -x "$(command -v "gdate")" ]; then
    #     dateCmd="date +%s.%N"
    #  else
    #     dateCmd="gdate +%s.%N"
    #  fi
    #
    #  PS4="+$( tput cr && tput cuf 6 &&
    #            printf "$yellow %s $green%6s $reset" "$($dateCmd)" "[$LINENO]" )"
    #
    # PS4 output:
    #
    #   ++    1357074705.875970000  [123] '[' 1 == 0 ']'
    #   └──┬─┘└────┬───┘ └───┬───┘ └──┬─┘ └──────┬─────┘
    #      │       │         │        │          │
    #      │       │         │        │          └─ command
    #      │       │         │        └─ line number
    #      │       │         └─ nanoseconds
    #      │       └─ seconds since 1970-01-01 00:00:00 UTC
    #      └─ depth-level of the subshell

    PS4="+$( tput cr 2> /dev/null;
             tput cuf 6 2> /dev/null;
             printf "%s" "$RESET" )"

    export PS4

__powerline 2>/dev/null
unset __powerline
