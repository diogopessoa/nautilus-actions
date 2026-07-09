# Atalhos de Ações Rápidas para o Nautilus

Ações rápidas com clique direito dentro do **Nautilus** (GNOME Files) para **Fedora Atomic**, com foco em conversão de documentos e imagens.

## Funcionalidades

- Converter documentos para:
  - PDF
  - DOCX
  - Markdown (`.md`)
  - Texto puro (`.txt`)
- Converter imagens para:
  - PNG
  - JPG
  - WEBP

Todos os arquivos convertidos são salvos em:

```bash
~/Documentos/Convertidos
```

Ao final de cada ação, uma notificação é enviada via `notify-send`.

## Requisitos

- Nautilus (GNOME Files)
- GNOME Shell 
- Ferramentas instaladas - via [Homebrew](https://brew.sh/pt-br/) ou rpm-ostree:
  - `pandoc`
  - `poppler` (para `pdftotext`)
  - `imagemagick`
  - `typst`

Exemplo:

```bash
brew install pandoc poppler imagemagick typst
```

## Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/diogopessoa/nautilus-actions.git
   cd nautilus-actions
   ```

2. Execute o script de instalação:

   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. Reinicie o Nautilus:

   ```bash
   nautilus -q
   nautilus &
   ```

## Uso

No Nautilus:

1. Selecione um ou mais arquivos.
2. Clique direito → **Scripts**.
3. Escolha uma das ações:
   - `Converter para PDF`
   - `Converter para DOCX`
   - `Converter para Markdown`
   - `Converter para TXT`
   - `Imagem para PNG`
   - `Imagem para JPG`
   - `Imagem para WEBP`

Os arquivos convertidos aparecerão em `~/Documentos/Convertidos`.

## Destino dos Scripts

```text
# Dentro da pasta scripts:
~/.local/share/nautilus/scripts/
```

## Licença

- [MIT](https://github.com/diogopessoa/nautilus-actions/blob/main/LICENSE)
