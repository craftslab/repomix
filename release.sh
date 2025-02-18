#!/bin/bash

# Fetch repomix
version="$1"
git clone https://github.com/yamadashy/repomix/ -b v"$version" --depth=1

pushd repomix || exit

# Build repomix
npm install
npm run repomix

# Build package
mkdir repomix-"$version"
cp -r bin lib -t repomix-"$version"
zip -r repomix-"$version".zip repomix-"$version"

popd || exit
