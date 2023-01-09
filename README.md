# Bobko IntelliJ keymap plugin

Purpose of the plugin:
1. Being able to define custom IntelliJ shortcuts and not to worry that IntelliJ will eventually loose them.
2. Version control the keymap.
3. Unification between macOS and Linux. For every binding that uses `alt`, there is analogical binding but with `command`. This way
   muscle memory is preserved between macOS and Linux.
4. Don't use F-keys, because they are hard to reach on macOS (normally F-keys control the media/system on macOS).

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

1. `build.sh` script relies on GNU CLI tools. If you're on macOS then follow this instruction
   https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da
2. run `build.sh`
