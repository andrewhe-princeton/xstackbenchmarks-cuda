/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__)
#define  __ATTRIBUTELIST__(x) __attribute__(x)
#endif

#ifdef _MSC_VER  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct internal_FILE_t;
struct dim3_t;
struct dim3_coerced_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1_t {
  uint8_t array[1];
};
struct uint8_array_20_t {
  uint8_t array[20];
};
struct internal_FILE_t {
  uint32_t _flags;
  uint8_t* _IO_read_ptr;
  uint8_t* _IO_read_end;
  uint8_t* _IO_read_base;
  uint8_t* _IO_write_base;
  uint8_t* _IO_write_ptr;
  uint8_t* _IO_write_end;
  uint8_t* _IO_buf_base;
  uint8_t* _IO_buf_end;
  uint8_t* _IO_save_base;
  uint8_t* _IO_backup_base;
  uint8_t* _IO_save_end;
  void* _markers;
  struct internal_FILE_t* _chain;
  uint32_t _fileno;
  uint32_t _flags2;
  uint64_t _old_offset;
  uint16_t _cur_column;
  uint8_t _vtable_offset;
  uint8_t _shortbuf[1];
  uint8_t* _lock;
  uint64_t _offset;
  void* _codecvt;
  void* _wide_data;
  struct internal_FILE_t* _freeres_list;
  uint8_t* _freeres_buf;
  uint64_t __pad5;
  uint32_t _mode;
  uint8_t _unused2[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_coerced_t {
  uint64_t coerced_dim3_part1;
  uint32_t coerced_dim3_part2;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_format_string[8] = { "%0.2lf " };
uint8_t newline_string[2] = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* u;
  uint8_t* v;
  uint8_t* p;
  uint8_t* q;
  int32_t unused_local_int_main_1;
  int32_t unused_local_int_main_2;

// Main program logic: parse arguments, allocate memory, initialize arrays, run ADI kernel, optionally print results, and free memory.
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  u = malloc(n * n * 8);
  v = malloc(n * n * 8);
  p = malloc(n * n * 8);
  q = malloc(n * n * 8);
  init_array(n, ((double*)u), ((double*)v), ((double*)p), ((double*)q));
;
  kernel(tsteps, n, ((double*)u), ((double*)v), ((double*)p), ((double*)q));
;
  if (dump_code == 1) {
print_array(n, ((double*)u));
  }
free(((uint8_t*)((double*)u)));
free(((uint8_t*)((double*)v)));
free(((uint8_t*)((double*)p)));
free(((uint8_t*)((double*)q)));
  return 0;
}


//__FIXME__FUNCTION_ORDER_ID__0
// Initializes the solution array 'u' and auxiliary arrays 'v', 'p', 'q'.
void init_array(uint32_t n, double* u, double* v, double* p, double* q) {
  int64_t i;
  uint64_t j;

// Iterate over each element of the n x n grid to set initial values.
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  u[(i * n + j)] = ((double)(((i + n) - j)) / (double)(n));
  v[(i * n + j)] = 0;
  p[(i * n + j)] = 0;
  q[(i * n + j)] = 0;
}
}
  return;
}


