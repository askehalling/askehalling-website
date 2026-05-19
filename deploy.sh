#!/bin/bash
set -e

echo "Genererer CV som PDF..."
quarto render cv.qmd --to typst --output cv.pdf
mv _site/cv.pdf files/cv.pdf

echo "Deployer til GitHub Pages..."
quarto publish gh-pages --no-prompt

echo "Færdig! Siden er live på https://askehalling.com"
