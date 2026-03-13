#!/bin/bash
#-------------------------
# File: text_to_array.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-03-12
#-------------------------

# Check if filename is provided
if [ $# -lt 1 ]; then
    echo "Usage: ./text_to_array.sh <filename>"
    exit 1
fi

# Check if file exists
filename="$1"
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Read file character by character
words=($(tr -d '.,?!;:\'"'"'()[]' < "$filename"))

# Add last word if any
if [ -n "$word" ]; then
    words+=("$word")
fi

# Print array elements, one per line
echo "Array elements:"
for w in "${words[@]}"; do
    echo "$w"
done