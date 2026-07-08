#!/bin/bash

# Terminate execution upon error
set -e

# Define paths
REPO_ROOT=$(pwd)
VENV_PYTHON="$REPO_ROOT/.venv/bin/python3"
COMPILER_SCRIPT="$REPO_ROOT/compiler/abc2xml.py"
OUT_DIR="$REPO_ROOT/out"

# 1. Check if a file argument is provided
if [ -z "$1" ]; then
    echo "Error: No input file specified."
    echo "Usage: ./build.sh <path_to_file.abc>"
    exit 1
fi

INPUT_FILE="$1"

# 2. Ensure output directory exists
mkdir -p "$OUT_DIR"

# 3. Run the compiler
if "$VENV_PYTHON" "$COMPILER_SCRIPT" -o "$OUT_DIR/" "$INPUT_FILE"; then
    echo "Success: Compiled $INPUT_FILE to $OUT_DIR/"
else
    echo "Error: Compilation failed for $INPUT_FILE"
    exit 1
fi