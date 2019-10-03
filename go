#!/bin/sh

find . -maxdepth 1 -not -path . -type d | sed 's/\.\///g' | xargs stow -t $HOME -R 2>/dev/null
