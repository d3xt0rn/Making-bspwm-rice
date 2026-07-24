#!/bin/sh

choice=$(
  printf "%s\n" \
    "Wallpaper" \
    "Cursor" \
    "Config files" \
    "Restart WM and Deamons" |
    dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -i -p "Scripts:"
)

case "$choice" in
Wallpaper) "$HOME/.config/dmenu/scripts/wallpapers.sh" ;;
Cursor) "$HOME/.config/dmenu/scripts/cursor/cursorMenu.sh" ;;
"Config files") "$HOME/.config/dmenu/scripts/configsMenu/main.sh" ;;
"Restart WM and Deamons") "$HOME/.config/sxhkd/scripts/restart.sh" ;;
esac
