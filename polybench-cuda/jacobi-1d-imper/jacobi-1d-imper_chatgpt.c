#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <omp.h>

static void kernel_stencil(int n, double A[], double B[]) {
  #pragma omp parallel for
  for (int i = 1; i < n - 1; i++) {
    B[i] = (A[i - 1] + A[i] + A[i + 1]) / 3;
  }
}

static void kernel(int tsteps, int n, double A[], double B[]) {
  for (int t = 1; t <= tsteps; t++) {
    kernel_stencil(n, A, B);
    kernel_stencil(n, B, A);
  }
}

static void init_array(int n, double *A, double *B) {
  for (int i = 0; i < n; i++) {
    A[i] = ((double)i + 2) / n;
    B[i] = ((double)i + 3) / n;
  }
}

static void print_array(int n, double *A) {
  for (int i = 0; i < n; i++) {
    fprintf(stderr, "%0.2lf ", A[i]);
    if (i % 20 == 0) fprintf(stderr, "\n");
  }
  fprintf(stderr, "\n");
}

int main(int argc, char** argv) {
  int n = atoi(argv[3]);
  int tsteps = atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  double *A = (double*)malloc(n * sizeof(double));
  double *B = (double*)malloc(n * sizeof(double));

  init_array(n, A, B);
  kernel(tsteps, n, A, B);

  if (dump_code == 1) print_array(n, A);

  free(A);
  free(B);

  return 0;
}

