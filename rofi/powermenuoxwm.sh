#!/bin/bash

# Seçenekleri belirle (Menüde görünecek sıra)
option=$(printf "Exit Hyprland\nReboot\nShutdown" | rofi -dmenu -p "Session" -theme ~/.config/rofi/themes/modern-black.rasi)

# Seçime göre işlemi çalıştır
case "$option" in
    "Exit Hyprland")
        oxwm.quit  # Oxwm'i kapat
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac
