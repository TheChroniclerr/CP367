/*
 * q3.c
 *
 * Created on: 2026-01-27
 */
#include <stdio.h>
#include <string.h>

#define MAX_STUDENTS 50
#define MAX_NAME 50

/* Read user inputs, write to csv */
void read_to_csv(FILE *fp) {
    int count;
    char name[MAX_NAME];
    float mark;

    if (fp == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("Name: ");
    scanf(" %49[^\n]", name);
    fprintf(fp, "%s", name);

    printf("How many marks? ");
    scanf("%d", &count);

    for (int i = 0; i < count; i++) {
        printf("GPA #%d: ", i + 1);
        scanf("%f", &mark);
        fprintf(fp, ",%.2f", mark);
    }

    fprintf(fp, "\n");
}

/* Displays csv records */
void display_csv(FILE *fp) {
    char line[256];

    if (fp == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(line, sizeof(line), fp)) {
        printf("%s", line);
    }
}

/* Displays menu strings */
void display_menu(char path[]) {
    printf("Commands:\n");
    printf("File Path (relative): %s\n", path);
    printf("- menu\n");
    printf("- create\n");
    printf("- display\n");
    printf("- cp\n");
    printf("- exit\n");
}

int main(void) {
    int count = 0;
    char command[20];
    char path[50] = "../assets/students_q4.csv";
    FILE *fp;

    display_menu(path);

    while (1) {
        printf("> ");
        scanf(" %19s", command);

        if (strcmp(command, "display") == 0) {
            fp = fopen(path, "r");
            display_csv(fp);
            if (fp) { fclose(fp); }

        } else if (strcmp(command, "create") == 0) {
            fp = fopen(path, "w");
            read_to_csv(fp);
            if (fp) { fclose(fp); }

        } else if (strcmp(command, "cp") == 0) {
            printf("Path to csv: "); 
            scanf("%49s", path);
            
            fp = fopen(path, "r");
            if (fp == NULL) {
                printf("file not found.\n");
            } else {
                fclose(fp);
            }

        } else if (strcmp(command, "menu") == 0) {
            display_menu(path);
            
        } else if (strcmp(command, "exit") == 0) {
            break;

        } else {
            printf("Unknown command.\n");
        }
    }

    return 0;
}
