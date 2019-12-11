#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

extern int32_t multiply(int32_t x, int32_t y);

int main(void) {

	int32_t a, b, c;

	printf("Input multiplicand: ");
	scanf("%d", &a);
	printf("Input multiplier: ");
	scanf("%d", &b);

	c = multiply(a, b);

	printf("Result = %d\n", c);

	return EXIT_SUCCESS;
}
