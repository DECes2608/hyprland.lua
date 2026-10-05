# Hyprland Dotfiles

Arch Linux üzerine kurulu Hyprland masaüstü ortamı.

---


<img width="1922" height="1080" alt="image" src="https://github.com/user-attachments/assets/36d47ab6-a26a-40af-a62e-81d472c20e07" />



---
---

## GTK Theme ---> Monochrome (bir çok seçenek var)
## app launcher ---> rofi-wayland
## bar ---> waybar
## notification ---> mako
## wallpaper ---> hyprpaper
## dosya ---> mautilus/yazi
## müzik ---> rhythmbox
## kod ---> nvim (lazyvim)

## 📦 Kurulum

### Basit kurulum

```bash
git clone https://github.com/DECes2608/hyprland.lua
cd hyprland.lua && bash install.sh
```

### Temel sistem

```bash
sudo pacman -S --needed hyprland waybar hyprpaper dunst alacritty \
  rofi-wayland blueman pavucontrol network-manager-applet \
  pipewire pipewire-pulse wireplumber \
  gtk3 gtk4 qt5-wayland qt6-wayland \
  xdg-desktop-portal-hyprland xdg-user-dirs \
  polkit-kde-agent grim slurp wl-clipboard \
  brightnessctl playerctl upower
```

### Dosya yönetimi & terminal araçları

```bash
sudo pacman -S --needed yazi zathura zathura-pdf-mupdf \
  poppler ffmpegthumbnailer unar jq fd ripgrep \
  fzf zoxide imagemagick grim slurp
```

### Geliştirme

```bash
sudo pacman -S --needed neovim git lazygit base-devel \
  nodejs npm python python-pip
```

### Medya & ses

```bash
sudo pacman -S --needed mpd ncmpcpp mpc pamixer rhythmbox
```

### AUR (yay gerekli)

```bash
yay -S --needed localsend-bin \
mako \
```

### Yay kurulumu (yoksa)

```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

---

## 🗂️ Yapı

```
~/.config/
├── hypr/
│   └── configs/
│       ├── keybinds.lua
│       ├── rules.lua
│       ├── look.lua
│       ├── startup.lua
│       └── ...
├── waybar/
├── kitty/
├── mako/
├── yazi/
└── zathura/
```

---

## ⌨️ Temel Kısayollar

| Tuş | Eylem |
|-----|-------|
| `SUPER + Enter` | Terminal (Kitty) |
| `SUPER + E` | Dosya yöneticisi (Yazi) |
| `SUPER + M` | Müzik |
| `SUPER + C` | Editör (Neovim) |
| `SUPER + V` | Pano (copyq) |
| `SUPER + S` | Special workspace toggle |
| `SUPER + X` | Güç menüsü |
| `SUPER + SHIFT + W` | Duvar kağıdı yenile |
| `SUPER + SHIFT + B` | Waybar yenile |

---

Aynı palet Neovim, Mako ve Waybar'da kullanılıyor.

---

## 📝 Notlar

- Hyprland config Lua API üzerine kurulu (`0.56.2+`)
- PDF önizlemesi için `poppler` gerekli
- eger istenirse pano yoneticisi olarak rofideki scriptide kullanabilirsiniz
- buradaki amacim tamamen bana gore en uygun window manager deneyimini mumkun mertebede eksiksiz ve sadece kopy paste ile kendinizin ve benim tekrar yasayabilmemiz
- install scripti su an icin guncel degildir
EOF
