-- ╔══════════════════════════════════════════════════╗
-- ║               configs/rules.lua                  ║
-- ╚══════════════════════════════════════════════════╝
-- Sözdizimi: hl.windowrule({ efektler }, { eşleşme koşulları })

-- Kayan pencereler
hl.windowrule({ float = true, workspace = "silent", size = {400, 600}, center = true }, { class = "com.github.hluk.copyq"  })
hl.windowrule({ float = true,                       size = {800, 900}, center = true }, { class = "localsend"              })
hl.windowrule({ float = true,                       size = {600, 600}, center = true }, { class = "blueman-manager"        })

-- Workspace atamaları
hl.windowrule({ workspace = "2",        opacity = 0.8 }, { class = "dev.zed.Zed"          })
hl.windowrule({ workspace = "3 silent", opacity = 0.9 }, { class = "Spotify"              })
hl.windowrule({ workspace = "1"                       }, { class = "helium"               })
hl.windowrule({ workspace = "2"                       }, { class = "obsidian"             })
hl.windowrule({ workspace = "2"                       }, { class = "zen"                  })
hl.windowrule({ workspace = "4 silent"                }, { class = "steam"               })
hl.windowrule({ workspace = "1 silent"                }, { class = "librewolf"           })
hl.windowrule({ workspace = "1"                       }, { class = "brave-origin-nightly" })

-- Opaklık
hl.windowrule({ opacity = 0.8 }, { class = "thunar" })

-- Çoklu monitör için yorum satırı örnekler:
-- hl.workspace({ id = 1, monitor = "HDMI-A-1", default = true })
-- hl.workspace({ id = 2, monitor = "eDP-1",    default = true })
-- hl.workspace({ id = 3, monitor = "eDP-1" })
-- hl.workspace({ id = 4, monitor = "eDP-1" })
