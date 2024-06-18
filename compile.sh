#!/bin/bash

mkdir "out"
pdflatex -output-directory=./out main.tex
# Compile twice to get table of contents
pdflatex -output-directory=./out main.tex
mv "./out/main.pdf" "."
rm -rf "./out"
