#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// Forward declarations for the kernel functions implemented on the CPU
static void kernel_A_mul_B_cpu(int ni, int nj, int nk, double alpha,
                               double *tmp, double *A, double *B);

static void kernel_D_plus_tmp_mul_C_cpu(int ni, int nj, int nl, double beta,
                                        double *tmp, double *C, double *D);

static void kernel_A_mul_B_cpu(int ni, int nj, int nk, double alpha,
                               double *tmp, double *A, double *B) {
  int i, j, k;
  double dot;

#pragma omp parallel for private(j, k, dot)
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nj; j++) {
      dot = 0.0;
      for (k = 0; k < nk; k++) {
        dot += alpha * A[i * nk + k] * B[k * nj + j];
      }
      tmp[i * nj + j] = dot;
    }
  }
}

static void kernel_D_plus_tmp_mul_C_cpu(int ni, int nj, int nl, double beta,
                                        double *tmp, double *C, double *D) {
  int i, j, l;
  double dot;

#pragma omp parallel for private(l, j, dot)
  for (i = 0; i < ni; i++) {
    for (l = 0; l < nl; l++) {
      dot = D[i * nl + l] * beta;
      for (j = 0; j < nj; j++) {
        dot += tmp[i * nj + j] * C[j * nl + l];
      }
      D[i * nl + l] = dot;
    }
  }
}

static void kernel(int ni, int nj, int nk, int nl, double alpha, double beta,
                   double *tmp, double *A, double *B, double *C, double *D) {
  kernel_A_mul_B_cpu(ni, nj, nk, alpha, tmp, A, B);
  kernel_D_plus_tmp_mul_C_cpu(ni, nj, nl, beta, tmp, C, D);
}

static void print_array(int ni, int nl, double *D) {
  int i, j;

  for (i = 0; i < ni; i++) {
    for (j = 0; j < nl; j++) {
      fprintf(stderr, "%0.2lf ", D[i * nl + j]); // Corrected indexing
      if ((i * nl + j) % 20 == 0)
        fprintf(stderr, "\n");
    }
  }
  fprintf(stderr, "\n");
}

static void init_array(int ni, int nj, int nk, int nl, double *A, double *B,
                       double *C, double *D, double *tmp) {
  int i, j;

  // A is ni x nk
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i * nk + j] = ((double)i * j) / ni;

  // B is nk x nj
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i * nj + j] = ((double)i * (j + 1)) / nj;

  // C is nj x nl
  for (i = 0; i < nj; i++)
    for (j = 0; j < nl; j++)
      C[i * nl + j] = ((double)i * (j + 3)) / nl;

  // D is ni x nl
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      D[i * nl + j] =
          ((double)i * (j + 2)) / nk; // Indexing corrected based on usage

  // tmp is ni x nj
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      tmp[i * nj + j] = 0.0; // Indexing corrected, initialized to 0
}

int main(int argc, char **argv) {
  if (argc != 6) {
    fprintf(stderr, "Usage: %s <dump_code> <ni> <nj> <nk> <nl>\n", argv[0]);
    return 1;
  }

  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);
  int nl = atoi(argv[5]);

  if (ni <= 0 || nj <= 0 || nk <= 0 || nl <= 0) {
    fprintf(stderr, "Error: Dimensions must be positive integers.\n");
    return 1;
  }

  double alpha = 32412.0;
  double beta = 2123.0;
  double *A = (double *)malloc((size_t)ni * nk * sizeof(double));
  double *B = (double *)malloc((size_t)nk * nj * sizeof(double));
  double *C = (double *)malloc((size_t)nj * nl *
                               sizeof(double)); // Corrected size based on usage
  double *D = (double *)malloc((size_t)ni * nl * sizeof(double));
  double *tmp = (double *)malloc((size_t)ni * nj * sizeof(double));

  if (!A || !B || !C || !D || !tmp) {
    fprintf(stderr, "Error: Memory allocation failed.\n");
    free(A);
    free(B);
    free(C);
    free(D);
    free(tmp);
    return 1;
  }

  init_array(ni, nj, nk, nl, A, B, C, D, tmp);

  kernel(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D);

  if (dump_code == 1) {
    fprintf(stderr, "==BEGIN DUMP_ARRAYS==\n");
    fprintf(stderr, "begin dump: %s", "D");
    print_array(ni, nl, D); // Corrected dimension nk -> nl
    fprintf(stderr, "end   dump: %s\n", "D");
    fprintf(stderr, "==END   DUMP_ARRAYS==\n");
  }

  free((void *)tmp);
  free((void *)A);
  free((void *)B);
  free((void *)C);
  free((void *)D);

  return 0;
}
