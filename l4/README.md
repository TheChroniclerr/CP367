## 1.
Create a file `in1.txt` containing the numbers:
```txt
1
2
3
4
4
5
6
6
6
7
```
and a file `in2.txt` containing the numbers:
```txt
3
4
9
9
9
12
```
Issue a `one-line` command that concatenates the contents of the two files into the file `output.txt`. The numbers in the new file must be in numeric order with duplicates removed.

**Simple Command**\
Simpler, more Unix (terminal) compatible. However, not a perfect `one-liner`.
```bash
(
echo 1
echo 2
echo 3
echo 4
echo 4
echo 5
echo 6
echo 6
echo 6
echo 7
) > in1.txt & (
echo 3
echo 4
echo 9
echo 9
echo 9
echo 12
) > in2.txt & cat in1.txt in2.txt | sort -n | uniq > output.txt
```

**Advanced Command**\
Linux style. One-liner.
```bash
printf "1\n2\n3\n4\n4\n5\n6\n6\n6\n7\n" > in1.txt && printf "3\n4\n9\n9\n9\n12\n" > in2.txt && sort -nu in1.txt in2.txt > output.txt
```

## 2. Generate and append at least three different error messages to a file named `errors.txt`.

**Command**
```bash
cat DNE.txt 2>> errors.txt; ls /root 2>> errors.txt; fakecmd 2>> errors.txt
```

## 3. Issue a one line command that lists only the files or directories in your hopper workspace that have `rwx` as one of their permissions.

**Command**
```bash
ls -la | grep "rwx" > perms.txt
```