-- Browser
hl.window_rule({
	name = "librewolf",
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
	name = "ws-rbx",
	match = {
		class = "sober",
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

hl.window_rule({
	name = "ws-dc",
	match = {
		class = "discord",
	},
	workspace = 6,
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
	name = "float copyq",
	match = {
		class = "com.github.hluk.copyq",
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
		class = "dev.zed.Zed",
	},
	workspace = 5,
})

hl.window_rule({
	name = "Spotify",
	match = {
		class = "Spotify",
	},
	workspace = 3,
})

hl.window_rule({
	name = "term",
	match = {
		class = "kitty",
	},
	workspace = 1,
})

hl.window_rule({
	name = "steam",
	match = {
		class = "steam",
	},
	workspace = 4,
})

hl.window_rule({
	name = "thunar",
	match = {
		class = "thunar",
	},
	workspace = 3,
	opacity = 0.85,
})

-- ncspot → special workspace "sp"
hl.window_rule({
	name = "ncspot",
	match = {
		class = "kitty",
		title = "ncspot",
	},
	float = true,
	size = { "monitor_w * 0.3", "monitor_h * 0.5" },
	move = { " monitor_w * 0.696", "monitor_h * 0.455" },
	workspace = "special:0",
})

hl.window_rule({
	name = "do it",
	match = {
		class = "kitty",
		title = "test",
	},
	float = true,
	size = { "monitor_w * 0.3", "monitor_h * 0.25" },
	move = { " monitor_w * 0.005", "monitor_h * 0.70" },
	workspace = "special:0",
})

-- yazi → workspace 3
hl.window_rule({
	name = "yazi",
	match = {
		class = "kitty",
		title = "yazi",
	},
	workspace = "3",
})

-- nvim → workspace 5
hl.window_rule({
	name = "nvim",
	match = {
		class = "kitty",
		title = "nvim",
	},
	workspace = "5",
})
