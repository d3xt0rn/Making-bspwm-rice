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

if grep -q '^Xcursor\.theme:' "$HOME/.Xresources" 2>/dev/null; then
  sed -i "s/^Xcursor\.theme:.*/Xcursor.theme: $CURSOR/" "$HOME/.Xresources"
else
  printf "Xcursor.theme: %s\n" "$CURSOR" >>"$HOME/.Xresources"
fi

xrdb -merge "$HOME/.Xresources"

notify-send "Cursor" "Switched to $CURSOR"

xsetroot -cursor_name left_ptr
