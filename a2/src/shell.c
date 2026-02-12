/*
 * File: shell.c
 * Author: Hubert Bao
 * Student ID: 169077248
 * Date: 2026-02-11
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define MAX_LINE 1024
#define MAX_ARGS 100

int main() {
    char line[MAX_LINE];
    char *args[MAX_ARGS];

    while (1) {
        printf("myshell> ");
        fflush(stdout);  // ensure prompt prints immediately

        // Read input
        if (fgets(line, sizeof(line), stdin) == NULL) {
            break;  // EOF (Ctrl+D)
        }

        // Remove trailing newline
        line[strcspn(line, "\n")] = '\0';

        // If empty input, show prompt again
        if (strlen(line) == 0) {
            continue;
        }

        // Exit condition
        if (strcmp(line, "q") == 0) {
            break;
        }

        // Parse input into arguments
        int i = 0;
        char *token = strtok(line, " ");

        while (token != NULL && i < MAX_ARGS - 1) {
            args[i++] = token;
            token = strtok(NULL, " ");
        }
        args[i] = NULL;  // execvp requires NULL-terminated array

        // Fork a child
        pid_t pid = fork();

        if (pid < 0) {
            perror("fork failed");
            continue;
        }

        if (pid == 0) {
            // Child process
            if (execvp(args[0], args) == -1) {
                perror("execvp failed");
                exit(EXIT_FAILURE);
            }
        } else {
            // Parent process
            wait(NULL);
        }
    }

    return 0;
}
