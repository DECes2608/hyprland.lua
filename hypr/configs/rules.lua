-- Browser
hl.window_rule({
	name = "librewolf",
	match = {
		class = "librewolf",
	},
	workspace = 2,
})

hl.window_rule({
	name = "nautilus",
	match = {
		class = "org.gnome.Nautilus",
	},
	opacity = 0.85,
})

hl.window_rule({
	name = "music",
	match = {
		class = "org.gnome.Rhythmbox3",
	},
	opacity = 0.85,
	workspace = "special:0",
})

hl.window_rule({
	name = "discord",
	match = {
		class = "vesktop",
	},
	opacity = 0.85,
	workspace = "special:0",
})

hl.window_rule({
	name = "ws-rbx",
	match = {
		class = "sober",
	},
	workspace = 2,
})

-- Float

hl.window_rule({
	name = "pavucontrol",
	match = {
		class = "org.pulseaudio.pavucontrol",
	},
	float = true,
	size = { "monitor_w * 0.4", "monitor_h * 0.6" },
	center = true,
})

hl.window_rule({
	name = "desktop portal",
	match = {
		class = "xdg-desktop-portal-gtk",
	},
	float = true,
	size = { "monitor_w * 0.4", "monitor_h * 0.6" },
	center = true,
})

hl.window_rule({
	name = "float copyq",
	match = {
		class = "com.github.hluk.copyq",
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
	name = "steam",
	match = {
		class = "steam",
	},
	workspace = 4,
})

-- nvim → workspace 5
hl.window_rule({
	name = "nvim",
	match = {
		class = "alacritty",
		title = "nvim",
	},
	workspace = "5",
})
