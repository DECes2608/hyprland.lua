-- ── Monitörler ──────────────────────────────────────
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1080@60.01", position = "0x0", scale = 1 })


-- ── Giriş Ayarları ──────────────────────────────────
hl.config({
    input = {
        kb_layout          = "tr",
        repeat_rate        = 35,
        repeat_delay       = 300,
        numlock_by_default = true,
        follow_mouse       = 1,
        mouse_refocus      = true,
        sensitivity        = -0.5,

        touchpad           = {
            tap_to_click         = true,
            natural_scroll       = true,
            disable_while_typing = false,
        },
    },
    cursor = {
        no_warps             = true,
        no_hardware_cursors  = true,
        use_cpu_buffer       = true,
        sync_gsettings_theme = true,
    },
    misc = {
        vrr                      = 1,
        disable_hyprland_logo    = true,
        force_default_wallpaper  = 0,
        disable_splash_rendering = true,
    },
    xwayland = {
        force_zero_scaling = true,
        use_nearest_neighbor = true,
    },
})

-- ── Per-Device Ayarı ────────────────────────────────
hl.device({
    name          = "synaptics-tm3336-001",
    sensitivity   = -0.3,
    accel_profile = "adaptive",
})
