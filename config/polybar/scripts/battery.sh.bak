#!/usr/bin/env bash

BAT_PATH=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' | head -n1)

if [[ -z "$BAT_PATH" ]]; then
  echo "Bat: N/A"
  exit 0
fi

CAPACITY_FILE="${BAT_PATH}/capacity"
STATUS_FILE="${BAT_PATH}/status"

if [[ ! -r "$CAPACITY_FILE" ]]; then
  echo "Bat: ERR"
  exit 0
fi

CAPACITY=$(cat "$CAPACITY_FILE")
STATUS=$(cat "$STATUS_FILE" 2>/dev/null)

case "$STATUS" in
Charging) PREFIX="CHG" ;;
Discharging) PREFIX="BAT" ;;
Full) PREFIX="FULL" ;;
*) PREFIX="BAT" ;;
esac

echo "${PREFIX}: ${CAPACITY}%"
