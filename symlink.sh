#!/bin/bash

for f in `ls -1 -A | grep "^\." | grep -v "^\.git\(modules\)\?$"`
do
    echo "Linking $f"
    ln -s "$PWD/$f" "$HOME/$f"
done
