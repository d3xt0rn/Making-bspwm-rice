#!/bin/sh

WALL=$(find "$HOME/.wallpapers" -type f | dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -l 15 -p "Wallpaper")

[ -z "$WALL" ] && exit

feh --bg-fill "$WALL"
