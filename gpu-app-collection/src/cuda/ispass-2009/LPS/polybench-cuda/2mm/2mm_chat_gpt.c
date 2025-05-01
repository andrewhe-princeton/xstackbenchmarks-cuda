#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

void kernel_A_mul_B(int ni, int nj, int nk, double alpha, double *tmp, double *A, double *B) {
  #pragma omp parallel for collapse(2)
  for (int i = 0; i < ni; i++) {
    for (int j = 0; j < nj; j++) {
      double dot = 0.0;
      for (int k = 0; k < nk; k++) {
        dot += alpha * A[i * nk + k] * B[k * nj + j];
      }
      tmp[i * nj + j] = dot;
    }
  }
}

void kernel_D_plus_tmp_mul_C(int ni, int nj, int nl, double beta, double *tmp, double *C, double *D) {
  #pragma omp parallel for collapse(2)
  for (int i = 0; i < ni; i++) {
    for (int l = 0; l < nl; l++) {
      double dot = D[i * nl + l] * beta;
      for (int j = 0; j < nj; j++) {
        dot += tmp[i * nj + j] * C[j * nl + l];
      }
      D[i * nl + l] = dot;
    }
  }
}

void kernel(int ni, int nj, int nk, int nl, double alpha, double beta, double *tmp, double *A, double *B, double *C, double *D) {
  kernel_A_mul_B(ni, nj, nk, alpha, tmp, A, B);
  kernel_D_plus_tmp_mul_C(ni, nj, nl, beta, tmp, C, D);
}

void print_array(int ni, int nl, double *D) {
  for (int i = 0; i < ni; i++)
    for (int j = 0; j < nl; j++) {
      fprintf(stderr, "%0.2lf ", D[i * nl + j]);
      if ((i * nl + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}

void init_array(int ni, int nj, int nk, int nl, double *A, double *B, double *C, double *D, double *tmp) {
  for (int i = 0; i < ni; i++)
    for (int j = 0; j < nk; j++)
      A[i * nk + j] = ((double)(i * j)) / ni;

  for (int i = 0; i < nk; i++)
    for (int j = 0; j < nj; j++)
      B[i * nj + j] = ((double)(i * (j + 1))) / nj;

  for (int i = 0; i < nj; i++)
    for (int j = 0; j < nl; j++)
      C[i * nl + j] = ((double)(i * (j + 3))) / nl;

  for (int i = 0; i < ni; i++)
    for (int j = 0; j < nl; j++)
      D[i * nl + j] = ((double)(i * (j + 2))) / nk;

  for (int i = 0; i < ni; i++)
    for (int j = 0; j < nj; j++)
      tmp[i * nj + j] = 0.0;
}

int main(int argc, char** argv) {
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);
  int nl = atoi(argv[5]);

  double alpha = 32412;
  double beta = 2123;

  double *A = (double*)malloc(ni * nk * sizeof(double));
  double *B = (double*)malloc(nk * nj * sizeof(double));
  double *C = (double*)malloc(nj * nl * sizeof(double));
  double *D = (double*)malloc(ni * nl * sizeof(double));
  double *tmp = (double*)malloc(ni * nj * sizeof(double));

  init_array(ni, nj, nk, nl, A, B, C, D, tmp);

  kernel(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D);

  if (dump_code == 1) print_array(ni, nl, D);

  free(tmp);
  free(A);
  free(B);
  free(C);
  free(D);

  return 0;
}

