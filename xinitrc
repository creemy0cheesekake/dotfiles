#!/bin/sh

# userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap
#
# # merge in defaults and keymaps
#
# if [ -f $sysresources ]; then
#
#
#
#
#
#
#
#     xrdb -merge $sysresources
#
# fi
#
# if [ -f $sysmodmap ]; then
#     xmodmap $sysmodmap
# fi
#
# if [ -f "$userresources" ]; then
#
#
#
#
#
#
#
#     xrdb -merge "$userresources"
#
# fi
#
# if [ -f "$usermodmap" ]; then
#     xmodmap "$usermodmap"
# fi
#
# start some nice programs

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -le 3 ]; then
  exec startx
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -e $HOME/.config/xorg/xprofile ] && . $HOME/.config/xorg/xprofile 
firefox &
exec xmonad

# exec xmonad
# mpris-proxy & 

