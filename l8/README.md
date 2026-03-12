1. Set up a small script calculator to ask the user for two numbers and add them together.
```bash
#!/bin/bash
read -p "x = " x
read -p "y = " y
echo "$x + $y = $((x + y))"
```

2. Create a second version of your calculator to ask the user what operation to perform in `+`, `-`, `*`, `/`, and `%`.
```bash
#!/bin/bash
read -p "x = " x
read -p "y = " y
read -p "operator: " opr

# t4
if [ "$1" = "-s" ]
then
    outfile=$2
fi

case $opr in
    +) result=$((x + y)) ;;
    -) result=$((x - y)) ;;
    \*) result=$((x * y)) ;;
    /) result=$((x / y)) ;;
    %) result=$((x % y)) ;;
    *) echo "Invalid operation"; exit 1 ;;
esac

if [ -n "$outfile" ]
then
    echo "$x $opr $y = $result" >> "$outfile"
fi

echo "$x $opr $y = $result"
```

3. Create a third version of your calculator to loop until the user wants to stop.
```bash
#!/bin/bash
KEY=""
while [ "$KEY" != "*" ]
do
    ./t2 $1 $2
    read -p "Return any key to continue, or * to exit. " KEY
done
```

4. Create a fourth version of your calculator to store the inputs, operations, and outputs to a file (like a cash register tape).
```bash
#!/bin/bash
./t3 -s ../outputs/log.txt
```