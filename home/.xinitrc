eval $(dbus-launch --sh-syntax --exit-with-session)
pipewire &
wireplumber &
pipewire-pulse &
exec bspwm
