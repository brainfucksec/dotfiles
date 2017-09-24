#!/bin/sh

includes=/etc/X11/xinit/xinitrc.d
if [ -d "$includes" ]
then
for f in "$includes"*
do
[ -x "$f" ] && . "$f"
done
unset f
fi
unset includes

exec startxfce4

