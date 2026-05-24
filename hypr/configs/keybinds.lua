-- ╔══════════════════════════════════════════════════╗
-- ║              configs/keybinds.lua                ║
-- ╚══════════════════════════════════════════════════╝

-- ── Uygulama Kısayolları ─────────────────────────────
hl.bind("SUPER + Return",    hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + D",         hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + B",         hl.dsp.exec_cmd("librewolf"))
-- hl.bind("SUPER + B",      hl.dsp.exec_cmd("zen-browser"))
-- hl.bind("SUPER + B",      hl.dsp.exec_cmd("brave"))
-- hl.bind("SUPER + B",      hl.dsp.exec_cmd("firefox"))
-- hl.bind("SUPER + B",      hl.dsp.exec_cmd("helium-browser"))
-- hl.bind("SUPER + B",      hl.dsp.exec_cmd("brave-origin-nightly"))
hl.bind("SUPER + M",         hl.dsp.exec_cmd("spotify-launcher"))
hl.bind("SUPER + N",         hl.dsp.exec_cmd("obsidian"))
hl.bind("SUPER + E",         hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("steam"))
hl.bind("SUPER + V",         hl.dsp.exec_cmd("copyq show"))
hl.bind("SUPER + C",         hl.dsp.exec_cmd("zeditor"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("code"))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("blueman-manager"))
-- hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("waypaper"))
hl.bind("SUPER + Z",         hl.dsp.exec_cmd("localsend"))

-- ── Layout ───────────────────────────────────────────
hl.bind("SUPER + S", hl.dsp.layout.msg("focusmaster"))

-- ── Waybar / Hyprpaper Yeniden Başlatma ──────────────
-- Bash scriptleri aynen kullanılabilir, ya da Lua fonksiyon olarak yazılabilir.
-- Seçenek A: Eski bash scriptleri çağır (daha az iş)
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/configs/reload_wallpaper.sh"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("~/.config/hypr/configs/reload_bar.sh"))

-- Seçenek B: Tamamen Lua (bash script gerekmez — yukarıdakileri yorum satırına al)
-- hl.bind("SUPER + SHIFT + W", function()
--     os.execute("pkill hyprpaper; sleep 0.5; hyprpaper &")
-- end)
-- hl.bind("SUPER + SHIFT + B", function()
--     os.execute("pkill waybar; sleep 0.5; waybar &")
-- end)

-- ── Oturum Menüsü ────────────────────────────────────
hl.bind("SUPER + X", hl.dsp.exec_cmd("~/.config/rofi/powermenu.sh"))

-- ── Debug: Aktif Pencere Sınıfını Göster ─────────────
-- Lua'da doğrudan hl API kullanarak yapılabilir (notify-send gerekmez)
hl.bind("SUPER + SHIFT + Z", function()
    local w = hl.get_active_window()
    if w ~= nil then
        hl.notification.create({
            text    = "class: " .. (w.class or "?") .. "\ntitle: " .. (w.title or "?"),
            timeout = 5000,
            icon    = "dialog-information",
        })
    end
end)
