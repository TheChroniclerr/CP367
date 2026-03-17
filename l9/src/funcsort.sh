#!/bin/sh

# Function: check if file is valid
check_file() {
    if [ ! -e "$1" ]; then
        echo "Error: File does not exist"
        exit 1
    elif [ ! -f "$1" ]; then
        echo "Error: Not a regular file"
        exit 2
    elif [ ! -r "$1" ]; then
        echo "Error: File is not readable"
        exit 3
    fi
}

# Default values
NUMERIC=false

# Argument handling
if [ $# -eq 1 ]; then
    FILE="$1"

elif [ $# -eq 2 ]; then
    if [ "$1" = "-n" ]; then
        NUMERIC=true
        FILE="$2"
    else
        FILE="$1"
        OUTFILE="$2"
    fi

elif [ $# -eq 3 ]; then
    if [ "$1" = "-n" ]; then
        NUMERIC=true
        FILE="$2"
        OUTFILE="$3"
    else
        echo "Error: Invalid option"
        exit 4
    fi

else
    echo "Usage:"
    echo "./funcsort [-n] inputfile [outputfile]"
    exit 5
fi

# Validate file
check_file "$FILE"

# Perform sorting
if [ "$NUMERIC" = true ]; then
    RESULT=$(sort -n "$FILE")
else
    RESULT=$(sort "$FILE")
fi

# Output handling
if [ -n "$OUTFILE" ]; then
    echo "$RESULT" > "$OUTFILE"
else
    echo "$RESULT"
fi

exit 0