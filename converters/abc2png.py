import sys
import os
from music21 import converter, environment

def check_musescore():
    """
    Checks if MuseScore is configured correctly with music21.
    """
    env = environment.Environment()
    musescore_path = env['musescoreDirectPNGPath']
    
    # Correct path for MuseScore 4 on macOS
    correct_path = "/Applications/MuseScore 4.app/Contents/MacOS/mscore"

    if str(musescore_path) != correct_path or not os.path.exists(musescore_path):
        print("---")
        print("ERROR: MuseScore is not configured correctly for music21.")
        print(f"music21 is looking for MuseScore at (repr): {repr(musescore_path)}")
        print(f"The path should be (repr): {repr(correct_path)}")
        print(f"Does the path exist? {os.path.exists(musescore_path)}")
        print("\nTo fix this, please run the following commands in your Python environment:")
        print("from music21 import environment")
        print("us = environment.UserSettings()")
        print(f"us['musescoreDirectPNGPath'] = '{correct_path}'")
        print("---")
        return False
    return True

def abc_to_png(abc_file):
    """
    Converts an ABC notation file to a PNG image.

    Args:
        abc_file (str): The path to the input ABC file.
    """
    if not os.path.exists(abc_file):
        print(f"Error: File not found at {abc_file}")
        return

    if not check_musescore():
        sys.exit(1)

    file_name = os.path.splitext(os.path.basename(abc_file))[0]
    output_dir = "out"
    
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    output_filepath = os.path.join(output_dir, file_name + '.png')

    try:
        score = converter.parse(abc_file)
        # The .write('musicxml.png') method will invoke MuseScore
        output_path = score.write('musicxml.png', fp=output_filepath)
        print(f"Bitmap created at: {output_path}")
    except Exception as e:
        print(f"An error occurred during conversion: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python convert.py <path_to_abc_file>")
        sys.exit(1)
    
    abc_file_path = sys.argv[1]
    abc_to_png(abc_file_path)
