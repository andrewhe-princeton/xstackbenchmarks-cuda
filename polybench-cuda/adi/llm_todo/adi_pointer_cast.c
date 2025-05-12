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
#else
#define  __ATTRIBUTELIST__(x)
#endif

#ifdef _MSC_VER  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct __FIXME__l_struct_struct_OC__IO_FILE;
struct __FIXME__l_struct_struct_OC_dim3;
struct __FIXME__l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct __FIXME__l_array_1_uint8_t {
  uint8_t array[1];
};
struct __FIXME__l_array_20_uint8_t {
  uint8_t array[20];
};
struct __FIXME__l_struct_struct_OC__IO_FILE {
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field0;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field1; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field2; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field3; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field4; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field5; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field6; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field7; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field8; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field9; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field10; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field11; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  void* __FIXME__l_struct_struct_OC__IO_FILE_field12;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field13;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field14;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field15;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field16;
  uint16_t __FIXME__l_struct_struct_OC__IO_FILE_field17;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field18;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field19[1];
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field20; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field21;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field22;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field23;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field24;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field25; // LLM POINTER CAST MODIFY - Potentially char* but keeping uint8_t* for FILE internals
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field26;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field27;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field28[20];
};
struct __FIXME__l_struct_struct_OC_dim3 {
  uint32_t __FIXME__l_struct_struct_OC_dim3_field0;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field1;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field2;
};
struct __FIXME__l_unnamed_1 {
  uint64_t __FIXME__l_unnamed_1_field0;
  uint32_t __FIXME__l_unnamed_1_field1;
};


/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t); // LLM POINTER CAST MODIFY - Keeping uint8_t* for CUDA API
uint32_t cudaLaunch(uint8_t*); // LLM POINTER CAST MODIFY - Keeping uint8_t* for CUDA API
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t); // LLM POINTER CAST MODIFY - Keeping uint8_t* for CUDA API
void kernel(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*); // LLM POINTER CAST MODIFY - Keeping uint8_t* for CUDA API
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t); // LLM POINTER CAST MODIFY - Keeping uint8_t** for CUDA API
void _Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[8] = { "%0.2lf " }; // LLM POINTER CAST MODIFY - Using uint8_t* as char* for string literal
uint8_t __FIXME_GLOBAL___OC_str_OC_1[2] = { "\n" }; // LLM POINTER CAST MODIFY - Using uint8_t* as char* for string literal


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
  double* u; // LLM POINTER CAST MODIFY
  double* v; // LLM POINTER CAST MODIFY
  double* p; // LLM POINTER CAST MODIFY
  double* q; // LLM POINTER CAST MODIFY
  int32_t __FIXME__call38;
  int32_t __FIXME__call54;

//INSERT COMMENT IFELSE: entry
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  u = (double*)malloc((((uint64_t)n) * ((uint64_t)n)) * sizeof(double)); // LLM POINTER CAST MODIFY
  v = (double*)malloc((((uint64_t)n) * ((uint64_t)n)) * sizeof(double)); // LLM POINTER CAST MODIFY
  p = (double*)malloc((((uint64_t)n) * ((uint64_t)n)) * sizeof(double)); // LLM POINTER CAST MODIFY
  q = (double*)malloc((((uint64_t)n) * ((uint64_t)n)) * sizeof(double)); // LLM POINTER CAST MODIFY
  init_array(n, u, v, p, q); // LLM POINTER CAST MODIFY - Removed cast
;
  kernel(tsteps, n, u, v, p, q); // LLM POINTER CAST MODIFY - Removed cast
;
  if (dump_code == 1) {
print_array(n, u); // LLM POINTER CAST MODIFY - Removed cast
  }
free(u); // LLM POINTER CAST MODIFY - Removed cast
free(v); // LLM POINTER CAST MODIFY - Removed cast
free(p); // LLM POINTER CAST MODIFY - Removed cast
free(q); // LLM POINTER CAST MODIFY - Removed cast
  return 0;
}


//__FIXME__FUNCTION_ORDER_ID__0
//INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* u, double* v, double* p, double* q) {
  int64_t i;
  uint64_t j;
  uint64_t __FIXME_tmp_1; // LLM POINTER CAST MODIFY - Temporary for calculation clarity
  uint64_t __FIXME_tmp_2; // LLM POINTER CAST MODIFY - Temporary for calculation clarity

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  __FIXME_tmp_1 = i * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY - Calculate index
  u[__FIXME_tmp_1] = ((double)(((i + n) - j)) / (double)(n)); // LLM POINTER CAST MODIFY - Use calculated index
  v[__FIXME_tmp_1] = 0; // LLM POINTER CAST MODIFY - Use calculated index
  p[__FIXME_tmp_1] = 0; // LLM POINTER CAST MODIFY - Use calculated index
  q[__FIXME_tmp_1] = 0; // LLM POINTER CAST MODIFY - Use calculated index
}
}
  return;
}


