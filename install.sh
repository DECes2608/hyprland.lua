#!/bin/bash
# ╔══════════════════════════════════════════════════════╗
# ║           hyprland.lua — Kurulum Scripti             ║
# ║                                                      ║
# ║  Kullanım: bash install.sh                           ║
# ╚══════════════════════════════════════════════════════╝

set -e  # Hata olursa dur

# ── Renkler ───────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # Renk sıfırla

# ── Yardımcı fonksiyonlar ─────────────────────────────────
info()    { echo -e "${CYAN}[→]${NC} $1"; }
success() { echo -e "${GREEN}[✓]${NC} $1"; }
warning() { echo -e "${YELLOW}[!]${NC} $1"; }
error()   { echo -e "${RED}[✗]${NC} $1"; exit 1; }
header()  { echo -e "\n${BOLD}${BLUE}══ $1 ══${NC}\n"; }

# ── Onay fonksiyonu ───────────────────────────────────────
confirm() {
    read -rp "$(echo -e "${YELLOW}[?]${NC} $1 [E/h]: ")" response
    [[ "$response" =~ ^[Hh]$ ]] && return 1
    return 0
}

# ─────────────────────────────────────────────────────────
echo -e "${BOLD}"
echo "  ██╗  ██╗██╗   ██╗██████╗ ██████╗ "
echo "  ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗"
echo "  ███████║ ╚████╔╝ ██████╔╝██████╔╝"
echo "  ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗"
echo "  ██║  ██║   ██║   ██║     ██║  ██║"
echo "  ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "  ${CYAN}Hyprland Lua Dotfiles — Kurulum Scripti${NC}"
echo -e "  ${CYAN}github.com/DECes2608/hyprland.lua${NC}\n"

# ── Sistem kontrolü ───────────────────────────────────────
header "Sistem Kontrolü"

# Arch Linux mi?
if ! command -v pacman &>/dev/null; then
    error "Bu script sadece Arch Linux için tasarlandı!"
fi
success "Arch Linux tespit edildi"

# Root ile çalışıyor mu?
if [[ $EUID -eq 0 ]]; then
    error "Bu scripti root olarak çalıştırma! Normal kullanıcı ile çalıştır."
fi
success "Kullanıcı: $(whoami)"

# İnternet bağlantısı
if ! ping -c 1 archlinux.org &>/dev/null; then
    error "İnternet bağlantısı yok!"
fi
success "İnternet bağlantısı mevcut"

# ── yay kurulumu ──────────────────────────────────────────
header "yay (AUR Yardımcısı)"

if command -v yay &>/dev/null; then
    success "yay zaten kurulu: $(yay --version | head -1)"
else
    warning "yay bulunamadı, kuruluyor..."
    info "Önce base-devel ve git kuruluyor..."
    sudo pacman -S --needed --noconfirm git base-devel

    info "yay kaynak koddan derleniyor..."
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    cd "$tmpdir/yay"
    makepkg -si --noconfirm
    cd ~
    rm -rf "$tmpdir"
    success "yay kuruldu!"
fi

# ── Temel sistem paketleri ────────────────────────────────
header "Temel Sistem Paketleri"

PACMAN_PKGS=(
    # Hyprland ekosistemi
    hyprland
    waybar
    hyprpaper
    xdg-desktop-portal-hyprland
    xdg-user-dirs

    # Terminal & kabuk
    kitty
    fish

    # Ses
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol
    pamixer
    playerctl

    # Ağ & bluetooth
    network-manager-applet
    blueman

    # Ekran görüntüsü & clipboard
    grim
    slurp
    wl-clipboard

    # Sistem araçları
    polkit-kde-agent
    brightnessctl
    upower
    gtk3
    gtk4
    qt5-wayland
    qt6-wayland

    # Dosya yönetimi
    yazi
    zathura
    zathura-pdf-mupdf
    poppler
    ffmpegthumbnailer
    unar
    jq
    fd
    ripgrep
    fzf
    zoxide
    imagemagick

    # Geliştirme
    neovim
    git
    lazygit
    nodejs
    npm
    python
    python-pip
    unzip
    base-devel

    # Medya
    mpd
    ncmpcpp
    mpc

    # Uygulama başlatıcı
    rofi-wayland

    # Bildirim
    mako

    # Diğer
    copyq
    localsend
)

