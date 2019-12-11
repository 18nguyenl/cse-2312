#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

extern int32_t add32(int32_t x, int32_t y);

int main(void) {

	uint32_t a, b, c;
	a = 100;
	b = -200;

	c = add32(a, b);

	printf("c = %d\n", c);

	return EXIT_SUCCESS;

}
