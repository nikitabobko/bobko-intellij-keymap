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

cd "$(dirname "$0")"
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
    git_dirty_status=""
    if ! test -z "$(git status --porcelain)"; then
        echo "warning: git is dirty"
        git_dirty_status=".git-is-dirty"
    fi
    sed -i "s/VERSION_PLACEHOLDER/$date_snapshot.$(git rev-parse HEAD)$git_dirty_status/" .build/bobko-keymap-jar/META-INF/plugin.xml
    cd .build/bobko-keymap-jar
        jar cf bobko-keymap.jar *
    cd - > /dev/null
}

build-plugin() {
    install -D -m644 .build/bobko-keymap-jar/bobko-keymap.jar \
                     .build/bobko-keymap/lib/bobko-keymap.jar
    cd .build
        zip -r bobko-keymap.zip bobko-keymap
    cd - > /dev/null
    realpath .build/bobko-keymap.zip
}

build-jar
build-plugin
