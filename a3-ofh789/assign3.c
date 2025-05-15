#include <stdio.h>
#include <string.h>

typedef struct
{
        char course_Name[80];
        char course_Sched[4];
        unsigned course_Hours;
        unsigned course_Size;
        unsigned padding;
} COURSE;

void createCourse(FILE *file);
void updateCourse(FILE *file);
void readCourse(FILE *file);
void deleteCourse(FILE *file);

int main()
{
            FILE *file = fopen("dta/courses.dat", "rb+");
            if (file == NULL)
            {
                file = fopen("data/courses.dat", "wb+");
                if (file == NULL)
                {
                    perror("Failed to create courses.dat");
                    return 1;
                }                                                               
            }

            char button;

            while (1)
            {
                printf("Enter one of the following actions or press CTRL-D to exit:\n");
                printf("C: Create a course record\n");         
                printf("U: Update an existing course record\n");
                printf("R: Read an existing course record\n");
                printf("D: Delete an existing course record\n");

                if (scanf(" %c", &button) == EOF)
                {
                    break; 
                }

                switch (button)
                {
                    case 'C':
                    case 'c':
                        createCourse(file);
                        break;
                    case 'U':
                    case 'u':
                        updateCourse(file);
                        break;
                    case 'R':
                    case 'r':
                        readCourse(file);
                        break;
                    case 'D':
                    case 'd':
                        deleteCourse(file);
                        break;
                    default:
                        printf("ERROR: Invalid option\n");
                    }
                }
                    
            fclose(file);
            return 0;
}

void createCourse(FILE *file)
{
        COURSE newCourse;
        int courseNumber;

        printf("Enter course number: \n");
        scanf("%d", &courseNumber);

        // Check if the course already exists
        fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
        fread(&newCourse, sizeof(COURSE), 1, file);

        if(newCourse.course_Hours != 0){
            printf("ERROR: Course already exists\n");
        }
        else {

        // Read the rest of the course details
        printf("Enter course name: \n");
        scanf(" %[^\n]s", newCourse.course_Name);
        printf("Enter course schedule (MWF or TR): \n");
        scanf(" %3s", newCourse.course_Sched);
        printf("Enter course credit hours: \n");
        scanf("%u", &newCourse.course_Hours);
        printf("Enter course enrollment: \n");
        scanf("%u", &newCourse.course_Size);
        
        // Write the new course
        fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
        fwrite(&newCourse, sizeof(COURSE), 1, file);

        printf("Course record created successfully\n");
}
}
void updateCourse(FILE *file)
{
        COURSE updatedCourse;
        int courseNumber;

        // Read course number from the user
        printf("Enter course number: \n");
        scanf("%d", &courseNumber);

        // Find and read the existing course record
        fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
        fread(&updatedCourse, sizeof(COURSE), 1, file);
        if(updatedCourse.course_Hours == 0){
            printf("ERROR: Course not found\n");
        }
        else{
        printf("Enter course name: \n");
        scanf(" %[^\n]s", updatedCourse.course_Name);


        printf("Enter course schedule: \n");
        scanf(" %3s", updatedCourse.course_Sched);
        printf("Enter course credit hours: \n");
        scanf("%u", &updatedCourse.course_Hours);
        printf("Enter course enrollment: \n");
        scanf("%u", &updatedCourse.course_Size);
        
        
        // Write the updated course record back to the file
        fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
        fwrite(&updatedCourse, sizeof(COURSE), 1, file);
        
        printf("Course record updated successfully\n");
    }   
}
void readCourse(FILE *file)
{
        COURSE readCourse;
        int courseNumber;
        // Read course 
        printf("Enter course number: \n");
        scanf("%d", &courseNumber);
        
        fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
        fread(&readCourse, sizeof(COURSE), 1, file);
        if (readCourse.course_Hours == 0) {
            printf("ERROR: Course not found\n");
        }
        else { 
        // Print the course info
        printf("Course number: %d\n", courseNumber);
        printf("Course name: %s\n", readCourse.course_Name);
        printf("Scheduled days: %s\n", readCourse.course_Sched);
        printf("Credit hours: %u\n", readCourse.course_Hours);
        printf("Enrolled Students: %u\n", readCourse.course_Size);
    }
}
void deleteCourse(FILE *file)
{
        int courseNumber;
        // Read course number from the user
        printf("Enter course number: \n");
        scanf("%d", &courseNumber);
        
        // Find and read the existing course record
        COURSE deletedCourse;

        fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
        fread(&deletedCourse, sizeof(COURSE), 1, file);

        if (deletedCourse.course_Hours == 0){
            printf("ERROR: Course not found\n");
        } 
        else {
        deletedCourse.course_Hours = 0;
        
        fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
        fwrite(&deletedCourse, sizeof(COURSE), 1, file);
        
        printf("Course %d successfully deleted\n", courseNumber);
        }
}

