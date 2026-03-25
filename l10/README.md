1. Start debugging `ctest.c` again. This time, put a breakpoint at the line:

    ```
    char letter;
    ```
    and examine its value before the line containing the `for` loop is executed.

    (Initializing variables when they are declared is a good idea - as is done in the next sample program.)

2. Enter and demonstrate to the Lab Instructor that you can debug the following program `heat.c` :

    **Sample Program**
    ```c
    /*
    * heat.c
    *
    *  Created on: 2011-01-08
    */
    #include <stdio.h>

    int main() {
    int height = 0; // height of a tree in feet
    int radius = 0; // radius of a tree in feet
    int requirement = 0; //cubic fee of wood to heat house for one day
    int volume = 0; // volume of the tree in cubic feet
    int days = 0; // number of days tree will heat house
    double PI = 3.1416; // value of pi
    // Input.
    printf("How tall is the tree (ft): ");
    scanf(" %d", &height);
    printf("Radius of the tree (ft): ");
    scanf(" %d", &radius);
    printf("Wood to heat house for one day (ft^3): ");
    scanf(" %d", &requirement);
    // Computations.
    volume = height * radius * radius * PI;
    days = volume / requirement;
    printf("Volume: %d ft^3\n", volume);
    printf("Days: %d\n", days);
    return 0;
    }
    ```

**Commmands**

Compile & Debug:
```sh
gcc -g -o ctest ctest.c
gdb ./ctest
```

gdb run & quit:
```sh
> run
> quit
```

gdb breakpoint:
```sh
> break ctest.c:<line_num>
```

gdb debugging:
```sh
> [n | next]
> [s | step]
> [c | continue]
```

gdp info:
```sh
> list                  # show file
> list [+ | -] <num>    # how previous/next <num> lines
> list <num>,<num>      # show lines <num> to <num>

> where                 # call stack
```