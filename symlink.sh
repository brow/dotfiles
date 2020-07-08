#!/bin/bash

for f in `ls -1 -A | grep "^\." | grep -v "^\.git\(modules\)\?$"`
do
    src="$PWD/$f"
    dst="$HOME/$f"
    if [ -f "$dst" ] || [ -d "$dst" ]; then
        echo "Skipping $f"
    else
        echo "ln -s $src $dst"
        ln -s "$src" "$dst"
    fi
done
