#!/bin/bash

for f in `ls -1 -A | grep "^\." | grep -v "^\.git\(modules\)\?$"`
do
    echo "Linking $f"
    ln -s "$PWD/$f" "$HOME/$f"
done

echo "Linking karabiner.json"
mkdir -p "$HOME/.config/karabiner"
ln -s "$PWD/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
