# zsh config
# Set path
path=($HOME/.local/bin $path)

# Add user functions to $fpath
fpath=(~/.local/share/zsh/functions $fpath)

# Enable completion (this needs to be done before sourcing plugins)
autoload -Uz compinit && compinit

# Load all files from .config/zsh/profile directory
if [ -d $HOME/.config/zsh/profile ]; then
  for file in $HOME/.config/zsh/profile/*.zsh; do
    source $file
  done
fi

# $fpath should not be empty for this to work.
for func in $^fpath/*(N-.x:t); autoload -U $func

# Enable edit-command-line
autoload -U edit-command-line
zle -N edit-command-line

# Enable menu completion
zstyle ':completion:*' menu select

# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1

# History settings
HISTFILE="${ZDOTDIR:-$HOME}"/.config/zsh/zhistory
HISTSIZE=10000
SAVEHIST=10000

# Accept the current autosuggestion
bindkey "^ " autosuggest-accept

# Perform history expansion and insert a space
bindkey " " magic-space

# Add the current line to the stack and start a new command line
bindkey "^Q" push-line

# Make cd push the old directory onto the directory stack
setopt AUTO_PUSHD

# Do not print the directory stack after pushd or popd
setopt PUSHD_SILENT

# Have pushd with no arguments act like `pushd $HOME'
setopt PUSHD_TO_HOME

# Don't push multiple copies of the same directory onto the directory stack
setopt PUSHD_IGNORE_DUPS

# Allow for extended glob patterns
setopt EXTENDED_GLOB

# Disable flow control
setopt NO_FLOW_CONTROL

# Try to correct the spelling of commands
setopt CORRECT

setopt SHARE_HISTORY

# Split words on slashes (useful for paths)
WORDCHARS=${WORDCHARS/\/}

# Remove duplicates in path variables
typeset -gU path fpath cdpath manpath

# Source users file
if [[ -f $HOME/.local/.configs/zsh.local ]]; then
    source $HOME/.local/.configs/zsh.local
fi

