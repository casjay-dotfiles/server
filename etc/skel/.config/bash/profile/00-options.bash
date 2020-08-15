#!/usr/bin/env bash

# Bash options.
# https://www.gnu.org/software/bash/manual/bashref.html#The-Shopt-Builtin

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Automatically prepend `cd` to directory names.

shopt -s autocd 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Autocorrect typos in path names when using the `cd` command.

shopt -s cdspell 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Check the window size after each command and, if necessary, update
# the values of `LINES` and `COLUMNS`.

shopt -s checkwinsize 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Save all lines of a multiple-line command in the same history entry.

shopt -s cmdhist 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Include filenames beginning with a "." in the filename expansion.

shopt -s dotglob 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use extended pattern matching features.

shopt -s extglob 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Append to the history file rather then overwriting it.

shopt -s histappend 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Do not attempt to search the PATH for possible completions when
# completion is attempted on an empty line.

shopt -s no_empty_cmd_completion 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Match filenames in a case-insensitive fashion when performing
# filename expansion.

shopt -s nocaseglob 2>/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Bash up arrow to search history

#set show-all-if-ambiguous on 2>/dev/null
#set completion-ignore-case on 2>/dev/null
