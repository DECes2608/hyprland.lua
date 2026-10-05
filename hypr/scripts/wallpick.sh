#!/usr/bin/env bash
dir="$HOME/wallpaper"
conf="$HOME/.config/hypr/hyprpaper.conf"

sel=$(find "$dir" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) -printf '%f\n' | sort |
  while read -r f; do printf '%s\0icon\x1f%s/%s\n' "$f" "$dir" "$f"; done |
  rofi -dmenu -i -show-icons -p "wallpaper")
[ -z "$sel" ] && exit 0
img="$dir/$sel"

mons=$(hyprctl monitors | awk '/^Monitor/{print $2}')
mon=$(printf 'hepsi\n%s\n' "$mons" | rofi -dmenu -i -p "monitor")
[ -z "$mon" ] && exit 0
[ "$mon" = "hepsi" ] && targets="$mons" || targets="$mon"

for m in $targets; do
  awk -v m="$m" -v p="$img" '
    /monitor *=/ { cur=$0; sub(/.*= */,"",cur); gsub(/ /,"",cur) }
    /path *=/ && cur==m { sub(/=.*/,"= " p) }
    { print }' "$conf" >"$conf.tmp" && mv "$conf.tmp" "$conf"
done

pkill hyprpaper
setsid hyprpaper >/dev/null 2>&1 &

~/.config/waybar/scripts/wallcolor.sh "$img"
pkill -SIGUSR2 waybar
