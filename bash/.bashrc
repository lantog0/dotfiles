#!/bin/sh

# No control-s / control-q
stty -ixon
shopt -s dotglob # dot files are global

#export PS1="[\[$(tput setaf 9)\]\u\[$(tput setaf 15)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 4)\]\W\[$(tput sgr0)\]] \$ "
export PS1="\u@\h \[$(tput setaf 4)\]\W \[$(tput sgr0)\]\$ "

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"
[ -f "$HOME/.config/exportrc" ] && . "$HOME/.config/exportrc"

export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave-browser"
export READER="zathura"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export GNUPGHOME="${XDG_CONFIG_HOME:-$HOME/.config}/gnupg"
