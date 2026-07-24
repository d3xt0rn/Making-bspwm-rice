#!/bin/sh
pkill polybar
pkill dmenu
pkill sxhkd
pkill picom
pkill clipmenu
pkill flameshot
pkill dunst
pkill clipmenud
pkill $HOME/.config/bspwm/scripts/battery.sh
bspc wm -r
