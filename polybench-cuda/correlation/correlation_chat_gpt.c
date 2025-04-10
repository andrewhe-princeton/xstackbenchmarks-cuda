#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

#define EPS 0.1

void kernel_mean(int m, int n, double *data, double *mean) {
  #pragma omp parallel for
  for (int j = 0; j < m; j++) {
    mean[j] = 0.0;
    for (int i = 0; i < n; i++) {
      mean[j] += data[i * m + j];
    }
    mean[j] /= n;
  }
}

void kernel_stddev(int m, int n, double *data, double *mean, double *stddev) {
  #pragma omp parallel for
  for (int j = 0; j < m; j++) {
    stddev[j] = 0.0;
    for (int i = 0; i < n; i++) {
      double val = data[i * m + j] - mean[j];
      stddev[j] += val * val;
    }
    stddev[j] /= n;
    stddev[j] = sqrt(stddev[j]);
    if (stddev[j] <= EPS)
      stddev[j] = 1.0;
  }
}

void kernel_reduce(int m, int n, double *data, double *mean, double *stddev) {
  #pragma omp parallel for collapse(2)
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      data[i * m + j] -= mean[j];
      data[i * m + j] /= sqrt((double)n) * stddev[j];
    }
  }
}

void kernel_diag(int m, double *corr) {
  #pragma omp parallel for
  for (int i = 0; i < m; i++) {
    corr[i * m + i] = 1.0;
  }
}

void kernel_corr(int m, int n, double *data, double *corr) {
  #pragma omp parallel for collapse(2)
  for (int i = 0; i < m - 1; i++) {
    for (int j = i + 1; j < m; j++) {
      double sum = 0.0;
      for (int k = 0; k < n; k++) {
        sum += data[k * m + i] * data[k * m + j];
      }
      corr[i * m + j] = sum;
      corr[j * m + i] = sum;
    }
  }
}

void kernel_tail(int m, double *corr) {
  corr[(m - 1) * m + m - 1] = 1.0;
}

void kernel(int m, int n, double *data, double *corr, double *mean, double *stddev) {
  kernel_mean(m, n, data, mean);
  kernel_stddev(m, n, data, mean, stddev);
  kernel_reduce(m, n, data, mean, stddev);
  kernel_diag(m, corr);
  kernel_corr(m, n, data, corr);
  kernel_tail(m, corr);
}

void init_array(int m, int n, double *data) {
  for (int i = 0; i < m; i++)
    for (int j = 0; j < n; j++)
      data[i * n + j] = ((double)i * j) / 1000;
}

void print_array(int m, double *corr) {
  for (int i = 0; i < m; i++)
    for (int j = 0; j < m; j++) {
      fprintf(stderr, "%0.2lf ", corr[i * m + j]);
      if ((i * m + j) % 20 == 0)
        fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}

int main(int argc, char **argv) {
  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);
  int m = atoi(argv[3]);

  double *data = (double *)malloc(n * m * sizeof(double));
  double *mean = (double *)malloc(m * sizeof(double));
  double *stddev = (double *)malloc(m * sizeof(double));
  double *corr = (double *)malloc(m * m * sizeof(double));

  init_array(m, n, data);
  kernel(m, n, data, corr, mean, stddev);

  if (dump_code == 1)
    print_array(m, corr);

  free(data);
  free(mean);
  free(stddev);
  free(corr);

  return 0;
}

