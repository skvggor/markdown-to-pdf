#!/bin/bash

# Diretório de destino para os arquivos PDF
DEST_DIR="PDF"
mkdir -p "$DEST_DIR"

for mdfile in $(find . -name "*.md"); do
  # Ignora o arquivo README.md
  if [ "$(basename "$mdfile")" != "README.md" ]; then
    pdffile="${mdfile%.md}.pdf"
    pdffile_dest="$DEST_DIR/$(basename $pdffile)"

    current_date=$(date "+%d/%m/%Y")

    echo -e "Data de geração: $current_date  \n" | cat - "$mdfile" > temp.md

    pandoc temp.md -s -o "$pdffile_dest"

    rm temp.md
  fi
done

echo "Conversão concluída. Arquivos PDF estão no diretório '$DEST_DIR'."
