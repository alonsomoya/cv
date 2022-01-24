#!/usr/bin/env sh

_DIR=$(dirname "$0")
_BASE_VERSION=$(cat $_DIR/minilatex/version)
_VERSION=$(($(cat $_DIR/version)+1))

docker build --no-cache --build-arg VERSION=v$_BASE_VERSION -t latex:latest $_DIR
docker create -ti --name latexc latex:latest bash
docker cp latexc:/var/local/main.pdf $_DIR/CV_JoseAlonso.pdf
docker rm -f latexc
pdftoppm CV_JoseAlonso.pdf CV_JoseAlonso -png -singlefile
convert -border 5 -bordercolor black CV_JoseAlonso.png CV_JoseAlonso.png
#which mupdf &>/dev/null && mupdf $_DIR/CV_JoseAlonso.pdf &
which feh &>/dev/null && feh $_DIR/CV_JoseAlonso.png &
