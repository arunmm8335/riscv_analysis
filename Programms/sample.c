#include <stdio.h>

int array[10];
float farray[10];

int main() {
    for (int i = 0; i < 10; i++) {
        array[i] = i * 2;
        farray[i] = i * 1.5;
    }
    return 0;
}
