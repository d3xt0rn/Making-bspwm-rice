#!/bin/sh

choice=$(
  printf "%s\n" \
    "bspwm" \
    "sxhkd" \
    "kitty" \
    "dmenu-scripts" \
    "picom" \
    "flameshot" \
    "xresources" |
    dmenu \
      -nb '#32363e' \
      -nf '#abb2bf' \
      -sb '#e06c75' \
      -sf '#233c34' \
      -i \
      -p "Config:"
)

case "$choice" in
bspwm)
  kitty sh -c "cd ~/.config/bspwm && nvim"
  ;;
sxhkd)
  kitty sh -c "cd ~/.config/sxhkd && nvim"
  ;;
kitty)
  kitty sh -c "cd ~/.config/kitty && nvim"
  ;;
dmenu-scripts)
  kitty sh -c "cd ~/.config/dmenu && nvim"
  ;;
picom)
  kitty sh -c "cd ~/.config/picom && nvim"
  ;;
flameshot)
  kitty sh -c "cd ~/.config/flameshot && nvim"
  ;;
xresources)
  kitty sh -c "nvim ~/.Xresources"
  ;;
esac
