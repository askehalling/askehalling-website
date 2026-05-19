#!/bin/bash
set -e

echo "Genererer CV som PDF..."
quarto render _cv.qmd --to typst --output _cv.pdf
mv _cv.pdf files/cv.pdf

echo "Deployer til GitHub Pages..."
quarto publish gh-pages --no-prompt

echo "Færdig! Siden er live på https://askehalling.com"
