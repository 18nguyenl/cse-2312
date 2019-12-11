#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern void uint32ToBinary(char str[], uint32_t x);
extern void int32ToBinary(char str[], int32_t x);
extern void uint8ToBinaryString(char str[], uint8_t x);
extern void int16ToBinaryString(char str[], int16_t x);

int main(void) {

	uint32_t x;
	int32_t y;
	char str[33];

	printf("Input unsigned int: ");
	scanf("%u", &x);

	uint32ToBinary(str, x);

	printf("%d = %s\n", x, str);

	printf("Input signed int: ");
	scanf("%d", &y);

	int32ToBinary(str, y);

	printf("%d = %s\n", y, str);

	char toBin8[33];
	uint8_t q7 = 10;
	uint8ToBinaryString(toBin8, q7);
	
	printf("Question 7, uint8ToBinaryString: Correct Answer = 00001010\n");
	printf("Question 7, uint8ToBinaryString: Student Answer = %s\n\n", toBin8);

	return EXIT_SUCCESS;
}
