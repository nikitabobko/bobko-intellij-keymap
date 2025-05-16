#!/usr/bin/env bash
set -e # Exit if one of commands exit with non-zero exit code
set -u # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error
set -o pipefail # Any command failed in the pipe fails the whole pipe
# set -x # Print shell commands as they are executed (or you can try -v which is less verbose)

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Use GNU on macOS for consistency with Linux
    sed() { gsed "$@"; }
    install() { ginstall "$@"; }
fi

cd $(dirname "$0")
rm -rf .build

# Plugin layout:
# bobko-keymap.zip
# └── bobko-keymap
#     └── lib
#         └── bobko-keymap.jar
#             ├── META-INF
#             │   ├── MANIFEST.MF
#             │   └── plugin.xml
#             └── keymaps
#                 └── bobko-keymap.xml

build-jar() {
    mkdir -p .build/bobko-keymap-jar
    cp -r src/* .build/bobko-keymap-jar
    date_snapshot=$(date +"%Y-%m-%d.%H:%M:%S")
    if [ ! -z "$(git status --porcelain)" ]; then
        git add --all
        git commit -m "SNAPSHOT $date_snapshot"
    fi
    sed -i "s/VERSION_PLACEHOLDER/$date_snapshot.$(git rev-parse HEAD)/" .build/bobko-keymap-jar/META-INF/plugin.xml
    pushd .build/bobko-keymap-jar
        jar cf bobko-keymap.jar *
    popd
}

build-plugin() {
    install -D -m644 .build/bobko-keymap-jar/bobko-keymap.jar \
                     .build/bobko-keymap/lib/bobko-keymap.jar
    pushd .build
        zip -r --verbose bobko-keymap.zip bobko-keymap
    popd
}

build-jar
build-plugin
