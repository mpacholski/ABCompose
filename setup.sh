#!/bin/bash

# Define rigid architectural paths
REPO_ROOT=$(pwd)
VENV_DIR="$REPO_ROOT/.venv"
COMPILER_DIR="$REPO_ROOT/compiler"
COMPILER_SCRIPT="$COMPILER_DIR/abc2xml.py"
OUT_DIR="$REPO_ROOT/out"
REMOTE_SOURCE="https://raw.githubusercontent.com/delaudio/abc2xml/main/abc2xml.py"

# Terminate execution upon error
set -e

echo "Initiating environment construction protocol..."

# 1. Synthesize ephemeral directories
mkdir -p "$COMPILER_DIR"
mkdir -p "$OUT_DIR"
echo "Directories instantiated."

# 2. Instantiate the isolated Python runtime
python3 -m venv "$VENV_DIR"
echo "Virtual environment synthesized."

# 3. Resolve dependencies
echo "Resolving local dependencies..."
"$VENV_DIR/bin/pip" install --upgrade pip
"$VENV_DIR/bin/pip" install -r requirements.txt
echo "Dependencies resolved."

# 4. Acquire the translation artifact
echo "Retrieving abc2xml.py compiler..."
curl -s -S -o "$COMPILER_SCRIPT" "$REMOTE_SOURCE"
chmod +x "$COMPILER_SCRIPT"
echo "Compiler acquired."

# 5. Configure execution permissions for orchestration scripts
if [ -f "build.py" ]; then
    chmod +x build.py
fi

echo "Initialization protocol complete. System is operational."