#!/bin/sh

WALL=$(find "$HOME/.wallpapers" -type f | dmenu -l 15 -p "Wallpaper")

[ -z "$WALL" ] && exit

feh --bg-fill "$WALL"
