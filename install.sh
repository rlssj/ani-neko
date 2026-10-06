#!/bin/bash

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
    else
        echo "Gestor de paquetes no soportado."
        exit 1
    fi
}

update_system() {
    case $PKG_MANAGER in
        apt)
            sudo apt-get update -y
            ;;
        dnf)
            sudo dnf makecache -y
            ;;
        yum)
            sudo yum makecache -y
            ;;
        zypper)
            sudo zypper refresh -y
            ;;
        pacman)
            sudo pacman -Sy --noconfirm
            ;;
    esac
}

install_package() {
    local package=$1

    case $PKG_MANAGER in
        apt)
            sudo apt-get install -y "$package"
            ;;
        dnf)
            sudo dnf install -y "$package"
            ;;
        yum)
            sudo yum install -y "$package"
            ;;
        zypper)
            sudo zypper install -y "$package"
            ;;
        pacman)
            sudo pacman -S --noconfirm "$package"
            ;;
    esac
}

detect_package_manager
update_system

install_package wget
install_package fzf
install_package grep
install_package sed
install_package python3
install_package mpv
install_package curl
install_package jq

echo "Todas las dependencias han sido instaladas correctamente."

INSTALL_DIR="/usr/local/bin"
SCRIPT_PATH="$(pwd)/ani-neko"

if [ -f "$INSTALL_DIR/ani-neko" ]; then
    echo "El script ani-neko ya existe en el PATH."
    exit 1
fi

sudo chmod +x ani-neko
sudo chmod +x uninstall.sh
sudo cp "$SCRIPT_PATH" "$INSTALL_DIR"

echo ""
clear
echo "El script ani-neko se ha instalado correctamente en el directorio $INSTALL_DIR."
echo "Ahora puedes ejecutar 'ani-neko' en cualquier lugar del sistema."
