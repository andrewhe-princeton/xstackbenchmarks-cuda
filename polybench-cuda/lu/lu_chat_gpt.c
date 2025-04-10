#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

static void init_array(int n, double *A) {
  int i, j;
  #pragma omp parallel for private(j)
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      A[i * n + j] = ((double)(i + 1) * (j + 1)) / n;
}

static void print_array(int n, double *A) {
  int i, j;
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf(stderr, "%0.2lf ", A[i * n + j]);
      if ((i * n + j) % 20 == 0)
        fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}

static void kernel(int n, double *A) {
  for (int k = 0; k < n - 1; k++) {
    #pragma omp parallel for
    for (int i = k + 1; i < n; i++) {
      A[i * n + k] /= A[k * n + k];
    }

    #pragma omp parallel for collapse(2)
    for (int i = k + 1; i < n; i++) {
      for (int j = k + 1; j < n; j++) {
        A[i * n + j] -= A[i * n + k] * A[k * n + j];
      }
    }
  }
}

int main(int argc, char **argv) {
  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);

  double *A = (double *)malloc(n * n * sizeof(double));

  init_array(n, A);
  kernel(n, A);

  if (dump_code == 1)
    print_array(n, A);

  free(A);

  return 0;
}

