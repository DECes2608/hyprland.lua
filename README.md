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
cd hyprland.lua && bash install.sh
Core System DependenciesBashsudo pacman -S --needed hyprland waybar hyprpaper dunst alacritty \
  rofi-wayland blueman pavucontrol network-manager-applet \
  pipewire pipewire-pulse wireplumber \
  gtk3 gtk4 qt5-wayland qt6-wayland \
  xdg-desktop-portal-hyprland xdg-user-dirs \
  polkit-kde-agent grim slurp wl-clipboard \
  brightnessctl playerctl upower
File Management & CLI UtilitiesBashsudo pacman -S --needed yazi zathura zathura-pdf-mupdf \
  poppler ffmpegthumbnailer unar jq fd ripgrep \
  fzf zoxide imagemagick grim slurp
Development ToolsBashsudo pacman -S --needed neovim git lazygit base-devel \
  nodejs npm python python-pip
Media & AudioBashsudo pacman -S --needed mpd ncmpcpp mpc pamixer rhythmbox
AUR Packages (Requires yay)Bashyay -S --needed localsend-bin mako
Installing yay (if not present)Bashsudo pacman -S --needed git base-devel
git clone [https://aur.archlinux.org/yay.git](https://aur.archlinux.org/yay.git)
cd yay && makepkg -si
🗂️ Configuration StructurePlaintext~/.config/
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
⌨️ KeybindingsKeybindingActionSUPER + EnterTerminal (Kitty)SUPER + EFile Manager (Yazi)SUPER + MMusic PlayerSUPER + CText Editor (Neovim)SUPER + VClipboard Manager (CopyQ)SUPER + SToggle Special WorkspaceSUPER + XPower MenuSUPER + SHIFT + WRefresh WallpaperSUPER + SHIFT + BReload Waybar📝 NotesBuilt on the Hyprland Lua API (0.56.2+).poppler is required for PDF previews in file managers.A unified color scheme is applied across Neovim, Mako, and Waybar.Alternatively, you can use the built-in Rofi script for clipboard management.Project Goal: To create a minimal, seamless, and fully tailored window manager setup that can be easily replicated.Notice: The installation script (install.sh) is currently being updated and may not reflect the latest configuration changes.
