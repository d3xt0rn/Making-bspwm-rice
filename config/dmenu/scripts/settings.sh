#!/bin/sh

scripts="$HOME/.config/bspwm/scripts"

choice=$(
  printf "%s\n" \
    "Cursor" |
    dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -i -p "Scripts:"
)

case "$choice" in
Cursor) "$HOME/.config/dmenu/scripts/cursor.sh" ;;
esac
