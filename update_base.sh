#!/usr/bin/env sh

_DIR=$(dirname "$0")/minilatex
_VERSION=$(($(cat $_DIR/version)+1))
docker build --no-cache -t josealo/minilatex:v$_VERSION $_DIR
docker push josealo/minilatex:v$_VERSION
echo $_VERSION > $_DIR/version
