#include <cublas_v2.h>
#include <stdio.h>
#include <stdlib.h>

__global__ void print_from_gpu() {
    printf("Hello World! from thread [%d,%d] (device)\n", threadIdx.x,
           blockIdx.x);
}

int main() {
    cublasHandle_t cublas;
    printf("Hello World from host!\n");
    print_from_gpu<<<1, 1>>>();
    cudaDeviceSynchronize();
}
