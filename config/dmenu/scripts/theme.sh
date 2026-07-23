#!/bin/sh

options="Light\nDark\n"

chosen=$(echo -e "$options" | dmenu -i -p "Theme:")

case "$chosen" in
Light) "$HOME/.config/dmenu/scripts/themes/light.sh" ;;
Dark) "$HOME/.config/dmenu/scripts/themes/dark.sh" ;;
esac