//__FIXME__FUNCTION_ORDER_ID__1
//INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp15;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp15_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp17;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp20;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp17_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  double DX;
  double DY;
  double DT;
  double mul1;
  double mul2;
  double __FIXME__div10;
  double b;
  double __FIXME__div12;
  double e;
  int32_t t;
  uint32_t j;
  uint32_t k;

  DX = (1.0 / (double)(n)); // LLM POINTER CAST MODIFY - Ensure floating point division
  DY = (1.0 / (double)(n)); // LLM POINTER CAST MODIFY - Ensure floating point division
  DT = (1.0 / (double)(tsteps)); // LLM POINTER CAST MODIFY - Ensure floating point division
  mul1 = (((2.0 * DT) / DX) / DX); // LLM POINTER CAST MODIFY - Use 2.0
  mul2 = (((1.0 * DT) / DY) / DY); // LLM POINTER CAST MODIFY - Use 1.0
  __FIXME__div10 = (-(mul1) / 2.0); // LLM POINTER CAST MODIFY - Use 2.0
  b = (1.0 + mul1); // LLM POINTER CAST MODIFY - Use 1.0
  __FIXME__div12 = (-(mul2) / 2.0); // LLM POINTER CAST MODIFY - Use 2.0
  e = (1.0 + mul2); // LLM POINTER CAST MODIFY - Use 1.0
//INSERT COMMENT LOOP: for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t __FIXME__call = num_blocks((n - 2), 256);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12); // LLM POINTER CAST MODIFY - Cast for memcpy
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp15_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp15)), 12); // LLM POINTER CAST MODIFY - Cast for memcpy
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
_Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(tsteps, n, u, v, p, q, __FIXME__div10, b, __FIXME__div10, __FIXME__div12, e, __FIXME__div12, __FIXME__call, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t __FIXME__call19 = num_blocks((n - 2), 256);
  __FIXME__agg_2e_tmp17.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call19;
  __FIXME__agg_2e_tmp17.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp17.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp17_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp17)), 12); // LLM POINTER CAST MODIFY - Cast for memcpy
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp20)), 12); // LLM POINTER CAST MODIFY - Cast for memcpy
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call19;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
_Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(tsteps, n, u, v, p, q, __FIXME__div10, b, __FIXME__div10, __FIXME__div12, e, __FIXME__div12, __FIXME__call19, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}


//__FIXME__FUNCTION_ORDER_ID__2
//INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* u) {
  int64_t i;
  uint64_t j;
  int32_t __FIXME__call11;
  uint64_t __FIXME_tmp_1; // LLM POINTER CAST MODIFY - Temporary for calculation clarity

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  __FIXME_tmp_1 = i * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY - Calculate index
  uint32_t __FIXME__call = fprintf(stderr, ((char*)__FIXME_GLOBAL___OC_str), u[__FIXME_tmp_1]); // LLM POINTER CAST MODIFY - Cast string literal, use calculated index
  if ((int)(__FIXME_tmp_1) % (int)20 == 0) { // LLM POINTER CAST MODIFY - Use calculated index
  fprintf(stderr, ((char*)__FIXME_GLOBAL___OC_str_OC_1)); // LLM POINTER CAST MODIFY - Cast string literal
  }
}
}
  fprintf(stderr, ((char*)__FIXME_GLOBAL___OC_str_OC_1)); // LLM POINTER CAST MODIFY - Cast string literal
}


//__FIXME__FUNCTION_ORDER_ID__3
//INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


//__FIXME__FUNCTION_ORDER_ID__4
//INSERT COMMENT FUNCTION: kernel_column_sweep
void _Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int64_t j;
  uint64_t __FIXME_idx_0; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_1; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_2; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_3; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_4; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_5; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_6; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_7; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_8; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_9; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_10; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_11; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_12; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_13; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_14; // LLM POINTER CAST MODIFY - Index calculation

