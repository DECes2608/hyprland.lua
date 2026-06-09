-- ── Renk Değişkenleri ───────────────────────────────
local primary     = "rgb(aaaaaa)"
local surface     = "rgb(111111)"
local secondary   = "rgb(a7a7a7)"
local error_color = "rgb(dddddd)"

-- ── Genel Görünüm ────────────────────────────────────
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 2,
        col      = {
            active_border   = primary,
            inactive_border = surface,
        },
    },

    decoration = {
        rounding = 0,
        shadow   = { enabled = false },
        --        blur     = { enabled = false },
    },

    group = {
        col = {
            border_active          = secondary,
            border_inactive        = surface,
            border_locked_active   = error_color,
            border_locked_inactive = surface,
        },
        groupbar = {
            col = {
                active          = secondary,
                inactive        = surface,
                locked_active   = error_color,
                locked_inactive = surface,
            },
        },
    },
})

-- Spring Curves (Kasmayan, daha dengeli yay değerleri)
hl.curve("spring_menu", { type = "spring", mass = 1, stiffness = 90, dampening = 15 })
hl.curve("spring_window", { type = "spring", mass = 1, stiffness = 50, dampening = 11 })
hl.curve("spring_open", { type = "spring", mass = 1, stiffness = 50, dampening = 11 })
hl.curve("spring_close", { type = "spring", mass = 1, stiffness = 50, dampening = 11 })
hl.curve("spring_workspace", { type = "spring", mass = 1, stiffness = 55, dampening = 12 })
hl.curve("spring_special", { type = "spring", mass = 1, stiffness = 50, dampening = 11 })

-- Animasyonlar (Yorum satırlarını kaldırdık ve aktif ettik)
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, spring = "spring_window" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, spring = "spring_open" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, spring = "spring_close" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, spring = "spring_workspace" })


for i = 1, 5 do
    hl.workspace_rule({
        workspace = i, -- veya tostring(i)
        persistent = true,
    })
end
