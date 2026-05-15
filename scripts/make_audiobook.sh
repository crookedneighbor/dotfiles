#!/bin/bash

# Configuration
INPUT_DIR="${1:-.}"
FORMAT="${2:-m4b}"   # Output format: m4b (default) or mp3
FILE_EXT="mp3"       # Change to m4a, m4b, etc. if needed
OUTPUT_FILE="audiobook.${FORMAT}"
FILELIST="filelist.txt"
TEMP_FILE="temp_combined.${FORMAT}"

case "$FORMAT" in
    mp3)
        AUDIO_CODEC="libmp3lame"
        AUDIO_BITRATE="128k"
        ;;
    m4b|m4a)
        AUDIO_CODEC="aac"
        AUDIO_BITRATE="64k"
        ;;
    *)
        echo "Error: Unsupported format '${FORMAT}'. Use mp3 or m4b."
        exit 1
        ;;
esac

export INPUT_DIR FILE_EXT FILELIST

# Step 1: Generate sorted file list
echo "Collecting files..."
python3 << 'PYEOF'
import glob, os

input_dir = os.environ['INPUT_DIR']
file_ext = os.environ['FILE_EXT']
filelist = os.environ['FILELIST']

files = sorted(glob.glob(os.path.join(input_dir, '**', '*.' + file_ext), recursive=True))
if not files:
    files = sorted(glob.glob(os.path.join(input_dir, '*.' + file_ext)))

with open(filelist, 'w') as f:
    for fn in files:
        path = os.path.abspath(fn)
        escaped = path.replace("'", "'\\''")
        f.write("file '" + escaped + "'\n")
print('Found {} files'.format(len(files)))
PYEOF

# Check we found some files
if [ ! -s "$FILELIST" ]; then
    echo "Error: No .${FILE_EXT} files found in ${INPUT_DIR}"
    exit 1
fi

# Step 2: Get the first file for metadata
FIRST_FILE=$(python3 << 'PYEOF'
import glob, os

input_dir = os.environ['INPUT_DIR']
file_ext = os.environ['FILE_EXT']

files = sorted(glob.glob(os.path.join(input_dir, '**', '*.' + file_ext), recursive=True))
if not files:
    files = sorted(glob.glob(os.path.join(input_dir, '*.' + file_ext)))
print(files[0])
PYEOF
)
echo "Pulling metadata from: $FIRST_FILE"

# Step 3: Combine all files
echo "Combining files..."
ffmpeg -f concat -safe 0 -i "$FILELIST" -c:a "$AUDIO_CODEC" -b:a "$AUDIO_BITRATE" "$TEMP_FILE"

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
