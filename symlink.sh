#!/bin/bash

for f in `ls -1 -A | grep "^\." | grep -v "^\.git\(modules\)\?$"`
do
    echo "Linking $f"
    ln -s "$PWD/$f" "$HOME/$f"
done

for f in Preferences/*
do
    echo "Linking $f"
    ln -s "$PWD/$f" "$HOME/Library/$f"
done

ln -s "$PWD/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
