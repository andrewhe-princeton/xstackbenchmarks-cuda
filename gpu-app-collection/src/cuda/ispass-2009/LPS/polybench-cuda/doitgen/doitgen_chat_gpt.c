#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <omp.h>

static void kernel(int nr, int nq, int np,
                   double *A,
                   double *C4, double *sum) {

  #pragma omp parallel for collapse(3)
  for (int r = 0; r < nr; r++) {
    for (int q = 0; q < nq; q++) {
      for (int p = 0; p < np; p++) {
        double dot = 0.0;
        for (int s = 0; s < np; s++)
          dot += A[(r * nq + q) * np + s] * C4[s * np + p];
        sum[(r * nq + q) * np + p] = dot;
      }
    }
  }
}

static void init_array(int nr, int nq, int np,
    double *A,
    double *C4)
{
  int i, j, k;
  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++)
        A[i*np*nq+j*nq+k] = ((double) i*j + k) / np;
  for (i = 0; i < np; i++)
    for (j = 0; j < np; j++)
      C4[i*np+j] = ((double) i*j) / np;
}

static void print_array(int nr, int nq, int np,
    double *A)
{
  int i, j, k;
  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++) {
        fprintf(stderr, "%0.2lf ", A[i*nq*np+j*nq+k]);
        if (i % 20 == 0) fprintf(stderr, "\n");
      }
  fprintf(stderr, "\n");
}

int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int nr = atoi(argv[2]);
  int nq = atoi(argv[3]);
  int np = atoi(argv[4]);

  double *A = (double*)malloc(nr*nq*np*sizeof(double));
  double *sum = (double*)malloc(nr*nq*np*sizeof(double));
  double *C4 = (double*)malloc(np*np*sizeof(double));

  init_array(nr, nq, np, A, C4);
  kernel(nr, nq, np, A, C4, sum);

  if (dump_code == 1) print_array(nr, nq, np, sum);

  free(A);
  free(sum);
  free(C4);

  return 0;
}

