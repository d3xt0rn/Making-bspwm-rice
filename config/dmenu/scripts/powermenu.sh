#!/bin/sh

options="Logout\nRestart\nShutdown"

chosen=$(echo -e "$options" | dmenu -i -p "Power:")

case "$chosen" in
Logout) bspc quit ;;
Restart) doas reboot ;;
Shutdown) doas poweroff ;;
esac
