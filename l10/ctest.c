/*
 * ctest.c
 *
 *  Created on: 2011-01-03
 *  Author: David Brown
*/
#include <stdio.h>

int main() {
    char letter;
    
    for (letter = 'A'; letter <= 'z'; letter++) {
        printf("%c\n", letter);
    }
    return 0;
}