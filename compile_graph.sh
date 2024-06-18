 #!/bin/bash

if [ $# -eq 1 ]
  then
    echo "You need to supply arguments: The TP and the filename without the extension"
    exit
fi
mkdir "./out"
TP=$1
filename=$2
pdflatex -output-directory=./out "${TP}/${filename}.tex"
mv "./out/${filename}.pdf" "img/${TP}"
rm -rf "./out"
