#!/usr/bin/env bash
set -e # Exit if one of commands exit with non-zero exit code
set -u # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error
set -o pipefail # Any command failed in the pipe fails the whole pipe
# set -x # Print shell commands as they are executed (or you can try -v which is less verbose)

mkdir() { /bin/mkdir -p "$@"; }
cp() { /bin/cp -r "$@"; }
cd "$(dirname "$0")"
rm -rf build

build-jar() {
    mkdir build/bobko-keymap-jar
    cp src/* build/bobko-keymap-jar
    pushd build/bobko-keymap-jar
        jar -c --verbose --file=bobko-keymap.jar *
    popd
}

build-plugin() {
    install -D -m644 build/bobko-keymap-jar/bobko-keymap.jar \
                     build/bobko-keymap/lib/bobko-keymap.jar
    pushd build
        zip -r --verbose bobko-keymap.zip bobko-keymap
    popd
}

build-jar
build-plugin
