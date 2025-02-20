from pathlib import Path
import subprocess
import find_and_copy_larger_file as lf

def main():

    # Replace with the path to your parent directory
    base_dir = Path("/Volumes/LaCie/Media Organizer/Apple Photos/02-High Rated Events Dedupped/")
    
    # Optionally change the working directory to the base_dir
    # so that relative subfolder names are usable
    import os
    os.chdir(base_dir)
    missing_folders = set()
    # Iterate through items in the directory
    for subfolder in base_dir.iterdir():
        if subfolder.is_dir():
            print(f"Processing folder: {subfolder.name}")
            # Call the other script, passing just the subfolder name
            folder1 = "/Volumes/LaCie/Media Organizer/Apple Photos/02-High Rated Events Dedupped/" + subfolder.name 
            folder2 = "/Volumes/LaCie/Media Organizer/Google Photos/02-EventsHighlights/" + subfolder.name
            destination = "/Volumes/LaCie/Media Organizer/Merged/" + subfolder.name # Set if moving duplicates

            res = lf.find_and_copy_larger_file(folder1, folder2, destination)
            print('res:', res)
            if res != None:
                missing_folders.add(res)
    print('Missing folders: ', missing_folders)

if __name__ == '__main__':
    main()

# Usage >python3 merge_all_media_organizer_folders.py