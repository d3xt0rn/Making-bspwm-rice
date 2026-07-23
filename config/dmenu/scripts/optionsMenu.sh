#!/bin/sh

scripts="$HOME/.config/bspwm/scripts"

choice=$(
  printf "%s\n" \
    "Wallpaper" \
    "Power" |
    dmenu -i -p "Scripts:"
)

case "$choice" in
Wallpaper) "$HOME/.config/dmenu/scripts/wallpapers.sh" ;;
Power) "$HOME/.config/dmenu/scripts/powermenu.sh" ;;
esac
