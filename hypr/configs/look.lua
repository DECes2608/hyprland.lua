-- ╔══════════════════════════════════════════════════╗
-- ║               configs/look.lua                   ║
-- ╚══════════════════════════════════════════════════╝

-- ── Renk Değişkenleri ───────────────────────────────
local primary        = "rgb(aaaaaa)"
local surface        = "rgb(111111)"
local secondary      = "rgb(a7a7a7)"
local error_color    = "rgb(dddddd)"

-- ── Genel Görünüm ────────────────────────────────────
hl.config({
    -- font_family kaldırıldı (Hyprland mimarisinde geçersizdir)
    general = {
        gaps_in  = 2,
        gaps_out = 2,
        col = {
            active_border   = primary,
            inactive_border = surface,
        },
    },

    decoration = {
        rounding = 0,
        shadow   = { enabled = false },
    },

    misc = {
        disable_hyprland_logo    = true,
        force_default_wallpaper  = 0,
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

-- ── Bezier Eğrileri ─────────────────────────────────
hl.curve("wind",   { type = "bezier", points = { {0.05, 0.9}, {0.1,  1.05} } })
hl.curve("winIn",  { type = "bezier", points = { {0.1,  1.1}, {0.1,  1.1 } } })
hl.curve("winOut", { type = "bezier", points = { {0.3, -0.3}, {0,    1   } } })
hl.curve("liner",  { type = "bezier", points = { {1,   1   }, {1,    1   } } })

-- ── Animasyonlar ────────────────────────────────────
hl.animation({ leaf = "windows",     enabled = true, speed = 6,  bezier = "wind",    style = "slide"     })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 6,  bezier = "winIn",   style = "slide 80%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5,  bezier = "winOut",  style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 1,  bezier = "liner"                        })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner",   style = "loop"      })
hl.animation({ leaf = "fade",        enabled = true, speed = 10, bezier = "default"                      })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5,  bezier = "wind",    style = "slide"     })

for i = 1, 7 do
    hl.workspace_rule({
        workspace = i, -- veya tostring(i)
        persistent = true,
    })
end
