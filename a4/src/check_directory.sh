#!/bin/bash
#-------------------------
# File: check_directory.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-03-12
#-------------------------

# Check if filename is provided
if [ -z "$1" ]; then
    echo "Usage: ./check_directory.sh <directory> [extension]"
    exit 1
fi

# Check if file exists
dir=$1
ext=$2
if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' does not exist."
    exit 1
fi

# Read files in directory
if [ -z "$ext" ]; then
    count=$(find "$dir" -maxdepth 1 -type f | wc -l)
else
    count=$(find "$dir" -maxdepth 1 -type f -name "*.${ext}" | wc -l)
fi

echo "Number of regular files in directory '$dir': $count"