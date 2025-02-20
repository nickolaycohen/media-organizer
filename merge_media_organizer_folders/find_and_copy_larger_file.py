import os
import hashlib
import shutil
import argparse
import remove_brackets as rb

def find_and_copy_larger_file(folder1, folder2, destination):
    # TODO: scan the whole Media Organizer folder; locate subfolders and copy intersecting files to Merge folder
    print(folder1)
    if os.path.isdir(folder2):
        rb.remove_brackets(folder1)
        rb.remove_brackets(folder2)
        files_folder1 = {os.path.splitext(f)[0]: (f, os.path.splitext(f)[1]) for f in os.listdir(folder1)}
        files_folder2 = {os.path.splitext(f)[0]: (f, os.path.splitext(f)[1]) for f in os.listdir(folder2)}
        
        matching_names = set(files_folder1.keys()).intersection(set(files_folder2.keys()))
        
        if not os.path.exists(destination):
            os.makedirs(destination)
        
        if matching_names:
            print("Matching filenames found:")
            for name in matching_names:
                file1_name, ext1 = files_folder1[name]
                file2_name, ext2 = files_folder2[name]
                ext1 = ext1[1:]
                ext2 = ext2[1:]

                file1_path = os.path.join(folder1, file1_name)
                file2_path = os.path.join(folder2, file2_name)
                
                # Prefer HEIC over any other format
                if ext1.lower() == "heic" and ext2.lower() != "heic":
                    preferred_file = file1_path
                elif ext2.lower() == "heic" and ext1.lower() != "heic":
                    preferred_file = file2_path
                else:
                    preferred_file = file1_path if os.path.getsize(file1_path) >= os.path.getsize(file2_path) else file2_path
                
                destination_path = os.path.join(destination, os.path.basename(preferred_file))
                
                shutil.copy2(preferred_file, destination_path)
                print(f"Copied preferred file: {os.path.basename(preferred_file)} to {destination}")
                print(f"File 1: {file1_name} (.{ext1})")
                print(f"File 2: {file2_name} (.{ext2})")    
        else:
            print("No matching filenames found.")
    else:
        print('WARNING - missing_folder:', folder2, ' does not exists')
        return folder2


# Run the function to find files with the same name and copy the larger one


# Sample run
# python3 find_and_copy_larger_file.py --dateFolder 2010-10-23

# https://chatgpt.com/c/67a15981-ec74-8004-a8c3-f34626478ac5

if __name__ == '__main__':
    # Example usage
    # dateFolder = "2010-10-23"
    parser = argparse.ArgumentParser(description="Example script to accept CLI parameters")
    parser.add_argument("--dateFolder", type=str, help="Parameter for date folders")
    args = parser.parse_args()
    print(args.dateFolder)

    folder1 = "/Volumes/LaCie/Media Organizer/Apple Photos/02-High Rated Events Dedupped/" + args.dateFolder 
    folder2 = "/Volumes/LaCie/Media Organizer/Google Photos/02-EventsHighlights/" + args.dateFolder
    destination = "/Volumes/LaCie/Media Organizer/Merged/" + args.dateFolder # Set if moving duplicates

    find_and_copy_larger_file(folder1, folder2, destination)