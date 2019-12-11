#include <stdio.h>
#include <stdint.h>

extern uint32_t strlen(const char str[]);
extern char* strcat(char dest[], char src[]);

#define MAX_CHARS 80

int main()
{
    char str1[2*MAX_CHARS+1];
    char str2[MAX_CHARS+1];
    printf("Enter string 1: ");
    scanf("%s", &str1);
    printf("Enter string 2: ");
    scanf("%s", &str2);
    printf("Length of str1: %u\r\n", strlen(str1));  
    printf("Length of str2: %u\r\n", strlen(str2));  
    printf("Concatenated string: %s\r\n", strcat(str1, str2));  

    return 0;
}
