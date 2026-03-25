Add the following numbers to a file nums.txt and use it for testing for the tasks.
```txt
5
3
7
31
1
9
4
12
27
```
1. Write a script function funcsort that takes a filename as an argument and outputs the contents of the file in sorted order.

2. Improve the above script to allow the use of a -n argument that sorts the contents of the file in numeric order.

3. Improve the script again to check the arguments. The script allows one or two arguments: if there is one argument only, it is a filename. If there are two arguments, the first argument must be -n and the second a filename. Inform the user if they use an invalid argument. Set appropriate exit codes. Your script must use a function to check the file validity.

4. Improve the script once again to check the file argument. Inform the user if the file does not exist, is not a normal file, or cannot be read. Allow the user to enter a third argument that is the output file to write to. Thus your script must be able to correctly handle the following tests:

    - `./funcsort nums.txt`
    - `./funcsort -n nums.txt`
    - `./funcsort nums.txt out.txt`
    - `./funcsort -n nums.txt out.txt`

    and any errors in the input file or the argument count.

**Solution**
```shell
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
```