//__FIXME__FUNCTION_ORDER_ID__1
// Main computation kernel that orchestrates the ADI time-stepping process.
void kernel(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q) {
  struct dim3_t grid_dim_col_sweep_config;    /* Address-exposed local */
  struct dim3_t block_dim_col_sweep_config;    /* Address-exposed local */
  struct dim3_coerced_t coerced_grid_dim_col_sweep;    /* Address-exposed local */
  struct dim3_coerced_t coerced_block_dim_col_sweep;    /* Address-exposed local */
  struct dim3_t grid_dim_row_sweep_config;    /* Address-exposed local */
  struct dim3_t block_dim_row_sweep_config;    /* Address-exposed local */
  struct dim3_coerced_t coerced_grid_dim_row_sweep;    /* Address-exposed local */
  struct dim3_coerced_t coerced_block_dim_row_sweep;    /* Address-exposed local */
  double DX;
  double DY;
  double DT;
  double mul1;
  double mul2;
  double kernel_param_ac_val;
  double b;
  double kernel_param_df_val;
  double e;
  int32_t t;
  uint32_t j;
  uint32_t k;

  DX = (1 / (double)(n));
  DY = (1 / (double)(n));
  DT = (1 / (double)(tsteps));
  mul1 = (((2 * DT) / DX) / DX);
  mul2 = (((1 * DT) / DY) / DY);
  kernel_param_ac_val = (-(mul1) / 2);
  b = (1 + mul1);
  kernel_param_df_val = (-(mul2) / 2);
  e = (1 + mul2);
// Iterates over the specified number of time steps, performing ADI sweeps in each step.
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t temp_call_return_value = num_blocks((n - 2), 256);
  grid_dim_col_sweep_config.x = temp_call_return_value;
  grid_dim_col_sweep_config.y = 1;
  grid_dim_col_sweep_config.z = 1;
  block_dim_col_sweep_config.x = 256;
  block_dim_col_sweep_config.y = 1;
  block_dim_col_sweep_config.z = 1;
  memcpy(((uint8_t*)(&coerced_grid_dim_col_sweep)), ((uint8_t*)(&grid_dim_col_sweep_config)), 12);
  memcpy(((uint8_t*)(&coerced_block_dim_col_sweep)), ((uint8_t*)(&block_dim_col_sweep_config)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < temp_call_return_value;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
_Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(tsteps, n, u, v, p, q, kernel_param_ac_val, b, kernel_param_ac_val, kernel_param_df_val, e, kernel_param_df_val, temp_call_return_value, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t num_blocks_row_sweep = num_blocks((n - 2), 256);
  grid_dim_row_sweep_config.x = num_blocks_row_sweep;
  grid_dim_row_sweep_config.y = 1;
  grid_dim_row_sweep_config.z = 1;
  block_dim_row_sweep_config.x = 256;
  block_dim_row_sweep_config.y = 1;
  block_dim_row_sweep_config.z = 1;
  memcpy(((uint8_t*)(&coerced_grid_dim_row_sweep)), ((uint8_t*)(&grid_dim_row_sweep_config)), 12);
  memcpy(((uint8_t*)(&coerced_block_dim_row_sweep)), ((uint8_t*)(&block_dim_row_sweep_config)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_row_sweep;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
_Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(tsteps, n, u, v, p, q, kernel_param_ac_val, b, kernel_param_ac_val, kernel_param_df_val, e, kernel_param_df_val, num_blocks_row_sweep, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}


//__FIXME__FUNCTION_ORDER_ID__3
// Utility function to calculate the number of blocks required for a given number of items and block size (threads per block).
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


//__FIXME__FUNCTION_ORDER_ID__4
// Performs the first half-step of the ADI method: solves tridiagonal systems for each column.
// This step is implicit in the x-direction (along rows of the column) and explicit in the y-direction (across columns).
// Updates array 'v' using values from 'u', 'p', and 'q'.
void _Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int64_t j;

// Calculate the global column index 'i'. This thread processes column 'i' if it's an interior column (1 to n-2).
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  if (i < (n - 1)) {
  v[(0 * n + i)] = 1;
  p[(i * n + 0)] = 0;
  q[(i * n + 0)] = v[(0 * n + i)];
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  p[(i * n + j)] = (-(c) / ((a * p[((i * n + j) - 1)]) + b));
  q[(i * n + j)] = (((((-(d) * u[((j * n + i) - 1)]) + ((1 + (2 * d)) * u[(j * n + i)])) - (f * u[((j * n + i) + 1)])) - (a * q[((i * n + j) - 1)])) / ((a * p[((i * n + j) - 1)]) + b));
}
  v[((n - 1) * n + i)] = 1;
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  v[(j * n + i)] = ((p[(i * n + j)] * v[((j + 1) * n + i)]) + q[(i * n + j)]);
}
  }
  return;
}


//__FIXME__FUNCTION_ORDER_ID__5
// Performs the second half-step of the ADI method: solves tridiagonal systems for each row.
// This step is implicit in the y-direction (along columns of the row) and explicit in the x-direction (across rows).
// Updates array 'u' using values from 'v', 'p', and 'q'.
void _Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int64_t j;

// Calculate the global row index 'i'. This thread processes row 'i' if it's an interior row (1 to n-2).
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  if (i < (n - 1)) {
  u[(i * n + 0)] = 1;
  p[((i + n) + 0)] = 0;
  q[(i * n + 0)] = u[(i * n + 0)];
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  p[(i * n + j)] = (-(f) / ((d * p[((i * n + j) - 1)]) + e));
  q[(i * n + j)] = (((((-(a) * v[((i - 1) * n + j)]) + ((1 + (2 * a)) * v[(i * n + j)])) - (c * v[((i + 1) * n + j)])) - (d * q[((i * n + j) - 1)])) / ((d * p[((i * n + j) - 1)]) + e));
}
  u[((i * n + n) - 1)] = 1;
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  u[(i * n + j)] = ((p[(i * n + j)] * u[((i * n + j) + 1)]) + q[(i * n + j)]);
}
  }
  return;
}


//__FIXME__FUNCTION_ORDER_ID__2
// Prints the elements of the 2D array 'u' to standard error for verification.
void print_array(uint32_t n, double* u) {
  int64_t i;
  uint64_t j;
  int32_t unused_local_int_print_array;

// Iterate over the n x n grid to print each element, adding newlines for readability.
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  uint32_t temp_call_return_value = fprintf(stderr, (double_format_string), u[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fprintf(stderr, (newline_string));
  }
}
}
  fprintf(stderr, (newline_string));
}
