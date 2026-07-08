# ABCompose

ABCompose is a lightweight toolkit designed to integrate AI agents and automated workflows into music composition, arrangement, and engraving. By providing automated environment setup and straightforward shell scripts, the project converts generated ABC music notation files (.abc) into the standard MusicXML format (.xml). This allows the output to be natively imported, edited, and formatted in popular scoring software such as MuseScore, Dorico, and Sibelius.

## Initial Setup

Before converting any files, set up the local environment. This script creates a local Python virtual environment, installs the required packages, and downloads the [abc2xml](https://github.com/delaudio/abc2xml) conversion tool.

Run these commands in the terminal from the project folder:

```bash
chmod +x setup.sh
./setup.sh

```

## Directory Structure

* Place all source `.abc` sheet music files into the `src/` directory.
* Compiled `.xml` files are automatically generated and saved in the `out/` directory.

## Compiling the Files

To compile a `.abc` file, provide its path as an argument to the `./build.sh` script. The output will be saved in the `out/` directory. Example:

```bash
./build.sh src/twinkle_bass.abc
```

This project includes pre-configured VS Code tasks (`.vscode/tasks.json`). Use the *Build* keyboard shortcut (default `Cmd+Shift+B`) to compile the `.abc` file currently active in the editor.


## Recommended Extension

If using Visual Studio Code, install the [ABC Music Notation](https://marketplace.visualstudio.com/items?itemName=softaware.abc-music) extension. It provides syntax highlighting and sheet music previews for `.abc` files.