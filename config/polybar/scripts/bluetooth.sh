#!/bin/sh

if ! bluetoothctl show | grep -q "Powered: yes"; then
  echo "B: off"
  exit 0
fi

connected=$(bluetoothctl devices Connected)

if [ -z "$connected" ]; then
  echo "B: on"
else
  name=$(echo "$connected" | head -n1 | cut -d' ' -f3-)
  echo " $name"
fi
