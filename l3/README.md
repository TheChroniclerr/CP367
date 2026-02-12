## Reference
https://bohr.wlu.ca/cp367/labs/l03_unix_2.php?d=2026-01-30T23:59:00Z#Topics

**`chmod` Options**
- `u`: The file owner
- `g`: The group
- `o`: All other users
- `a`: All of the above

**Add & Remove**
- `+`: Add permission
- `-`: Remove permission

**Examples**
<table border="1" cellpadding="6" cellspacing="0">
  <thead>
    <tr>
      <th>Command</th>
      <th>Result</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>chmod a=rx ctest.c</code></td>
      <td><code>r-xr-xr-x</code></td>
      <td>
        Changes the permissions on <code>ctest.c</code> to read and execute for everyone —
        write is turned off.
      </td>
    </tr>
    <tr>
      <td><code>chmod u+rwx,g+rx-w,o-rwx ctest.c</code></td>
      <td><code>rwxr-x---</code></td>
      <td>
        Changes the permissions on <code>ctest.c</code> to read, write, and execute for owner;
        read and execute for group; and no permissions for others.
      </td>
    </tr>
    <tr>
      <td><code>chmod -R u+rwx,g+rx-w,o= CP367</code></td>
      <td><code>rwxr-x---</code></td>
      <td>
        Changes the permissions on everything in the <code>CP367</code> directory —
        note that <code>=</code> without any follow-up characters removes all permissions.
      </td>
    </tr>
  </tbody>
</table>


## 1. Get a partner. Try to access one of your partner's directories using ls . What happens?

```bash
/home> cd [username]
-sh: cd: [username]: Permission denied
```
There is no permission because the default `rwx` permission is for owner only.

## 2. Both your and your partner change permissions on one of your existing directories. What do you have to do to allow your partner to see the contents of your directories, and visa-versa?

### Commands Permission Chart
<table border="1" cellpadding="6" cellspacing="0">
  <thead>
    <tr>
      <th>Permission</th>
      <th>Directory</th>
      <th>File</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>r</strong> (read)</td>
      <td><code>ls</code></td>
      <td><code>head</code>, view with <code>emacs</code>/<code>vim</code></td>
    </tr>
    <tr>
      <td><strong>w</strong> (write)</td>
      <td><code>touch</code>, <code>remove</code></td>
      <td><code>echo "smth" &gt; [filename]</code></td>
    </tr>
    <tr>
      <td><strong>x</strong> (execute)</td>
      <td><code>cd</code></td>
      <td><code>./[filename]</code> if it's code</td>
    </tr>
  </tbody>
</table>
```bash
cd home/[dir]
chmod g+rx .
```
We need `x` to enter the directory, and `r` to read the contents of the directory.

## 3. Both your and your partner change permissions on one of your existing directories. What do you have to do to allow your partner to create a file in one of your directories, and visa-versa?

```bash
cd home/[dir]
chmod g+w .
touch "[filename]"
```
By being able to edit directory file, you will be able to add/remove child files, which is defined by the directory links of the directory.

## 4. Attempt to delete a file that your partner created in your directory. How's that working for you?

```bash
rm [path]
rm: remove write-protected regular file ‘test.txt’? y
```
The deletion is successful because you can force file removal without permissions.