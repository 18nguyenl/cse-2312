#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

extern uint64_t add64(uint64_t x, uint64_t y); // returns x + y 
extern uint64_t sub64(uint64_t x, uint64_t y); // returns x - y 
extern uint16_t minU8(uint8_t x, uint8_t y); // returns the minimum of x, y  
extern int16_t minS8(int8_t x, int8_t y); // returns the minimum of x, y  
extern bool isLessThanU32(uint32_t x, uint32_t y); // returns 1 if x < y, 0 else  
extern bool isLessThanS32(int32_t x, int32_t y); // returns 1 if x < y, 0 else  
extern uint32_t shiftLeftU32 (uint32_t x, uint32_t p); // returns x << p = x * 2p for p = 0 .. 31  
extern uint32_t shiftU32(uint32_t x, int32_t p); // return x * 2p for p = -31 .. 31  
extern int32_t shiftS32(int32_t x, int32_t p); // return x * 2p for p = -31 .. 31 
extern bool isEqualU16(uint16_t x, uint16_t y); // returns 1 if x = y, 0 if x != y 
extern bool isEqualS16(int16_t x, int16_t y); // returns 1 if x = y, 0 if x != y 
extern void stringCopy(char* strTo, char* strFrom); // copies strFrom to strTo 
extern void stringCat(char* strFrom, char* strTo); // adds strFrom to end of strTo

int main() {
    uint64_t x, y;

    x = 20000000000, y = 30000000000;

    printf("add64 = %llu\n", add64(x, y)); 
    printf("sub64 = %llu\n", sub64(y, x)); 
    uint8_t u_min1 = 10, u_min2 = -5;
    int8_t u_min3 = -2;
    printf("minU8 = %hu\n", minU8(u_min1, u_min2)); 
    printf("minS8 = %hd\n", minS8(u_min2, u_min3)); 
    
    uint32_t n51 = 10, n52 = 1;
    printf("isLessThanU32 = %u\n", isLessThanU32(n51, n52)); 

    int32_t n61 = 1000, n62 = 300;
    printf("isLessThanS32 = %d\n", isLessThanS32(n61, n62)); 

    uint32_t n71 = 4, n72 = 3; // expected output: 2
    printf("shiftLeftU32 = %u\n", shiftLeftU32(n71, n72)); 
    
    uint32_t n81 = 1;
    int32_t n82 = -2;
    printf("shiftU32 = %u\n", shiftU32(n81, n82)); 

    int32_t n91 = -160000, n92 = -10;
    printf("shiftS32 = %d\n", shiftS32(n91, n92)); 

    uint16_t n10_1 = -1, n10_2 = -1;
    printf("isEqualU16 = %hu\n", isEqualU16(n10_1, n10_2));

    int16_t n11_1 = 4, n11_2 = 4;
    printf("isEqualS16 = %hd\n", isEqualS16(n11_1, n11_2));

    char n12_1[20] = "he\0yo", n12_2[20] = "testing ult\0imate t";
    stringCopy(n12_1, n12_2);
    printf("stringCopy = %s\n", n12_1);

    char n13_1[20] = "one\0 two", n13_2[20] = "five six  \0  three";
    stringCat(n13_1, n13_2);
    printf("stringCat = %s\n", n13_2);

    return 0;
}