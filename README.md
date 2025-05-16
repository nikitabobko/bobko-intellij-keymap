# Bobko IntelliJ keymap plugin

The main file you're looking for: [src/keymaps/bobko-keymap.xml](./src/keymaps/bobko-keymap.xml)

Purpose of the plugin:
1. Being able to define custom IntelliJ shortcuts and not to worry that IntelliJ will eventually loose them.
2. Version control the keymap.

Features of the plugin:
1. Unification between macOS and Linux. For every binding that uses `alt`, there is analogical binding but with `command`. This
   way muscle memory is preserved between macOS and Linux.
2. Don't use F-keys, because they are hard to reach on macOS (normally F-keys control the media/system on macOS).

Tips:
1. Drag and drop zip file into IntelliJ IDEA to install plugin

Plugin layout:
```
bobko-keymap.zip
└── bobko-keymap
    └── lib
        └── bobko-keymap.jar
            ├── META-INF
            │   ├── MANIFEST.MF
            │   └── plugin.xml
            └── keymaps
                └── bobko-keymap.xml
```

Bundled keymaps for the reference:
https://github.com/JetBrains/intellij-community/tree/master/platform/platform-resources/src/keymaps

# Building the plugin

```shell
brew install gnu-sed coreutils # on macOS. Not necessary on Linux
./build.sh
```
