#!/usr/bin/env bash

set -euo pipefail

TARGET_DIR="$HOME/.local/share/nautilus/scripts"
CONVERT_DIR="$HOME/Documentos/Convertidos"

echo "Este script vai remover os scripts do Nautilus instalados por este projeto."
echo "Opcionalmente, também pode remover a pasta de saída e as dependências do Homebrew."
echo ""

read -r -p "Remover scripts do Nautilus? [y/N] " remove_scripts
read -r -p "Remover pasta ~/Documentos/Convertidos? [y/N] " remove_convert_dir
read -r -p "Desinstalar dependências do Homebrew (pandoc, poppler, imagemagick, typst)? [y/N] " remove_brew_deps

if [[ "$remove_scripts" =~ ^[Yy]$ ]]; then
    if [ -d "$TARGET_DIR" ]; then
        echo ">> Removendo scripts de $TARGET_DIR ..."
        rm -f "$TARGET_DIR/Converter para PDF"
        rm -f "$TARGET_DIR/Converter para DOCX"
        rm -f "$TARGET_DIR/Converter para Markdown"
        rm -f "$TARGET_DIR/Converter para TXT"
        rm -f "$TARGET_DIR/Imagem para PNG"
        rm -f "$TARGET_DIR/Imagem para JPG"
        rm -f "$TARGET_DIR/Imagem para WEBP"
        echo ">> Scripts removidos."
    else
        echo ">> Diretório $TARGET_DIR não encontrado."
    fi
fi

if [[ "$remove_convert_dir" =~ ^[Yy]$ ]]; then
    if [ -d "$CONVERT_DIR" ]; then
        echo ">> Removendo $CONVERT_DIR ..."
        rm -rf "$CONVERT_DIR"
        echo ">> Pasta removida."
    else
        echo ">> Pasta $CONVERT_DIR não encontrada."
    fi
fi

if [[ "$remove_brew_deps" =~ ^[Yy]$ ]]; then
    if command -v brew >/dev/null 2>&1; then
        echo ">> Removendo dependências do Homebrew..."
        brew uninstall pandoc poppler imagemagick typst || true
        echo ">> Dependências removidas."
    else
        echo ">> Homebrew não encontrado. Pulando remoção das dependências."
    fi
fi

echo ""
echo "Desinstalação concluída."
