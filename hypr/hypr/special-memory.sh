#!/bin/bash
MEMORY_FILE="$HOME/.cache/hypr-special-memory.json"
ACTION=$1

if [ "$ACTION" = "save" ]; then
    hyprctl clients -j | \
        jq '[.[] | select(.workspace.name | startswith("special:")) | {class: .class, title: .title, workspace: .workspace.name}]' \
        > "$MEMORY_FILE"
    COUNT=$(jq length "$MEMORY_FILE")
    notify-send "Hyprland" "Kaydedildi ($COUNT pencere)" -i dialog-information

elif [ "$ACTION" = "restore" ]; then
    if [ ! -f "$MEMORY_FILE" ]; then
        notify-send "Hyprland" "Hafıza dosyası yok!" -i dialog-error
        exit 1
    fi

    jq -c '.[]' "$MEMORY_FILE" | while read -r entry; do
        CLASS=$(echo "$entry" | jq -r '.class')
        WS=$(echo "$entry" | jq -r '.workspace')

        # Pencereyi bul — special'da olmayan, bu class'tan ilk pencere
        ADDR=$(hyprctl clients -j | jq -r --arg c "$CLASS" \
            '[.[] | select(.class == $c) | select(.workspace.name | startswith("special:") | not)] | first | .address // empty')

        if [ -n "$ADDR" ]; then
            # 0.55 Lua dispatch syntax
            hyprctl dispatch "hl.dsp.window.move({ window = \"address:$ADDR\", workspace = \"$WS\" })"
            notify-send "Hyprland" "$CLASS → $WS" -i dialog-information
        else
            notify-send "Hyprland" "$CLASS açık değil, atlandı" -i dialog-warning
        fi
    done
fi
