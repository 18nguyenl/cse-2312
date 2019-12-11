#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

extern int32_t add4(int32_t x, int32_t y, int32_t z, int32_t w);

int main(void) {

	uint32_t a, b, c, d, e;
	a = 100;
	b = -200;
	c = 300;
	d = 150;

	e = add4(a, b, c, d);

	printf("c = %d\n", e);

	return EXIT_SUCCESS;

}
