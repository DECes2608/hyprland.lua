# Hyprland Dotfiles

A minimalist Hyprland desktop environment workflow configured for Arch Linux.

---

<img width="1922" height="1080" alt="Hyprland Preview" src="https://github.com/user-attachments/assets/36d47ab6-a26a-40af-a62e-81d472c20e07" />

---

## 🎨 System Components

- **GTK Theme:** Monochrome (includes various options)
- **App Launcher:** `rofi-wayland`
- **Bar:** `waybar`
- **Notification Daemon:** `mako`
- **Wallpaper Manager:** `hyprpaper`
- **File Manager:** `yazi` / `nautilus`
- **Music Player:** `rhythmbox`
- **Text Editor:** Neovim (LazyVim)

---

## 📦 Installation

### Quick Start

```bash
git clone [https://github.com/DECes2608/hyprland.lua](https://github.com/DECes2608/hyprland.lua)
cd hyprland.lua && bash install.sh```

### 🔨 Manual Installation

#### Core System Dependencies

```sudo pacman -S --needed hyprland waybar hyprpaper dunst alacritty \
  rofi-wayland blueman pavucontrol network-manager-applet \
  pipewire pipewire-pulse wireplumber \
  gtk3 gtk4 qt5-wayland qt6-wayland \
  xdg-desktop-portal-hyprland xdg-user-dirs \
  polkit-kde-agent grim slurp wl-clipboard \
  brightnessctl playerctl upower```

#### File Management & CLI Utilities

```sudo pacman -S --needed yazi zathura zathura-pdf-mupdf \
  poppler ffmpegthumbnailer unar jq fd ripgrep \
  fzf zoxide imagemagick grim slurp```

#### Development Tools

```sudo pacman -S --needed neovim git lazygit base-devel \
  nodejs npm python python-pip```

#### Media & Audio

```sudo pacman -S --needed mpd ncmpcpp mpc pamixer rhythmbox```

#### AUR Packages (Requires yay)

```yay -S --needed localsend-bin mako```

#### Installing yay (if not present)

```sudo pacman -S --needed git base-devel
git clone [https://aur.archlinux.org/yay.git](https://aur.archlinux.org/yay.git)
cd yay && makepkg -si```

### 🗣️ Explanation

Configte may well have plenty of flaws and shortcomings, but as long as you’re not trying to do anything too elaborate, it’s unlikely to pose a problem. Generally speaking, it isn’t particularly user-friendly, and you still need to consult the documentation for even simple adjustments, but for general use, it served me just fine.
