ZSH=$HOME/.config/zsh/plugins
ZSHTHEME=$HOME/.config/zsh/themes

if [ ! -f ~/.config/zsh/plugins/oh-my-zsh.sh ]; then
 echo "Installing oh-my-sh and themes"
 rm -Rf ~/.config/zsh/plugins ~/.config/zsh/themes/powerlevel9k ~/.config/zsh/themes/powerlevel10k
 git clone -q https://github.com/robbyrussell/oh-my-zsh.git ~/.config/zsh/plugins
 git clone -q https://github.com/bhilburn/powerlevel9k.git ~/.config/zsh/themes/powerlevel9k
 git clone -q https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/themes/powerlevel10k
fi

#oh-myzsh
source $ZSH/oh-my-zsh.sh

#powerlevel9k
source $ZSHTHEME/powerlevel9k/powerlevel9k.zsh-theme

#powerlevel10k
#source $ZSHTHEME/powerlevel10k/powerlevel10k.zsh-theme

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='5'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='0'
POWERLEVEL9K_STATUS_OK_BACKGROUND='8'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='11'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='8'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='10'
POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS='0.05'
POWERLEVEL9K_VI_INSERT_MODE_STRING='INSERT'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='NORMAL'﻿
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

plugins=(
  git
  colorize
  vscode
  vundle
  command-not-found
  pyenv
  thefuck
  tmux
  vundle
  zsh_reload
)

# oh-my-zsh cache dir
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

