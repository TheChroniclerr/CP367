1. Create a shell script doing the following (call it `task1` ):

    - Greets the user (display the user's login)
    - Ask the user to enter a command
    - Execute the command and redirect the output to the file `output.txt` file and errors to the file `errors.txt`.
    - Prints out the content of the output file and the error file specifying which one is output and which one is error.
```shell
#!/bin/sh
echo "Hello, $USER!"
echo "Please enter a command: "
read cmd

$cmd > output.txt 2> errors.txt

echo "----- OUTPUT -----"
cat output.txt

echo "----- ERRORS -----"
cat errors.txt
```

2. Create a shell script for submitting your homework (call it `submit` ):

    - Give `submit` two arguments:
        - the first argument is the name of the submission directory (use `/tmp`)
        - the second is the name of the file you are submitting
    - Change to the submission directory
    - Create a directory with your username as its name
    - Copy the submission file from your home directory into the directory you just created
    - Print out the list of the files in the directory you just created.
```shell
#!/bin/sh
if [ $# -ne 2 ]; then
    echo "Usage: submit <submission_directory> <filename>"
    exit 1
fi

SUBMIT_DIR="$1"
FILE_NAME="$2"

cd "$SUBMIT_DIR" || {
    echo "Error: Cannot change to directory $SUBMIT_DIR"
    exit 1
}

mkdir -p "$USER"

cp "$OLDPWD/$FILE_NAME" "$USER/" || {
    echo "Error: File $FILE_NAME does not exist"
    exit 1
}

echo "File submitted in $SUBMIT_DIR/$USER:"
ls -l "$USER"
```