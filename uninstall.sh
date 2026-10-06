#!/bin/bash


INSTALL_DIR="/usr/local/bin"

if [ ! -f "$INSTALL_DIR/ani-neko" ]; then
    echo "El script ani-neko no está instalado en el sistema."
    exit 1
fi

sudo rm "$INSTALL_DIR/ani-neko"

if [ -d "$HOME/ani-es" ]; then
    rm -rf "$HOME/ani-es"
fi

echo "El script ani-neko ha sido desinstalado correctamente."
