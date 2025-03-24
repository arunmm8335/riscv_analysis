#include <stdio.h>
#include <stdlib.h>

#define MAX_NODES 100

int graph[MAX_NODES][MAX_NODES];
int visited[MAX_NODES];
int nodes;

void dfs(int start) {
    printf("%d ", start);
    visited[start] = 1;

    for (int i = 0; i < nodes; i++) {
        if (graph[start][i] == 1 && !visited[i]) {
            dfs(i);
        }
    }
}

int main() {
    int edges, u, v;

    printf("Enter number of nodes: ");
    scanf("%d", &nodes);

    printf("Enter number of edges: ");
    scanf("%d", &edges);

    // Initialize graph and visited array
    for (int i = 0; i < nodes; i++) {
        for (int j = 0; j < nodes; j++) {
            graph[i][j] = 0;
        }
        visited[i] = 0;
    }

    printf("Enter the edges (u v):\n");
    for (int i = 0; i < edges; i++) {
        scanf("%d %d", &u, &v);
        graph[u][v] = 1;
        graph[v][u] = 1; // For undirected graph
    }

    int startNode;
    printf("Enter starting node: ");
    scanf("%d", &startNode);

    printf("DFS Traversal starting from node %d: ", startNode);
    dfs(startNode);

    printf("\n");

    return 0;
}
