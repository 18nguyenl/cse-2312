#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

extern int64_t add64(int64_t x, int64_t y);

int main(void) {

	uint64_t a, b, c;
	a = 2000000000000;
	b = 1000000000000;

	c = add64(a, b);

	printf("c = %lld\n", c);

	return EXIT_SUCCESS;

}
