#!/bin/bash
#
# Instalador de ani-neko
#   curl -fsSL https://raw.githubusercontent.com/rlssj/ani-neko/main/install.sh | bash
#

set -e

REPO_RAW="https://raw.githubusercontent.com/rlssj/ani-neko/main"
SCRIPT_NAME="ani-neko"
DEPS=(curl fzf grep sed python3 mpv jq)

info() { printf '\033[0;36m%s\033[0m\n' "$*"; }
ok()   { printf '\033[0;32m%s\033[0m\n' "$*"; }
warn() { printf '\033[0;33m%s\033[0m\n' "$*"; }
err()  { printf '\033[0;31m%s\033[0m\n' "$*"; }

detect_package_manager() {
    if command -v apt-get &> /dev/null; then
        PKG_MANAGER="apt"
    elif command -v dnf &> /dev/null; then
        PKG_MANAGER="dnf"
    elif command -v yum &> /dev/null; then
        PKG_MANAGER="yum"
    elif command -v zypper &> /dev/null; then
        PKG_MANAGER="zypper"
    elif command -v pacman &> /dev/null; then
        PKG_MANAGER="pacman"
    elif command -v apk &> /dev/null; then
        PKG_MANAGER="apk"
    elif command -v xbps-install &> /dev/null; then
        PKG_MANAGER="xbps"
    else
        err "Gestor de paquetes no soportado."
        err "Instala manualmente estas dependencias: ${DEPS[*]}"
        exit 1
    fi
}

install_package() {
    local package=$1
    case $PKG_MANAGER in
        apt)    sudo apt-get install -y "$package" ;;
        dnf)    sudo dnf install -y "$package" ;;
        yum)    sudo yum install -y "$package" ;;
        zypper) sudo zypper install -y "$package" ;;
        pacman) sudo pacman -S --noconfirm "$package" ;;
        apk)    sudo apk add "$package" ;;
        xbps)   sudo xbps-install -Sy "$package" ;;
    esac
}

# --- 1. Dependencias (solo instala las que falten) --------------------------
missing=()
for dep in "${DEPS[@]}"; do
    command -v "$dep" &> /dev/null || missing+=("$dep")
done

if [ ${#missing[@]} -eq 0 ]; then
    ok "Todas las dependencias ya están instaladas."
else
    info "Faltan dependencias: ${missing[*]}"
    detect_package_manager
    if [ "$PKG_MANAGER" == "apt" ]; then
        sudo apt-get update -y
    elif [ "$PKG_MANAGER" == "dnf" ]; then
        sudo dnf makecache -y
    elif [ "$PKG_MANAGER" == "yum" ]; then
        sudo yum makecache -y
    elif [ "$PKG_MANAGER" == "zypper" ]; then
        sudo zypper refresh -y
    elif [ "$PKG_MANAGER" == "pacman" ]; then
        sudo pacman -Sy --noconfirm
    elif [ "$PKG_MANAGER" == "apk" ]; then
        sudo apk update
    elif [ "$PKG_MANAGER" == "xbps" ]; then
        sudo xbps-install -S
    fi
    for pkg in "${missing[@]}"; do
        install_package "$pkg"
    done
    ok "Dependencias instaladas."
fi

# --- 2. Obtener el script (local si estamos en el repo, si no descargar) ----
if [ -f "./$SCRIPT_NAME" ]; then
    SRC="./$SCRIPT_NAME"
else
    SRC="$(mktemp)"
    info "Descargando $SCRIPT_NAME..."
    curl -fsSL "$REPO_RAW/$SCRIPT_NAME" -o "$SRC"
fi

# --- 3. Instalar en el PATH (sin sudo siempre que sea posible) --------------
if mkdir -p "$HOME/.local/bin" 2> /dev/null && [ -w "$HOME/.local/bin" ]; then
    INSTALL_DIR="$HOME/.local/bin"
    install -m 755 "$SRC" "$INSTALL_DIR/$SCRIPT_NAME"
else
    INSTALL_DIR="/usr/local/bin"
    sudo install -m 755 "$SRC" "$INSTALL_DIR/$SCRIPT_NAME"
fi

# --- 4. Avisar si el directorio no está en el PATH --------------------------
case ":$PATH:" in
    *":$INSTALL_DIR:"*) ;;
    *)
        warn ""
        warn "Aviso: $INSTALL_DIR no está en tu PATH."
        warn "Añade esta línea a tu ~/.bashrc (o ~/.zshrc):"
        warn "    export PATH=\"$INSTALL_DIR:\$PATH\""
        ;;
esac

echo ""
ok "ani-neko instalado en $INSTALL_DIR/$SCRIPT_NAME"
echo "Ejecuta:  $SCRIPT_NAME"
echo "Ayuda:    $SCRIPT_NAME --help"
