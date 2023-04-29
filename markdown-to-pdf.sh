#!/bin/bash

# Destination directory for PDF files
DEST_DIR="PDF"
mkdir -p "$DEST_DIR"

for mdfile in $(find . -name "*.md"); do
  # Ignore the README.md file
  if [ "$(basename "$mdfile")" != "README.md" ]; then
    pdffile="${mdfile%.md}.pdf"
    pdffile_dest="$DEST_DIR/$(basename $pdffile)"

    current_date=$(date "+%d/%m/%Y")

    echo -e "Generation date: $current_date  \n" | cat - "$mdfile" > temp.md

    pandoc temp.md -s -o "$pdffile_dest"

    rm temp.md
  fi
done

echo "Conversion completed. PDF files are in the '$DEST_DIR' directory."
