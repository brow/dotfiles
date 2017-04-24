#!/bin/bash

for f in `ls -1 -A | grep "^\." | grep -v "^\.git\(modules\)\?$"`
do
    echo "Linking $f"
    ln -s "$PWD/$f" "$HOME/$f"
done

ln -s "$PWD/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
