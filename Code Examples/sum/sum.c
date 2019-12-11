#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uint16_t sum(uint16_t x[], uint16_t count);

int main(void) {

	uint16_t count = 5;
	uint16_t result;
	uint16_t x[] = {5, 2, 3, 4, 5};

	result = sum(x, count);

	printf("Sum is: %u\n", result);

	return EXIT_SUCCESS;
}
