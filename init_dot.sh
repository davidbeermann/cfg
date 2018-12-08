#!/bin/bash
GIT=$(which git)
if [ -z "$GIT" ]; then
    echo "Git not found!"
    exit 1
fi

# alias dot="$GIT --git-dir=$HOME/.dot/ --work-tree=$HOME"

echo ".dot" >> .gitignore

git clone --bare git@github.com:davidbeermann/dot.git "$HOME/.dot"
