#!/bin/sh

# No control-s / control-q
stty -ixon
shopt -s dotglob # dot files are global

#export PS1="[\[$(tput setaf 9)\]\u\[$(tput setaf 15)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 4)\]\W\[$(tput sgr0)\]] \$ "
export PS1="\u@\h \[$(tput setaf 4)\]\W \[$(tput sgr0)\]\$ "

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"
[ -f "$HOME/.config/exportrc" ] && . "$HOME/.config/exportrc"

