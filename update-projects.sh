#!/bin/bash

TARGET_DIR="projects/"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: $TARGET_DIR is not a valid directory."
    exit 1
fi

for dir in "$TARGET_DIR"/*/; do
    if [[ -d "$dir/.git" ]]; then
        echo "Entering $dir"
        cd "$dir" || continue
        git pull origin main
        cd - > /dev/null
    else
        echo "Skipping $dir (not a Git repository)"
    fi
done

echo "Done."
