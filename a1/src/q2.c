/*
 * File: q2.c
 * Author: Hubert Bao
 * Student ID: 169077248
 * Date: 2026-01-26
 */
#include <stdio.h>

int main() {
    int arr[] = {1, 2, 3, 4};
    int size = sizeof(arr) / sizeof(int);
    
    int* ptr = arr;
    int sum = 0;

    for (int i = 0; i < size; i++) {
        printf("%d\n", *(ptr + i));
        sum += *(ptr + i);
    }

    printf("Sum = %d\n", sum);

    return 0;
}