#!/bin/bash

# Configuration
INPUT_DIR="."        # Change this to your audiobook folder if needed
FILE_EXT="mp3"       # Change to m4a, m4b, etc. if needed
OUTPUT_FILE="audiobook.m4b"
FILELIST="filelist.txt"
TEMP_FILE="temp_combined.m4b"

# Step 1: Generate sorted file list
echo "Collecting files..."
python3 -c "
import glob, os
files = sorted(glob.glob('${INPUT_DIR}/**/*.${FILE_EXT}', recursive=True))
if not files:
    files = sorted(glob.glob('${INPUT_DIR}/*.${FILE_EXT}'))
with open('${FILELIST}', 'w') as f:
    for fn in files:
        f.write(f\"file '{os.path.abspath(fn)}'\n\")
print(f'Found {len(files)} files')
"

# Check we found some files
if [ ! -s "$FILELIST" ]; then
    echo "Error: No .${FILE_EXT} files found in ${INPUT_DIR}"
    exit 1
fi

# Step 2: Get the first file for metadata
FIRST_FILE=$(python3 -c "
import glob
files = sorted(glob.glob('${INPUT_DIR}/**/*.${FILE_EXT}', recursive=True))
if not files:
    files = sorted(glob.glob('${INPUT_DIR}/*.${FILE_EXT}'))
print(files[0])
")
echo "Pulling metadata from: $FIRST_FILE"

# Step 3: Combine all files
echo "Combining files..."
ffmpeg -f concat -safe 0 -i "$FILELIST" -c:a aac -b:a 64k "$TEMP_FILE"

if [ $? -ne 0 ]; then
    echo "Error: ffmpeg failed during concatenation"
    rm -f "$FILELIST" "$TEMP_FILE"
    exit 1
fi

# Step 4: Apply metadata from first file, strip track/disc numbers
echo "Applying metadata..."
ffmpeg -i "$FIRST_FILE" -i "$TEMP_FILE" \
    -map 1:a \
    -map_metadata 0 \
    -metadata track="" \
    -metadata disc="" \
    -metadata genre="Audiobook" \
    -c copy "$OUTPUT_FILE"

if [ $? -ne 0 ]; then
    echo "Error: ffmpeg failed during metadata application"
    rm -f "$FILELIST" "$TEMP_FILE"
    exit 1
fi

# Cleanup
rm -f "$FILELIST" "$TEMP_FILE"
echo "Done! Output: $OUTPUT_FILE"