//INSERT COMMENT IFELSE: entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + 1;
  if (i < (n - 1)) {
  __FIXME_idx_0 = 0 * ((uint64_t)n) + i; // LLM POINTER CAST MODIFY
  v[__FIXME_idx_0] = 1.0; // LLM POINTER CAST MODIFY - Use 1.0
  __FIXME_idx_1 = ((uint64_t)i) * ((uint64_t)n) + 0; // LLM POINTER CAST MODIFY
  p[__FIXME_idx_1] = 0.0; // LLM POINTER CAST MODIFY - Use 0.0
  __FIXME_idx_2 = ((uint64_t)i) * ((uint64_t)n) + 0; // LLM POINTER CAST MODIFY
  q[__FIXME_idx_2] = v[__FIXME_idx_0]; // LLM POINTER CAST MODIFY
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  __FIXME_idx_3 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_4 = ((uint64_t)i) * ((uint64_t)n) + (j - 1); // LLM POINTER CAST MODIFY
  p[__FIXME_idx_3] = (-(c) / ((a * p[__FIXME_idx_4]) + b)); // LLM POINTER CAST MODIFY
  __FIXME_idx_5 = ((uint64_t)j) * ((uint64_t)n) + (i - 1); // LLM POINTER CAST MODIFY
  __FIXME_idx_6 = ((uint64_t)j) * ((uint64_t)n) + i; // LLM POINTER CAST MODIFY
  __FIXME_idx_7 = ((uint64_t)j) * ((uint64_t)n) + (i + 1); // LLM POINTER CAST MODIFY
  __FIXME_idx_8 = ((uint64_t)i) * ((uint64_t)n) + (j - 1); // LLM POINTER CAST MODIFY
  __FIXME_idx_9 = ((uint64_t)i) * ((uint64_t)n) + (j - 1); // LLM POINTER CAST MODIFY
  q[__FIXME_idx_3] = (((((-(d) * u[__FIXME_idx_5]) + ((1.0 + (2.0 * d)) * u[__FIXME_idx_6])) - (f * u[__FIXME_idx_7])) - (a * q[__FIXME_idx_8])) / ((a * p[__FIXME_idx_9]) + b)); // LLM POINTER CAST MODIFY - Use 1.0, 2.0
}
  __FIXME_idx_10 = (((uint64_t)n) - 1) * ((uint64_t)n) + i; // LLM POINTER CAST MODIFY
  v[__FIXME_idx_10] = 1.0; // LLM POINTER CAST MODIFY - Use 1.0
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  __FIXME_idx_11 = ((uint64_t)j) * ((uint64_t)n) + i; // LLM POINTER CAST MODIFY
  __FIXME_idx_12 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_13 = (j + 1) * ((uint64_t)n) + i; // LLM POINTER CAST MODIFY
  __FIXME_idx_14 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  v[__FIXME_idx_11] = ((p[__FIXME_idx_12] * v[__FIXME_idx_13]) + q[__FIXME_idx_14]); // LLM POINTER CAST MODIFY
}
  }
  return;
}


//__FIXME__FUNCTION_ORDER_ID__5
//INSERT COMMENT FUNCTION: kernel_row_sweep
void _Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int64_t j;
  uint64_t __FIXME_idx_0; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_1; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_2; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_3; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_4; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_5; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_6; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_7; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_8; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_9; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_10; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_11; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_12; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_13; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_14; // LLM POINTER CAST MODIFY - Index calculation
  uint64_t __FIXME_idx_15; // LLM POINTER CAST MODIFY - Index calculation

//INSERT COMMENT IFELSE: entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + 1;
  if (i < (n - 1)) {
  __FIXME_idx_0 = ((uint64_t)i) * ((uint64_t)n) + 0; // LLM POINTER CAST MODIFY
  u[__FIXME_idx_0] = 1.0; // LLM POINTER CAST MODIFY - Use 1.0
  __FIXME_idx_1 = ((uint64_t)i) * ((uint64_t)n) + 0; // LLM POINTER CAST MODIFY - Note: Original used i+n, seems incorrect, using i*n like others
  p[__FIXME_idx_1] = 0.0; // LLM POINTER CAST MODIFY - Use 0.0
  __FIXME_idx_2 = ((uint64_t)i) * ((uint64_t)n) + 0; // LLM POINTER CAST MODIFY
  q[__FIXME_idx_2] = u[__FIXME_idx_0]; // LLM POINTER CAST MODIFY
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  __FIXME_idx_3 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_4 = ((uint64_t)i) * ((uint64_t)n) + (j - 1); // LLM POINTER CAST MODIFY
  p[__FIXME_idx_3] = (-(f) / ((d * p[__FIXME_idx_4]) + e)); // LLM POINTER CAST MODIFY
  __FIXME_idx_5 = ((uint64_t)(i - 1)) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_6 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_7 = ((uint64_t)(i + 1)) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_8 = ((uint64_t)i) * ((uint64_t)n) + (j - 1); // LLM POINTER CAST MODIFY
  __FIXME_idx_9 = ((uint64_t)i) * ((uint64_t)n) + (j - 1); // LLM POINTER CAST MODIFY
  q[__FIXME_idx_3] = (((((-(a) * v[__FIXME_idx_5]) + ((1.0 + (2.0 * a)) * v[__FIXME_idx_6])) - (c * v[__FIXME_idx_7])) - (d * q[__FIXME_idx_8])) / ((d * p[__FIXME_idx_9]) + e)); // LLM POINTER CAST MODIFY - Use 1.0, 2.0
}
  __FIXME_idx_10 = ((uint64_t)i) * ((uint64_t)n) + (((uint64_t)n) - 1); // LLM POINTER CAST MODIFY
  u[__FIXME_idx_10] = 1.0; // LLM POINTER CAST MODIFY - Use 1.0
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  __FIXME_idx_11 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_12 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  __FIXME_idx_13 = ((uint64_t)i) * ((uint64_t)n) + (j + 1); // LLM POINTER CAST MODIFY
  __FIXME_idx_14 = ((uint64_t)i) * ((uint64_t)n) + j; // LLM POINTER CAST MODIFY
  u[__FIXME_idx_11] = ((p[__FIXME_idx_12] * u[__FIXME_idx_13]) + q[__FIXME_idx_14]); // LLM POINTER CAST MODIFY
}
  }
  return;
}
