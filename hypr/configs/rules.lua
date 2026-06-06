-- Browser
hl.window_rule({
    name = "ws-helium",
    match = {
        class = "librewolf",
    },
    workspace = 2,
})

hl.window_rule({
    name = "ws-helium",
    match = {
        class = "helium",
    },
    workspace = 2,
})

hl.window_rule({
    name = "ws-zen",
    match = {
        class = "zen",
    },
    workspace = 2,
})

-- Float

hl.window_rule({
    name = "pavucontrol",
    match = {
        class = "org.pulseaudio.pavucontrol"
    },
    float = true,
    size = { "monitor_w * 0.4", "monitor_h * 0.6" },
    center = true,
})

hl.window_rule({
    name = "float copyq",
    match = {
        class = "com.github.hluk.copyq"
    },
    float = true,
    size = { "monitor_w * 0.2", "monitor_h * 0.6" },
    center = true,
})

hl.window_rule({
    name = "float blueman-manager",
    match = {
        class = "blueman-manager",
    },
    float = true,
    size = { "monitor_w * 0.2", "monitor_h * 0.6" },
    center = true,
})

hl.window_rule({
    name = "float localsend",
    match = {
        class = "localsend",
    },
    float = true,
    size = { "monitor_w * 0.2", "monitor_h * 0.6" },
    center = true,
})

-- Others

hl.window_rule({
    name = "ws-Zed",
    match = {
        class = "dev.zed.Zed"
    },
    workspace = 5,
})

hl.window_rule({
    name = "term",
    match = {
        class = "kitty",
    },
    workspace = 1,
})

hl.window_rule({
    name = "Spotify",
    match = {
        class = "Spotify"
    },
    workspace = 3,
})

hl.window_rule({
    name = "obsidian",
    match = {
        class = "obsidian"
    },
    workspace = 3,
})

hl.window_rule({
    name = "steam",
    match = {
        class = "steam"
    },
    workspace = "4",
})

hl.window_rule({
    name = "thunar",
    match = {
        class = "Thunar"
    },
    workspace = 3,
})
