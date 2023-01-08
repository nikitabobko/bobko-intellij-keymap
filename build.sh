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
    mkdir build/bobko-keymap-for-$1-jar
    cp src/$1/* build/bobko-keymap-for-$1-jar
    pushd build/bobko-keymap-for-$1-jar
        jar -c --verbose --file=bobko-keymap-for-$1.jar *
    popd
}

build-plugin() {
    install -D -m644 build/bobko-keymap-for-$1-jar/bobko-keymap-for-$1.jar \
                     build/bobko-keymap-for-$1/lib/bobko-keymap-for-$1.jar
    pushd build
        zip -r bobko-keymap-for-$1.zip bobko-keymap-for-$1
    popd
}

build-jar macOs
build-plugin macOs

