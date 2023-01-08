# Bobko IntelliJ keymap plugin

Purpose of the plugin:
1. Being able to define custom IntelliJ shortcuts and not to worry that IntelliJ will eventually loose them
2. Version control the keymap
3. Unification between macOS and Linux. For every binding that uses `alt`, there is analogical binding but with `command`. This way
   muscle memory is preserved between macOS and Linux.

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
