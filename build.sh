#!/bin/bash

# Ensure the output directory exists
mkdir -p out

# If a specific file is provided, compile just that file
if [ -n "$1" ]; then
    if ./.venv/bin/python3 compiler/abc2xml.py -o out/ "$1"; then
        echo "Success: $1 compiled to out/"
    else
        echo "Error: Compilation failed for $1"
    fi
else
    # Otherwise, loop through all .abc files in the current directory
    count=0
    for file in src/*.abc; do
        [ -e "$file" ] || continue
        
        if ./.venv/bin/python3 compiler/abc2xml.py -o out/ "$file"; then
            echo "Success: $file compiled to out/"
        else
            echo "Error: Compilation failed for $file"
        fi
        count=$((count + 1))
    done

    if [ $count -eq 0 ]; then
        echo "No .abc files found in the directory."
    fi
fi