#!/bin/sh
# usage: sysinfo.sh battery|network|disk
case "$1" in
battery)
  out=$(pmset -g batt)
  pct=$(echo "$out" | grep -o '[0-9]*%' | head -1)
  [ -z "$pct" ] && exit 0
  case "$out" in
    *"AC Power"*|*charging*) icon="+" ;;
    *) icon="" ;;
  esac
  echo "BAT ${icon}${pct}"
  ;;
network)
  iface=$(route -n get default 2>/dev/null | awk '/interface:/{print $2}')
  if [ -z "$iface" ]; then echo "NET off"; exit 0; fi
  case "$iface" in
    utun*) vpn=" vpn"; iface=en0 ;;
    *) vpn="" ;;
  esac
  echo "NET $(ipconfig getifaddr "$iface" 2>/dev/null || echo "$iface")$vpn"
  ;;
disk)
  echo "DISK $(df -h /System/Volumes/Data | awk 'NR==2{print $4}') free"
  ;;
esac
