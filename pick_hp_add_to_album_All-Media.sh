#!/bin/bash

# Run the first shell script
echo "Running first shell script..."
./get_uuid_All-Media.sh

# Run the AppleScript
echo "Running AppleScript..."
osascript ./createAlbumAddPhoto.scpt

echo "Both scripts executed."