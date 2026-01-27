#include <stdio.h>
#include <string.h>

#define MAX_STUDENTS 50
#define MAX_NAME 50

struct Student {
    int ID;
    char Name[MAX_NAME];
    float GPA;
};

/* Reads CSV into struct array */
int csv_to_struct(FILE *fp, struct Student s[]) {
    int count = 0;

    if (fp == NULL) {
        printf("Error opening file.\n");
        return 0;
    }

    while (fscanf(fp, "%d,%49[^,],%f",
    &s[count].ID, s[count].Name, &s[count].GPA) == 3) {
        count++;
        if (count >= MAX_STUDENTS) { break; }
    }

    return count;
}

/* Writes struct array to CSV */
int struct_to_csv(struct Student s[], FILE *fp, int count) {
    if (fp == NULL) {
        printf("Error opening file.\n");
        return 0;
    }

    for (int i = 0; i < count; i++) {
        fprintf(fp, "%d,%s,%.2f\n",
            s[i].ID, s[i].Name, s[i].GPA
        );
    }

    return count;
}

/* Creates student records */
int create_structs(struct Student s[]) {
    int count;

    printf("How many students? ");
    scanf("%d", &count);

    for (int i = 0; i < count; i++) {
        printf("\nStudent %d\n", i + 1);

        printf("ID: ");
        scanf("%d", &s[i].ID);

        printf("Name: ");
        scanf(" %49[^\n]", s[i].Name);

        printf("GPA: ");
        scanf("%f", &s[i].GPA);
    }

    return count;
}

/* Displays student records */
void display_structs(struct Student s[], int count) {
    for (int i = 0; i < count; i++) {
        printf("ID: %d, Name: %s, GPA: %.2f\n",
            s[i].ID, s[i].Name, s[i].GPA
        );
    }
}

int main(void) {
    struct Student s[MAX_STUDENTS];
    int count = 0;
    char command[20];
    char path[50] = "../assets/students.csv";
    FILE *fp;

    printf("Commands:\n");
    printf("File Path (relative): %s\n", path);
    printf("- create\n");
    printf("- display\n");
    printf("- cp\n");
    printf("- exit\n");

    while (1) {
        printf("> ");
        scanf(" %19s", command);

        if (strcmp(command, "display") == 0) {
            fp = fopen(path, "r");
            count = csv_to_struct(fp, s);
            if (fp) { fclose(fp); }

            display_structs(s, count);

        } else if (strcmp(command, "create") == 0) {
            count = create_structs(s);

            fp = fopen(path, "w");
            struct_to_csv(s, fp, count);
            fclose(fp);

        } else if (strcmp(command, "cp") == 0) {
            printf("Path to csv: "); 
            scanf("%49s", path);
            
            fp = fopen(path, "r");
            if (fp == NULL) {
                printf("file not found.\n");
            } else {
                fclose(fp);
            }

        } else if (strcmp(command, "exit") == 0) {
            break;

        } else {
            printf("Unknown command.\n");
        }
    }

    return 0;
}
