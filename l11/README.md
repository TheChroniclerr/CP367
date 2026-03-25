Complete the following 4 exercises from the textbook (retyped here for your convenience):

1. Initialize a repository in git, add a file, and commit it on the master branch.
2. Start a new branch.
3. Switch to that branch and add commits to it. Switch to an older branch and then merge the new branch into your current branch.
4. Purposefully create and resolve a merge conflict.

**Submission Requirements**

Pipe the output after the merge conflict, and after the resolution into a text file. Please make sure that the textfile is formatted as follows:
```txt
CONFLICT:
[conflict output]
RESOLUTION:
[resolution output]
TREE: 
[git log --graph]
```

**Solution**
```shell
git checkout master
git merge <other_branch>

echo "CONFLICT:" > output.txt
git conflicted.txt >> output.txt

<resolving conflict...>

echo "RESOLUTION:" >> output.txt
git conflicted.txt >> output.txt

echo "TREE:" >> output.txt
git log --graph --oneline --all >> output.txt
```