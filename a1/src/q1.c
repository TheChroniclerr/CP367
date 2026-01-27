/*
 * q1.c
 *
 * Created on: 2026-01-26
 */
#include <stdio.h>

int sum_of_factors(int n) {
    int sum = 0;

    for (int i = 1; i <= n; i++) {
        if (n % i == 0) {
            sum += i;
        }
    }

    return sum;
}

int main() {
    int num;

    do {
        printf("Enter a positive number: ");
        scanf("%d", &num);
    } while (num <= 0);

    printf("Sum of factors of %d is %d\n", num, sum_of_factors(num));

    return 0;
}