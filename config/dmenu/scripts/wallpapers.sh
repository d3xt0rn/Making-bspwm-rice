#!/bin/sh

wall=$(
  find "$HOME/.wallpapers" -type f |
    sed "s|$HOME/.wallpapers/||" |
    dmenu -i -l 20 -p "Wallpaper:"
)

feh --bg-fill "$HOME/.wallpapers/$wall"
