#!/bin/sh

SIZE=$(printf "16\n24\n32\n48\n64\n96" | dmenu -nb '#32363e' -nf '#abb2bf' -sb '#e06c75' -sf '#233c34' -i -p "Cursor size:")

[ -z "$SIZE" ] && exit 0

mkdir -p ~/.config

cat >~/.config/cursor-size <<EOF
Xcursor.size: $SIZE
XCURSOR_SIZE=$SIZE
EOF

grep -v "^Xcursor.size:" ~/.Xresources 2>/dev/null >/tmp/.Xresources.$$
echo "Xcursor.size: $SIZE" >>/tmp/.Xresources.$$
mv /tmp/.Xresources.$$ ~/.Xresources

xrdb -merge ~/.Xresources

export XCURSOR_SIZE="$SIZE"

notify-send "Cursor" "Cursor size changed to: $SIZE"

xsetroot -cursor_name left_ptr
