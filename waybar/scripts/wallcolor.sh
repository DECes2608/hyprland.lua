#!/usr/bin/env bash
# Kullanım: wallcolor.sh [resim]  (verilmezse hyprpaper.conf'taki ilk path)
img="${1:-$(grep -m1 -oP 'path\s*=\s*\K.*' ~/.config/hypr/hyprpaper.conf)}"
img="${img/#\~/$HOME}"
[ -f "$img" ] || {
  echo "resim bulunamadi: $img"
  exit 1
}

out="$HOME/.config/waybar/css/wall.css"

read -r accent light <<<"$(magick "$img" -resize 200x200 -colors 12 -format %c histogram:info:- | awk '
{
  n=$1+0
  if (!match($0,/#[0-9A-Fa-f]{6}/)) next
  h=substr($0,RSTART+1,6)
  r=strtonum("0x" substr(h,1,2)); g=strtonum("0x" substr(h,3,2)); b=strtonum("0x" substr(h,5,2))
  mx=r; if(g>mx)mx=g; if(b>mx)mx=b
  mn=r; if(g<mn)mn=g; if(b<mn)mn=b
  if (mx<90) next
  s=(mx-mn)/mx
  sc=s*log(n+1)
  if (sc>best){best=sc; R=r; G=g; B=b}
}
END{
  if(!best){R=G=B=200}
  printf "#%02x%02x%02x #%02x%02x%02x\n", R,G,B, int(R+(255-R)*0.4), int(G+(255-G)*0.4), int(B+(255-B)*0.4)
}')"

cat >"$out" <<EOF
@define-color bg_bar #0c0c0c;
@define-color text_main #e6e6e6;
@define-color text_dim #8a8a8a;
@define-color ws_text #6b6b6b;
@define-color ws_active_bg $accent;
@define-color ws_hover_bg $light;
@define-color warp_text_connected $accent;
@define-color warp_text_disconnected #cc241d;
EOF
pkill -SIGUSR2 waybar
