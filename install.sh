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
NC='\033[0m'

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

# ── Banner ────────────────────────────────────────────────
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

# Arch tabanlı mı?
if ! command -v pacman &>/dev/null; then
    error "Bu script sadece Arch tabanlı dağıtımlar için tasarlandı!"
fi
success "Arch tabanlı sistem tespit edildi"

# Garuda kontrolü
if command -v garuda-update &>/dev/null; then
    info "Garuda Linux tespit edildi"
    IS_GARUDA=true
    success "chaotic-AUR mevcut — AUR paketleri binary olarak kurulabilir"
else
    IS_GARUDA=false
fi

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
elif command -v paru &>/dev/null; then
    # Garuda'da paru da olabilir, yay yerine kullanabiliriz
    info "paru tespit edildi, yay yerine paru kullanılacak"
    AUR_HELPER="paru"
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

# AUR helper belirle
AUR_HELPER="${AUR_HELPER:-yay}"
success "AUR yardımcısı: $AUR_HELPER"

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

    # Bluetooth
    bluez
    bluez-utils
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
)

info "Kurulacak paketler:"
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
    localsend-bin
    copyq
)

info "Kurulacak AUR paketleri:"
printf '  %s\n' "${AUR_PKGS[@]}"
echo ""

if confirm "AUR paketleri kurulsun mu?"; then
    $AUR_HELPER -S --needed --noconfirm "${AUR_PKGS[@]}"
    success "AUR paketleri kuruldu!"
else
    warning "AUR kurulumu atlandı"
fi

# ── Servisleri aktif et ───────────────────────────────────
header "Servis Aktivasyonları"

# Bluetooth
if confirm "Bluetooth servisi aktif edilsin mi?"; then
    sudo systemctl enable --now bluetooth.service
    success "bluetooth.service aktif edildi"
fi

# MPD (kullanıcı servisi)
if confirm "MPD servisi aktif edilsin mi?"; then
    systemctl --user enable --now mpd.service
    success "mpd.service (kullanıcı) aktif edildi"
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

warning "Symlink kurulumu: Repo'daki değişiklikler otomatik yansır, kopyalama yapılmaz."
echo ""

if confirm "Config dosyaları ~/.config altına symlink ile bağlansın mı?"; then
    # Yedek al
    BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
    warning "Mevcut config yedekleniyor: $BACKUP_DIR"
    cp -r "$CONFIG_DIR" "$BACKUP_DIR" 2>/dev/null || true
    success "Yedek alındı: $BACKUP_DIR"

    # Symlink kur
    for dir in hypr waybar kitty mako yazi nvim zathura; do
        if [[ -d "$DOTFILES_DIR/$dir" ]]; then
            # Eğer hedef zaten varsa kaldır
            [[ -e "$CONFIG_DIR/$dir" || -L "$CONFIG_DIR/$dir" ]] && rm -rf "$CONFIG_DIR/$dir"
            ln -sf "$DOTFILES_DIR/$dir" "$CONFIG_DIR/$dir"
            success "$dir → symlink kuruldu"
        else
            warning "$dir klasörü repoda bulunamadı, atlanıyor"
        fi
    done
else
    warning "Dotfiles kurulumu atlandı"
    info "Manuel kurulum: ln -sf ~/dotfiles/<klasör> ~/.config/"
fi

# ── Neovim dagzirvesi teması ──────────────────────────────
header "Neovim Teması (dagzirvesi)"

if confirm "dagzirvesi teması kurulsun mu?"; then
    mkdir -p ~/.config/nvim/colors
    if [[ -f "$DOTFILES_DIR/dagzirvesi.lua" ]]; then
        cp "$DOTFILES_DIR/dagzirvesi.lua" ~/.config/nvim/colors/
        success "dagzirvesi.lua kuruldu"
    else
        warning "dagzirvesi.lua bulunamadı, manuel kopyalaman gerekiyor"
        info "Beklenen konum: $DOTFILES_DIR/dagzirvesi.lua"
    fi
fi

# ── Fish PATH ayarı ───────────────────────────────────────
header "PATH Ayarları"

info "~/.local/bin PATH'e ekleniyor..."
if fish -c "fish_add_path ~/.local/bin" 2>/dev/null; then
    success "PATH güncellendi"
else
    warning "Fish ile PATH güncellenemedi"
    info "Manuel eklemek için: fish_add_path ~/.local/bin"
fi

# ── Özet ──────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${GREEN}╔══════════════════════════════════════╗${NC}"
echo -e "${BOLD}${GREEN}║        Kurulum Tamamlandı! 🏔️         ║${NC}"
echo -e "${BOLD}${GREEN}╚══════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${CYAN}Sonraki adımlar:${NC}"
echo -e "  1. Sistemi yeniden başlat veya yeniden giriş yap"
echo -e "  2. Hyprland'ı başlat"
echo -e "  3. ${YELLOW}hyprctl reload${NC} ile config'i yükle"
echo -e "  4. Neovim'i aç ve ${YELLOW}:Lazy sync${NC} yaz"
echo -e "  5. Fish için yeni terminal aç"
echo ""
echo -e "  ${CYAN}Sorun olursa:${NC}"
echo -e "  → Config yedeği: ${YELLOW}~/.config-backup-*${NC}"
echo -e "  → Repo: ${YELLOW}github.com/DECes2608/hyprland.lua${NC}"
echo ""
