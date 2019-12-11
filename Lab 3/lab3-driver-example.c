#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

#define MAX_NAME_LENGTH 32
#define COUNT 3

typedef struct _BUSINESS {
	uint32_t taxId;  // 0
	char name[MAX_NAME_LENGTH + 1]; // 33 //4
	uint32_t addNo; // 4 // 40
	char direction;  // 1 // 44
	char street[MAX_NAME_LENGTH + 1]; // 33 //45
	char city[MAX_NAME_LENGTH + 1];  // 33  //78
	char state[2 + 1]; // 3
	uint32_t zip; // 4
} BUSINESS;

extern void sortDecendingInPlace (int32_t x[], uint32_t count);
extern float sumF32(float x[], uint32_t count);
extern double prodF64(double x[], uint32_t count);
extern double dotpF64(double x[], double y[], uint32_t count);
extern float maxF32(float x[], uint32_t count);
extern double absSumF64 (double x[], uint32_t count);
extern double sqrtSumF64(double x[], uint32_t count);
extern double geoMean(double x[], uint32_t count);
extern char getDirection (BUSINESS business[], uint32_t index);
extern uint32_t getAddNo (BUSINESS business[], uint32_t index);
extern char * getCity(BUSINESS business[], uint32_t index);

int main(void) {
	BUSINESS business[COUNT] = {
	        {12342332, "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRV", 201, 'W', "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRV", "Arlington", "TX", 76011},
	        {18091123, "Kroger", 945, 'W', "Lamar Blvd", "Dallas", "TX", 76012},
	        {81927322, "Round1", 3811, 'S', "Cooper St", "Irving", "TX", 76015} 
	};
	
	int32_t i32Array [7] = {3, -1, 2, -4, 10, 2, 0};
	float fArray [7] = {2.2, 1.2, 3.2, 1.2, 10.2, -3.1, 8.125};
	double dArray [6] = {2.1, 1.1, 3.1, 2.5, -1.025, -0.002345};
	double dArray_y[6] = {3.1, 4.1, 5.1, -1.025, 2.2412, -3.0341};
	
	printf("Question 1, sortDecendingInPlace: Correct answer = 3  2  -1\n");
	
	sortDecendingInPlace(i32Array, COUNT);
	uint32_t i = 0;
	
	printf("Question 1, sortDecendingInPlace: Student Answer = ");
	for(i = 0; i < COUNT; i++) {
			printf("%d  ", i32Array[i]);
	}

	printf("\n\n");

	printf("Question 1, sortDecendingInPlace: Correct answer = 10  3  2  2  0  -1  -4\n");
	
	sortDecendingInPlace(i32Array, 7);

	printf("Question 1, sortDecendingInPlace: Student Answer = ");
	for(i = 0; i < 7; i++) {
			printf("%d  ", i32Array[i]);
	}
	printf("\n\n");
	
	printf("Question 2, sumF32: Correct answer = 6.6\n");
	printf("Question 2, sumF32: Student answer = %.1f\n\n", sumF32(fArray, COUNT));
	
	printf("Question 2, sumF32: Correct answer = 23.025\n");
	printf("Question 2, sumF32: Student answer = %.3f\n\n", sumF32(fArray, 7));
	
	printf("Question 3, prodF64: Correct answer = 7.161\n");
	printf("Question 3, prodF64: Student answer = %.3lf\n\n", prodF64(dArray, COUNT));
	
	printf("Question 3, prodF64: Correct answer = -18.350\n");
	printf("Question 3, prodF64: Student answer = %.3lf\n\n", prodF64(dArray, 5));

	printf("Question 3, prodF64: Correct answer = 0.043\n");
	printf("Question 3, prodF64: Student answer = %.3lf\n\n", prodF64(dArray, 6));
	
	printf("Question 4, dotpF64: Correct answer = 26.83\n");
	printf("Question 4, dotpF64: Student answer = %.2lf\n\n", dotpF64(dArray, dArray_y, COUNT));

	printf("Question 4, dotpF64: Correct answer = 21.98\n");
	printf("Question 4, dotpF64: Student answer = %.2lf\n\n", dotpF64(dArray, dArray_y, 6));
	
	printf("Question 5, maxF32: Correct answer = 3.2\n");
	printf("Question 5, maxF32: Student answer = %.1f\n\n", maxF32(fArray, COUNT));

	printf("Question 5, maxF32: Correct answer = 3.2\n");
	printf("Question 5, maxF32: Student answer = %.1f\n\n", maxF32(fArray, 4));

	printf("Question 5, maxF32: Correct answer = 10.2\n");
	printf("Question 5, maxF32: Student answer = %.1f\n\n", maxF32(fArray, 7));
	
	dArray[0] = -8.1;
	
	printf("Question 6, absSumF64: Correct answer = 3.9\n");
	printf("Question 6, absSumF64: Student answer = %.1lf\n\n", absSumF64(dArray, COUNT));
	
	dArray[0] = 2.1;
	
	printf("Question 7, sqrtSumF64: Correct answer = 2.510\n");
	printf("Question 7, sqrtSumF64: Student answer = %.3lf\n\n", sqrtSumF64(dArray, COUNT));

	printf("Question 7, sqrtSumF64: Correct answer = 2.510\n");
	printf("Question 7, sqrtSumF64: Student answer = %.3lf\n\n", sqrtSumF64(dArray, COUNT));

	printf("Question 8, geoMean: Correct answer = 1.927\n");
	printf("Question 8, geoMean: Student answer = %.3lf\n\n", geoMean(dArray, COUNT));
	
	printf("Question 8, geoMean: Correct answer = 1.927\n");
	printf("Question 8, geoMean: Student answer = %.3lf\n\n", geoMean(dArray, COUNT));

	printf("Size of business %d\n", sizeof(business[0].taxId));

	printf("Question 9, getDirection: Correct answer = W\n");
	printf("Question 9, getDirection: Student answer = %c\n\n", getDirection(business, 0));

	printf("Question 9, getDirection: Correct answer = S\n");
	printf("Question 9, getDirection: Student answer = %c\n\n", getDirection(business, 2));
	
	printf("Question 10, getAddNo: Correct answer = 945\n");
	printf("Question 10, getAddNo: Student answer = %u\n\n", getAddNo(business, 1));
	
	printf("Question 11, getCity: Correct answer = Irving\n");
	printf("Question 11, getCity: Student answer = %s\n", getCity(business, 2));

}
