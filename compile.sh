#!/bin/bash

function add_commit_hash() {
  commit_hash=$(git rev-parse --short HEAD)
  commit_date=$(git show -s --format=%ci HEAD | cut -d' ' -f1)
  echo "\\newcommand{\\commitHash}{\\href{https://github.com/fnieri/LanguagesAndTranslatorsTP/tree/$commit_hash}{$commit_hash}}" > commit_hash.tex
  echo "\\newcommand{\\commitDate}{$commit_date}" >> commit_hash.tex
}

add_commit_hash
mkdir "out"
pdflatex -output-directory=./out main.tex
# Compile twice to get table of contents
pdflatex -output-directory=./out main.tex
mv "./out/main.pdf" "."
rm -rf "./out"
