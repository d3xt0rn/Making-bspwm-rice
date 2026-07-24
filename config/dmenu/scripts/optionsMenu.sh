#!/bin/sh

choice=$(
  printf "%s\n" \
    "Wallpaper" \
    "Power" \
    "Some settings" |
    dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -i -p "Scripts:"
)

case "$choice" in
Wallpaper) "$HOME/.config/dmenu/scripts/wallpapers.sh" ;;
Power) "$HOME/.config/dmenu/scripts/powermenu.sh" ;;
"Some settings") "$HOME/.config/dmenu/scripts/settings.sh" ;;
esac
