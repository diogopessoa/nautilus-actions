#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_SRC="$REPO_DIR/scripts"
TARGET_DIR="$HOME/.local/share/nautilus/scripts"

if ! command -v brew >/dev/null 2>&1; then
    echo "Erro: Homebrew não encontrado."
    echo "Instale o Homebrew antes de continuar."
    exit 1
fi

echo ">> Homebrew encontrado."

echo ">> Instalando dependências..."
brew install pandoc poppler imagemagick typst

if [ ! -d "$SCRIPTS_SRC" ]; then
    echo "Erro: pasta scripts/ não encontrada em $SCRIPTS_SRC"
    exit 1
fi

echo ">> Criando diretório do Nautilus: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo ">> Copiando scripts..."
for script in "$SCRIPTS_SRC"/*; do
    [ -f "$script" ] || continue
    base="$(basename "$script")"
    cp "$script" "$TARGET_DIR/$base"
    chmod +x "$TARGET_DIR/$base"
    echo "   - $base"
done

echo ">> Instalação concluída."
echo ">> Reinicie o Nautilus com: nautilus -q && nautilus &"
