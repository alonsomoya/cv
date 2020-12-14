#!/usr/bin/env sh

_DIR=$(dirname "$0")
_BASE_VERSION=$(cat $_DIR/minilatex/version)
_VERSION=$(($(cat $_DIR/version)+1))

docker build --no-cache --build-arg VERSION=v$_BASE_VERSION -t latex:latest $_DIR
docker create -ti --name latexc latex:latest bash
docker cp latexc:/var/local/main.pdf $_DIR/CV_JoseAlonso.pdf
docker rm -f latexc
which mupdf &>/dev/null && mupdf $_DIR/CV_JoseAlonso.pdf &
