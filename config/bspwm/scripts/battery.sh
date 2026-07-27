#!/usr/bin/env bash

BAT_PATH=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' | sort | head -n1)
LOW_THRESHOLD=15
INTERVAL=20

if [[ -z "$BAT_PATH" ]]; then
  notify-send -u critical "Батарея" "Устройство батареи не найдено"
  exit 1
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

get_capacity() {
  local raw cap now full
  raw=$(cat "${BAT_PATH}/capacity" 2>/dev/null)
  cap=$(clamp "$raw")

  if [[ -z "$cap" ]]; then
    if [[ -f "${BAT_PATH}/energy_now" && -f "${BAT_PATH}/energy_full" ]]; then
      now=$(cat "${BAT_PATH}/energy_now")
      full=$(cat "${BAT_PATH}/energy_full")
    elif [[ -f "${BAT_PATH}/charge_now" && -f "${BAT_PATH}/charge_full" ]]; then
      now=$(cat "${BAT_PATH}/charge_now")
      full=$(cat "${BAT_PATH}/charge_full")
    fi
    if [[ -n "$now" && -n "$full" && "$full" -gt 0 ]]; then
      cap=$(clamp $((now * 100 / full)))
    fi
  fi
  echo "$cap"
}

prev_status=""
low_notified=0

while true; do
  capacity=$(get_capacity)
  status=$(cat "${BAT_PATH}/status" 2>/dev/null)

  if [[ -z "$capacity" ]]; then
    sleep "$INTERVAL"
    continue
  fi

  if [[ "$status" != "$prev_status" ]]; then
    case "$status" in
    Charging)
      notify-send -u normal -i battery "Батарея" "Зарядка подключена (${capacity}%)"
      low_notified=0
      ;;
    Discharging)
      notify-send -u normal -i battery "Батарея" "Зарядка отключена (${capacity}%)"
      ;;
    Full)
      notify-send -u low -i battery "Батарея" "Батарея полностью заряжена"
      ;;
    esac
    prev_status="$status"
  fi

  if [[ "$status" == "Discharging" && "$capacity" -le $LOW_THRESHOLD && $low_notified -eq 0 ]]; then
    notify-send -u critical -i battery-caution "Батарея" "Низкий заряд: ${capacity}%"
    low_notified=1
  fi

  if [[ "$capacity" -gt $LOW_THRESHOLD ]]; then
    low_notified=0
  fi

  sleep "$INTERVAL"
done
