-- ── Uygulama Kısayolları ─────────────────────────────
hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("helium-browser"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("kitty --title ncspot -e ncspot"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("kitty --title yazi -e yazi"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("kitty --title nvim -e nvim"))
-- hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("steam"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("copyq show"))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("blueman-manager"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("localsend"))
hl.bind("SUPER + G", hl.dsp.exec_cmd("~/.config/rofi/power-mode.sh"))


-- Mevcut aktif pencereyi special workspace'e gönder
hl.bind("SUPER + A", hl.dsp.window.move({ workspace = "special:0" }))

-- Special workspace'i toggle et (göster/gizle)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("0"))

-- SUPER + F5 → kaydet
hl.bind("SUPER + F5", hl.dsp.exec_cmd("hyprdrover save main"))

-- SUPER + F6 → yükle
hl.bind("SUPER + F6", hl.dsp.exec_cmd("hyprdrover load main"))

-- ── Layout (Düzeltildi) ──────────────────────────────
-- hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg focusmaster"))

-- ── Waybar / Hyprpaper Yeniden Başlatma ──────────────
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload_wallpaper.sh"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload_bar.sh"))

-- ── Oturum Menüsü ────────────────────────────────────
hl.bind("SUPER + X", hl.dsp.exec_cmd("~/.config/rofi/powermenu.sh"))

hl.bind("SUPER + SHIFT + Z", function()
    hl.exec_cmd("~/.config/hypr/scripts/show-window.sh")
end)
