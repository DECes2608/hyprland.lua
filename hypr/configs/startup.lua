-- ╔══════════════════════════════════════════════════╗
-- ║              configs/startup.lua                 ║
-- ║                                                  ║
-- ║  hl.on("hyprland.start") = exec-once             ║
-- ║  Üst seviyedeki hl.exec_cmd()  = exec            ║
-- ║  (Lua config her reload'da yeniden çalışır,      ║
-- ║   bu yüzden üst seviye kod her seferinde çalışır)║
-- ╚══════════════════════════════════════════════════╝

-- Sadece Hyprland ilk başlatıldığında çalışır (exec-once)
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl setcursor Plasma-Overdose-BW 14")
    hl.exec_cmd("copyq --start-only")
    hl.exec_cmd("xwayland-satellite")
    -- hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    -- hl.exec_cmd("gnome-keyring-daemon")
    -- hl.exec_cmd("hyprsunset")
    hl.exec_cmd("localsend")
    hl.exec_cmd("sleep 2 && warp-cli connect")
end)

-- Her config reload'ında çalışır (exec)
hl.exec_cmd("hyprshade on saturation")
