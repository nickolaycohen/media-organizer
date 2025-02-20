#!/bin/bash

# Run the first shell script
echo "Running first shell script..."
/Users/nickolaycohen/dev/media-organizer/get_uuid_Test.sh

# Run the AppleScript
echo "Running AppleScript..."
osascript /Users/nickolaycohen/dev/media-organizer/createAlbumAddPhoto.scpt

echo "Both scripts executed."