#include <stdio.h>
#include <stdlib.h>

#define N 3

// Function using indirect memory addressing
void memory_indirect(int *arr) {
    for (int i = 0; i < N; i++) {
        *(arr + i) += 10; // Memory indirect access
    }
}

// Function using scaled addressing (array index access)
void scaled_addressing(int arr[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            arr[i][j] *= 2; // Scaled index access
        }
    }
}

// Function using register indirect addressing (pointer arithmetic)
void register_indirect(int *arr) {
    for (int i = 0; i < N; i++) {
        arr[i] = i * 2; // Register indirect
    }
}

// Function using immediate addressing (constants in operations)
int immediate_addressing(int a, int b) {
    return a + 10 * b; // Immediate value 10
}

// Function using displacement addressing (struct access)
typedef struct {
    int x;
    int y;
} Point;

void displacement_addressing(Point *p) {
    p->x += 1; // Struct field access (displacement addressing)
    p->y += 2;
}

int main() {
    int arr1[N] = {1, 2, 3};
    int arr2[N][N] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    Point p = {10, 20};

    memory_indirect(arr1);
    scaled_addressing(arr2);
    register_indirect(arr1);
    int result = immediate_addressing(5, 3);
    displacement_addressing(&p);

    printf("Immediate addressing result: %d\n", result);
    printf("Displacement addressing Point: (%d, %d)\n", p.x, p.y);

    return 0;
}
