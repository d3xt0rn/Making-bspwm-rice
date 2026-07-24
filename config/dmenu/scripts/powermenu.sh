#!/bin/sh

options="Logout\nRestart\nShutdown"

chosen=$(echo -e "$options" | dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -i -p "Power:")

case "$chosen" in
Logout) bspc quit ;;
Restart) loginctl reboot ;;
Shutdown) loginctl poweroff ;;
esac
