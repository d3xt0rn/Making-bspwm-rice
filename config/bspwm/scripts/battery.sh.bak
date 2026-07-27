#!/usr/bin/env bash

BAT_PATH=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' | head -n1)
LOW_THRESHOLD=15
INTERVAL=1

if [[ -z "$BAT_PATH" ]]; then
  notify-send -u critical "Battery" "No battery device found"
  exit 1
fi

CAPACITY_FILE="${BAT_PATH}/capacity"
STATUS_FILE="${BAT_PATH}/status"

prev_status=""
low_notified=0

while true; do
  capacity=$(cat "$CAPACITY_FILE")
  status=$(cat "$STATUS_FILE")

  if [[ "$status" != "$prev_status" ]]; then
    case "$status" in
    Charging)
      notify-send -u normal -i battery "Battery" "Charger connected (${capacity}%)"
      low_notified=0
      ;;
    Discharging)
      notify-send -u normal -i battery "Battery" "Charger disconnected (${capacity}%)"
      ;;
    Full)
      notify-send -u low -i battery "Battery" "Battery fully charged"
      ;;
    esac
    prev_status="$status"
  fi

  if [[ "$status" == "Discharging" && "$capacity" -le $LOW_THRESHOLD && $low_notified -eq 0 ]]; then
    notify-send -u critical -i battery-caution "Battery" "Low battery: ${capacity}%"
    low_notified=1
  fi

  if [[ "$capacity" -gt $LOW_THRESHOLD ]]; then
    low_notified=0
  fi

  sleep "$INTERVAL"
done
