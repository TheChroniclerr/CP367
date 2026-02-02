# Tasks
We will briefly use emacs to create the following file. Enter this C code into the file ctest.c :

```c
ctest.c
/*
 * ctest.c
 *
 *  Created on: 2024-01-03
 */
#include <stdio.h>

int main() {
    char letter;
    for (letter = 'A'; letter <= 'z'; letter++) {
        printf("%c\n", letter);
    }
    return 0;
}
```

Exit `emacs` , and at the prompt compile this file using the gcc compiler by entering the following command at the prompt:

```bash
gcc -g -o ctest ctest.c
```

If it compiles without error, run the file by typing the following command at the prompt:

```bash
./ctest
```