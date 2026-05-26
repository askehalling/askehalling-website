#!/bin/bash
set -e

echo "Genererer CV som PDF..."
quarto render _cv.qmd --to typst --output _cv.pdf
mv _cv.pdf files/cv.pdf

echo "Renderer hjemmeside..."
quarto render

echo "Fikser sitemap (/ i stedet for /index.html)..."
sed -i '' 's|/index.html<|/<|g' _site/sitemap.xml

echo "Deployer til GitHub Pages..."
quarto publish gh-pages --no-render --no-prompt

echo "Færdig! Siden er live på https://askehalling.com"
