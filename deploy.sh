#!/bin/bash
set -e

BRAVE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

echo "Renderer hjemmeside..."
quarto render

echo "Genererer CV-PDF fra cv.html (samme kilde som web-visningen)..."
# --virtual-time-budget giver Google Fonts tid til at loade, så PDF'en bruger
# Source Serif 4 / Source Sans 3 og ikke en fallback-skrift.
"$BRAVE" --headless=new --no-pdf-header-footer --virtual-time-budget=15000 \
  --print-to-pdf="files/cv.pdf" "file://$PWD/_site/cv.html" 2>/dev/null
cp files/cv.pdf _site/files/cv.pdf

echo "Fikser sitemap (/ i stedet for /index.html)..."
sed -i '' 's|/index.html<|/<|g' _site/sitemap.xml

echo "Deployer til GitHub Pages..."
quarto publish gh-pages --no-render --no-prompt

echo "Færdig! Siden er live på https://askehalling.com"
