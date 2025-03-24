#include <stdio.h>

#define N 3  // Define matrix size

void multiplyMatrices(int firstMatrix[N][N], int secondMatrix[N][N], int result[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            result[i][j] = 0;
            for (int k = 0; k < N; k++) {
                result[i][j] += firstMatrix[i][k] * secondMatrix[k][j];
            }
        }
    }
}

void printMatrix(int matrix[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int firstMatrix[N][N] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    int secondMatrix[N][N] = {{9, 8, 7}, {6, 5, 4}, {3, 2, 1}};
    int result[N][N];
    
    printf("First Matrix:\n");
    printMatrix(firstMatrix);
    
    printf("Second Matrix:\n");
    printMatrix(secondMatrix);
    
    multiplyMatrices(firstMatrix, secondMatrix, result);
    
    printf("Resultant Matrix:\n");
    printMatrix(result);
    
    return 0;
}
