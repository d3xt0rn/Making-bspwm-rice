#!/bin/sh

scripts="$HOME/.config/bspwm/scripts"

choice=$(
  printf "%s\n" \
    "Select Cursor" \
    "Cursor Size" |
    dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -i -p "Scripts:"
)

case "$choice" in
"Select Cursor") "$HOME/.config/dmenu/scripts/cursor/cursor.sh" ;;
"Cursor Size") "$HOME/.config/dmenu/scripts/cursor/cursorSize.sh" ;;
esac