info "Kurulacak paketler listeleniyor..."
echo ""
printf '  %s\n' "${PACMAN_PKGS[@]}" | column
echo ""

if confirm "Tüm paketler kurulsun mu?"; then
    sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"
    success "Tüm paketler kuruldu!"
else
    warning "Paket kurulumu atlandı"
fi

# ── AUR paketleri ─────────────────────────────────────────
header "AUR Paketleri"

AUR_PKGS=(
    ncspot
    sioyek
)

info "Kurulacak AUR paketleri:"
printf '  %s\n' "${AUR_PKGS[@]}"
echo ""

if confirm "AUR paketleri kurulsun mu?"; then
    yay -S --needed --noconfirm "${AUR_PKGS[@]}"
    success "AUR paketleri kuruldu!"
else
    warning "AUR kurulumu atlandı"
fi

# ── Fish shell varsayılan kabuk ───────────────────────────
header "Fish Shell"

if [[ "$SHELL" != *"fish"* ]]; then
    if confirm "Fish varsayılan kabuk olarak ayarlansın mı?"; then
        chsh -s "$(which fish)"
        success "Fish varsayılan kabuk olarak ayarlandı (yeniden giriş gerekli)"
    fi
else
    success "Fish zaten varsayılan kabuk"
fi

# ── Dotfiles kurulumu ─────────────────────────────────────
header "Dotfiles Kurulumu"

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

info "Dotfiles dizini: $DOTFILES_DIR"
info "Config dizini: $CONFIG_DIR"
echo ""

if confirm "Config dosyaları ~/.config altına kopyalansın mı?"; then
    # Yedek al
    BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
    warning "Mevcut config yedekleniyor: $BACKUP_DIR"
    cp -r "$CONFIG_DIR" "$BACKUP_DIR" 2>/dev/null || true

    # Kopyala (varsa)
    for dir in hypr waybar kitty mako yazi nvim zathura; do
        if [[ -d "$DOTFILES_DIR/$dir" ]]; then
            info "$dir kopyalanıyor..."
            cp -r "$DOTFILES_DIR/$dir" "$CONFIG_DIR/"
            success "$dir kuruldu"
        fi
    done
else
    warning "Dotfiles kurulumu atlandı"
    info "Manuel kurulum: cp -r <klasör> ~/.config/"
fi

# ── Neovim dagzirvesi teması ──────────────────────────────
header "Neovim Teması (dagzirvesi)"

if confirm "dagzirvesi teması kurulsun mu?"; then
    mkdir -p ~/.config/nvim/colors
    # Tema dosyası varsa kopyala
    if [[ -f "$DOTFILES_DIR/dagzirvesi.lua" ]]; then
        cp "$DOTFILES_DIR/dagzirvesi.lua" ~/.config/nvim/colors/
        success "dagzirvesi.lua kuruldu"
    else
        warning "dagzirvesi.lua bulunamadı, manuel kopyalaman gerekiyor"
    fi
fi

# ── Fish PATH ayarı ───────────────────────────────────────
header "PATH Ayarları"

info "~/.local/bin PATH'e ekleniyor..."
fish -c "fish_add_path ~/.local/bin" 2>/dev/null && success "PATH güncellendi" || warning "Fish ile PATH güncellenemedi, manuel ekle"

# ── Özet ──────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${GREEN}╔══════════════════════════════════════╗${NC}"
echo -e "${BOLD}${GREEN}║        Kurulum Tamamlandı! 🏔️         ║${NC}"
echo -e "${BOLD}${GREEN}╚══════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${CYAN}Sonraki adımlar:${NC}"
echo -e "  1. Hyprland'ı yeniden başlat"
echo -e "  2. ${YELLOW}hyprctl reload${NC} ile config'i yükle"
echo -e "  3. Neovim'i aç ve ${YELLOW}:Lazy sync${NC} yaz"
echo -e "  4. Fish için yeni terminal aç"
echo ""
echo -e "  ${CYAN}Sorun olursa:${NC}"
echo -e "  → Config yedeği: ${YELLOW}~/.config-backup-*${NC}"
echo -e "  → Repo: ${YELLOW}github.com/DECes2608/hyprland.lua${NC}"
echo ""
