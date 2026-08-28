#!/bin/sh

# Merge X resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec i3

# Load scripts in /etc/X11/xinit/xinitrc.d directory
if [ -d "/etc/X11/xinit/xinitrc.d" ]; then
    for f in "/etc/X11/xinit/xinitrc.d"/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
