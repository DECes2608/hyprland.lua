-- ╔══════════════════════════════════════════════════╗
-- ║              configs/basekeys.lua                ║
-- ║                                                  ║
-- ║  Bind seçenekleri:                               ║
-- ║    { locked = true }  → bindl (kilit ekranında)  ║
-- ║    { repeat = true }  → binde (basılı tutunca)   ║
-- ╚══════════════════════════════════════════════════╝

-- ── Ses Tuşları ──────────────────────────────────────
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"),        { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),        { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),      { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl -p spotify play-pause"),                   { locked = true })
hl.bind("XF86AudioStop",        hl.dsp.exec_cmd("playerctl stop"),                                    { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl -p spotify previous"),                     { locked = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl -p spotify next"),                         { locked = true })

-- Spotify kolay kontrol
hl.bind("SUPER + W", hl.dsp.exec_cmd("playerctl -p spotify play-pause"))

-- Zaman bildirimi
hl.bind("SUPER + T", hl.dsp.exec_cmd("bash -c 'notify-send \"zaman\" \"$(timedatectl)\"'"))

-- ── Parlaklık ────────────────────────────────────────
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl --class=backlight set +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl --class=backlight set 10%-"))

-- ── Ekran Görüntüsü ──────────────────────────────────
hl.bind("Print",         hl.dsp.exec_cmd("bash -c 'grim -g \"$(slurp)\" - | wl-copy'"))
hl.bind("SUPER + A",     hl.dsp.exec_cmd("bash -c 'mkdir -p ~/Belgeler/Ekran/ && grim -g \"$(slurp)\" ~/Belgeler/Ekran/$(date +%Y-%m-%d-%H%M%S).png'"))

-- ── Odaklanma ────────────────────────────────────────
hl.bind("SUPER + Left",  hl.dsp.focus.move({ direction = "l" }))
hl.bind("SUPER + Right", hl.dsp.focus.move({ direction = "r" }))
hl.bind("SUPER + Up",    hl.dsp.focus.move({ direction = "u" }))
hl.bind("SUPER + Down",  hl.dsp.focus.move({ direction = "d" }))

-- ── Pencere Yönetimi ─────────────────────────────────
hl.bind("SUPER + Q",       hl.dsp.window.close())
hl.bind("SUPER + F",       hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind("SUPER + Space",   hl.dsp.window.float({ action = "toggle" }))

-- ── Pencere Taşıma ───────────────────────────────────
hl.bind("SUPER + CTRL + Left",  hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + CTRL + Up",    hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + Down",  hl.dsp.window.move({ direction = "d" }))

-- ── Workspace Geçişi ─────────────────────────────────
hl.bind("SUPER + Page_Down", hl.dsp.workspace.move({ workspace = "e+1" }))
hl.bind("SUPER + Page_Up",   hl.dsp.workspace.move({ workspace = "e-1" }))
hl.bind("SUPER + U",         hl.dsp.workspace.move({ workspace = "e+1" }))
hl.bind("SUPER + I",         hl.dsp.workspace.move({ workspace = "e-1" }))

-- ── Pencereyi Workspace'e Taşı ───────────────────────
hl.bind("SUPER + CTRL + Page_Down", hl.dsp.workspace.move_window({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + Page_Up",   hl.dsp.workspace.move_window({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + U",         hl.dsp.workspace.move_window({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + I",         hl.dsp.workspace.move_window({ workspace = "e-1" }))

-- ── Mouse Scroll ile Workspace ───────────────────────
hl.bind("SUPER + mouse_down", hl.dsp.workspace.move({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.workspace.move({ workspace = "e-1" }))

-- ── Workspace 1–10 Geçişi ────────────────────────────
for i = 1, 9 do
    hl.bind("SUPER + " .. i,         hl.dsp.workspace.move({ workspace = tostring(i) }))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.workspace.move_window({ workspace = tostring(i) }))
end
hl.bind("SUPER + 0",         hl.dsp.workspace.move({ workspace = "10" }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.workspace.move_window({ workspace = "10" }))

-- ── Boyut Değiştirme ─────────────────────────────────
hl.bind("SUPER + minus",       hl.dsp.window.resize({ size = "-10% 0" }), { repeat = true })
hl.bind("SUPER + equal",       hl.dsp.window.resize({ size = "10% 0"  }), { repeat = true })
hl.bind("SUPER + SHIFT + minus", hl.dsp.window.resize({ size = "0 -10%" }), { repeat = true })
hl.bind("SUPER + SHIFT + equal", hl.dsp.window.resize({ size = "0 10%"  }), { repeat = true })

-- ── Mouse ile Pencere Taşı / Boyutlandır ─────────────
hl.bind("SUPER + mouse:272", hl.dsp.window.move_grab())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize_grab())
