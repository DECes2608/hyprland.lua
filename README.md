# 🏔️ Hyprland Dotfiles

Arch Linux üzerine kurulu Hyprland masaüstü ortamı.

---

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/be4e3eb1-452c-4fba-9b17-b4b611ffe65c" />



---
---

## GTK Theme ---> meadow (bir çok seçenek var)
## app launcher ---> rofi-wayland
## bar ---> waybar
## notification ---> mako
## wallpaper ---> hyprpaper
## dosya ---> yazi
## müzik ---> ncspot
## kod ---> nvim (lazyvim)

## 📦 Kurulum

### Basit kurulum

```bash
git clone https://github.com/DECes2608/hyprland.lua
cd hyprland.lua && bash install.sh
```

### Temel sistem

```bash
sudo pacman -S --needed hyprland waybar hyprpaper dunst kitty \
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
sudo pacman -S --needed mpd ncmpcpp mpc pamixer
```

### AUR (yay gerekli)

```bash
yay -S --needed ncspot localsend \
sioyek mako \
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
├── nvim/          # LazyVim
│   ├── colors/
│   │   └── dagzirvesi.lua
│   └── lua/plugins/
└── zathura/
```

---

## ⌨️ Temel Kısayollar

| Tuş | Eylem |
|-----|-------|
| `SUPER + Enter` | Terminal (Kitty) |
| `SUPER + E` | Dosya yöneticisi (Yazi) |
| `SUPER + M` | Müzik (ncspot) |
| `SUPER + C` | Editör (Neovim) |
| `SUPER + V` | Pano (copyq) |
| `SUPER + S` | Special workspace toggle |
| `SUPER + X` | Güç menüsü |
| `SUPER + SHIFT + W` | Duvar kağıdı yenile |
| `SUPER + SHIFT + B` | Waybar yenile |

---

## 🎨 Tema

**dagzirvesi** — Bir dağın renklerinden türetilmiş özel renk paleti.

| Renk | Hex | Kullanım |
|------|-----|----------|
| Arka plan | `#1a2a2e` | Koyu teal (gökyüzü) |
| Vurgu | `#c4622a` | Turuncu (kayalıklar) |
| Metin | `#dce8e8` | Kar beyazı |
| Teal | `#48a8a8` | Fonksiyon / tip |

Aynı palet Neovim, Mako ve Waybar'da kullanılıyor.

---

## 📝 Notlar

- Hyprland config Lua API üzerine kurulu (`0.55.3+`)
- PDF önizlemesi için `poppler` gerekli
EOF
