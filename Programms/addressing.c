#include <stdio.h>

int globalArray[100]; // For memory addressing

int main() {
    int a = 10;
    int b = 20;
    int c = 30;
    int *ptr = &a;

    // Immediate Addressing - using constants directly
    int immediateSum = a + 100;

    // Register Indirect Addressing - using pointers
    int indirectValue = *ptr;

    // Displacement Addressing - accessing array elements with offset
    for (int i = 0; i < 100; i++) {
        globalArray[i] = i * 2;
    }
    int displacedValue = globalArray[50];

    // Scaled Addressing - simulating scaling using arrays
    int index = 5;
    int scaledValue = globalArray[index * 2];

    // Memory Indirect Addressing - using double pointer
    int **doublePtr = &ptr;
    int memoryIndirectValue = **doublePtr;

    // Printing results
    printf("Immediate Sum: %d\n", immediateSum);
    printf("Indirect Value: %d\n", indirectValue);
    printf("Displaced Value: %d\n", displacedValue);
    printf("Scaled Value: %d\n", scaledValue);
    printf("Memory Indirect Value: %d\n", memoryIndirectValue);

    return 0;
}

