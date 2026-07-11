# Ações Rápidas no Nautilus

Script de **ações rápidas** com clique direito dentro do **Nautilus** (GNOME Files) para **Fedora Atomic**, com foco em conversão de documentos e imagens.

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
- [Homebrew](https://brew.sh/pt-br/) para instalação das dependências

Instale as dependências com:

```bash
brew install pandoc poppler imagemagick typst
``` 

## Destino das Pastas Após Instalação

Após executar `./install.sh`, serão criadas duas pastas em:

```text
~/Documentos/Convertidos/ # os arquivos convertidos 

~/.local/share/nautilus/scripts/ # os scripts
```

## Instalação

Clone o repositório e execute o script de instalação:

```bash
git clone https://github.com/diogopessoa/nautilus-actions.git && cd nautilus-actions && chmod +x install.sh && ./install.sh
```

Depois reinicie o Nautilus:

```bash
nautilus -q
nautilus &
```

## Uso

No Nautilus:

1. Selecione um ou mais arquivos.
2. Clique com o botão direito.
3. Vá em **Scripts**.
4. Escolha uma das ações disponíveis:
   - `Converter para PDF`
   - `Converter para DOCX`
   - `Converter para Markdown`
   - `Converter para TXT`
   - `Imagem para PNG`
   - `Imagem para JPG`
   - `Imagem para WEBP`

Os arquivos convertidos serão salvos em:

```bash
~/Documentos/Convertidos
```

## Desinstalação

Caso queira remover os scripts instalados e, opcionalmente, os arquivos gerados e as dependências do Homebrew:

```bash
chmod +x uninstall.sh
./uninstall.sh
```

## Licença

- [MIT](https://github.com/diogopessoa/nautilus-actions/blob/main/LICENSE)

## Créditos

- Inspirado em: [cfgnunes/nautilus-scripts](https://github.com/cfgnunes/nautilus-scripts).
