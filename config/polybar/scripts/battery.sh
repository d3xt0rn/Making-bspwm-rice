#!/usr/bin/env bash

BAT_PATH=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' | sort | head -n1)

if [[ -z "$BAT_PATH" ]]; then
  echo "Bat: N/A"
  exit 0
fi

clamp() {
  local v=$1
  [[ "$v" =~ ^-?[0-9]+$ ]] || {
    echo ""
    return
  }
  ((v > 100)) && v=100
  ((v < 0)) && v=0
  echo "$v"
}

STATUS=$(cat "${BAT_PATH}/status" 2>/dev/null)
CAPACITY_RAW=$(cat "${BAT_PATH}/capacity" 2>/dev/null)
CAPACITY=$(clamp "$CAPACITY_RAW")

if [[ -z "$CAPACITY" ]]; then
  if [[ -f "${BAT_PATH}/energy_now" && -f "${BAT_PATH}/energy_full" ]]; then
    now=$(cat "${BAT_PATH}/energy_now")
    full=$(cat "${BAT_PATH}/energy_full")
  elif [[ -f "${BAT_PATH}/charge_now" && -f "${BAT_PATH}/charge_full" ]]; then
    now=$(cat "${BAT_PATH}/charge_now")
    full=$(cat "${BAT_PATH}/charge_full")
  fi
  if [[ -n "$now" && -n "$full" && "$full" -gt 0 ]]; then
    CAPACITY=$((now * 100 / full))
    CAPACITY=$(clamp "$CAPACITY")
  else
    CAPACITY="?"
  fi
fi

case "$STATUS" in
Charging) ICON="" ;;
Discharging) ICON="" ;;
Full) ICON="" ;;
*) ICON="" ;;
esac

echo "${ICON} Bat: ${CAPACITY}%"
