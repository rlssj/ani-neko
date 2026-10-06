#!/bin/bash
#
# Desinstalador de ani-neko
#

SCRIPT_NAME="ani-neko"
HISTORY_DIR="$HOME/ani-es"

removed=0
for dir in "$HOME/.local/bin" "/usr/local/bin"; do
    if [ -f "$dir/$SCRIPT_NAME" ]; then
        if [ -w "$dir/$SCRIPT_NAME" ]; then
            rm -f "$dir/$SCRIPT_NAME"
        else
            sudo rm -f "$dir/$SCRIPT_NAME"
        fi
        echo "Eliminado: $dir/$SCRIPT_NAME"
        removed=1
    fi
done

if [ "$removed" -eq 0 ]; then
    echo "El script $SCRIPT_NAME no está instalado en el sistema."
fi

if [ -d "$HISTORY_DIR" ]; then
    rm -rf "$HISTORY_DIR"
    echo "Eliminado el historial: $HISTORY_DIR"
fi

echo "$SCRIPT_NAME ha sido desinstalado correctamente."
