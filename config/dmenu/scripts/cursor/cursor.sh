#!/bin/sh

CURSOR_DIRS="
/usr/share/icons
$HOME/.local/share/icons
$HOME/.icons
"

find_cursors() {
  for dir in $CURSOR_DIRS; do
    [ -d "$dir" ] || continue
    find "$dir" -maxdepth 2 -name cursors -type d | while read -r c; do
      basename "$(dirname "$c")"
    done
  done | sort -u
}

CURSOR=$(find_cursors | dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -i -p "Cursor:")

[ -z "$CURSOR" ] && exit 0

mkdir -p "$HOME/.icons/default"

cat >"$HOME/.icons/default/index.theme" <<EOF
[Icon Theme]
Inherits=$CURSOR
EOF

printf "Xcursor.theme: %s\n" "$CURSOR" >"$HOME/.Xresources"
xrdb -merge "$HOME/.Xresources"

notify-send "Cursor" "Switched to $CURSOR"

xsetroot -cursor_name left_ptr
