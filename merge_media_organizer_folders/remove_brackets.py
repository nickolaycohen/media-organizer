import os
import re
import argparse

def remove_brackets(directory):
    # Regex pattern to remove text inside parentheses or brackets
    pattern = r"\s*\(.*?\)"

    for filename in os.listdir(directory):
        new_filename = re.sub(pattern, "", filename)
        
        # Construct full paths
        old_path = os.path.join(directory, filename)
        new_path = os.path.join(directory, new_filename)
        
        # Rename file if the name has changed
        if filename != new_filename:
            os.rename(old_path, new_path)
            print(f'Renamed: {filename} -> {new_filename}')

    print("Cleanup completed!")
