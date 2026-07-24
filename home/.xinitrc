eval $(dbus-launch --sh-syntax --exit-with-session)
pipewire &
wireplumber &
pipewire-pulse &

xsetroot -cursor_name left_ptr
export QT_QPA_PLATFORMTHEME=qt6ct

exec bspwm
