/*
 * File: word_count.c
 * Author: Hubert Bao
 * Student ID: 169077248
 * Date: 2026-02-11
 */

 #include <stdio.h>
 #include <stdlib.h>
 #include <ctype.h>
 #include <string.h>

 int main(void) {
    char input[100];
    char filename[256];

    printf("This program counts the number of lines and words of a file.\n");

    while (1) {
        printf("\nEnter f for entering file name, q to quit: ");
        if (fgets(input, sizeof(input), stdin) == NULL) {
            printf("Invalid input\n");
            continue;
        }

        // Remove newline if present
        input[strcspn(input, "\n")] = '\0';

        if (strcmp(input, "q") == 0) {
            printf("Good bye\n");
            break;

        } else if (strcmp(input, "f") == 0) {
            printf("Enter file name: ");
            if (fgets(filename, sizeof(filename), stdin) == NULL) {
                printf("Invalid file name\n");
                continue;
            }

            filename[strcspn(filename, "\n")] = '\0';

            FILE *fp = fopen(filename, "r");
            if (fp == NULL) {
                printf("\n%s cannot be opened\n", filename);
                continue;
            }

            printf("Content of %s: \n\n", filename);
            int ch;
            int lines = 0, words = 0, in_word =0, last_char = 0;

            while ((ch = fgetc(fp)) != EOF) {
                putchar(ch);
                last_char = ch;

                if (ch == '\n') {
                    lines++;
                }

                if (isspace(ch)) {
                    if (in_word) {
                        words++;
                        in_word = 0;
                    }
                } else {
                    in_word = 1;
                }
            }
            
            if (in_word) {
                words++;
            }
            
            if (last_char != '\n' && last_char != 0) {
                lines++;
            }

            fclose(fp);

            double average = 0.0;
            if (lines > 0) {
                average = (double)words / lines;
            }

            printf("\n\n");
            printf("Number of lines of %s: %d\n", filename, lines);
            printf("Number of words of %s: %d\n", filename, words);
            printf("average number of words per line of %s: %.2f\n", filename, average);
            
        } else {
            printf("Invalid command\n");
        }
    }

    return 0;
 }