#!/usr/bin/env bash
#
# install.sh - Instala scripts de ação rápida no Nautilus
# Autor: Diogo Pessoa
#
# Requisitos:
#   - Homebrew com: pandoc, poppler, imagemagick, typst
#   - GNOME Shell
#   - Fedora Atomic
#

set -e

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.local/share/nautilus/scripts"

echo ">> Criando diretório de scripts do Nautilus (se não existir): $TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo ">> Copiando scripts para $TARGET_DIR ..."
for script in "$SCRIPTS_DIR"/*; do
    [ -f "$script" ] || continue
    # Ignora o próprio install.sh
    base=$(basename "$script")
    [ "$base" = "install.sh" ] && continue

    echo "   - $base"
    cp "$script" "$TARGET_DIR/"
    chmod +x "$TARGET_DIR/$base"
done

echo ""
echo ">> Instalação concluída!"
echo ""
echo "Próximos passos:"
echo "  1. Reinicie o Nautilus:"
echo "       nautilus -q"
echo "       nautilus &"
echo ""
echo "  2. No Nautilus, selecione arquivos/pastas, clique direito → Scripts"
echo "     e use as ações instaladas:"
echo "       - Converter para PDF"
echo "       - Converter para DOCX"
echo "       - Converter para Markdown"
echo "       - Converter para TXT"
echo "       - Imagem para PNG"
echo "       - Imagem para JPG"
echo "       - Imagem para WEBP"
echo ""
echo "Os arquivos convertidos serão salvos em:"
echo "  ~/Documentos/Convertidos"
echo ""
