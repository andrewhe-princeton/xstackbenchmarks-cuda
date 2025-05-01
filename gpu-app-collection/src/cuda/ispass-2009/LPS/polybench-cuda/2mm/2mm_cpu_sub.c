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
struct Internal_FILE_Struct;
struct dim3_struct;
struct dim3_coerced;

/* Function definitions */

/* Types Definitions */
struct array_1_uint8_t {
  uint8_t array[1];
};
struct array_20_uint8_t {
  uint8_t array[20];
};
struct Internal_FILE_Struct {
  uint32_t flags;
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* read_base;
  uint8_t* write_base;
  uint8_t* write_ptr;
  uint8_t* write_end;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* save_base;
  uint8_t* backup_base;
  uint8_t* save_end;
  void* markers;
  struct Internal_FILE_Struct* chain;
  uint32_t fileno;
  uint32_t flags2;
  uint64_t old_offset;
  uint16_t cur_column;
  uint8_t vtable_offset;
  uint8_t shortbuf[1];
  uint8_t* lock;
  uint64_t offset;
  void* codecvt;
  void* wide_data;
  struct Internal_FILE_Struct* freeres_list;
  uint8_t* freeres_buf;
  uint64_t unused5;
  uint32_t mode;
  uint8_t unused2[20];
};
struct dim3_struct {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_coerced {
  uint64_t xy_packed;
  uint32_t z_val;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int16_t _Z10num_blocksss(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiiiiPdS_S_S_S_(uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiiiddPdS_S_S_S_(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void _ZL11print_arrayiiPd(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t format_string_double_space[8] = { "%0.2lf " };
uint8_t format_string_newline[2] = { "\n" };


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
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_udiv_u32(uint32_t a, uint32_t b) {
  uint32_t r = a / b;
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

int16_t _Z10num_blocksss(int16_t num, int16_t factor) {
//YEBIN: this point in function printer
  return ((num + factor) - 1) / factor;
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int64_t ni_arg;
  int64_t nj_arg;
  int64_t nk_arg;
  int64_t nl_arg;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* tmp;
  int32_t unused_var1;
  int32_t unused_var2;
//YEBIN: this point in function printer

  dump_code = atoi(argv[1]);
  ni_arg = atoi(argv[2]);
  nj_arg = atoi(argv[3]);
  nk_arg = atoi(argv[4]);
  nl_arg = atoi(argv[5]);
  A = malloc(ni_arg * nk_arg * 8);
  B = malloc(nk_arg * nj_arg * 8);
  C = malloc(nl_arg * nj_arg * 8);
  D = malloc(ni_arg * nl_arg * 8);
  tmp = malloc(ni_arg * nj_arg * 8);
  _ZL10init_arrayiiiiPdS_S_S_S_(ni_arg, nj_arg, nk_arg, nl_arg, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)tmp));
;
  _ZL6kerneliiiiddPdS_S_S_S_(ni_arg, nj_arg, nk_arg, nl_arg, 32412, 2123, ((double*)tmp), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
;
  if (dump_code == 1) {
_ZL11print_arrayiiPd(ni_arg, nl_arg, ((double*)D));
  }
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
  return 0;
}


void _ZL10init_arrayiiiiPdS_S_S_S_(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* A, double* B, double* C, double* D, double* tmp) {
  int64_t i;
  int64_t j;
//YEBIN: this point in function printer


for(int64_t i = 0; i < ni;   i = i + 1){

for(int64_t j = 0; j < nk;   j = j + 1){
  A[(i * ni + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}

for(int64_t i = 0; i < nk;   i = i + 1){

for(int64_t j = 0; j < nj;   j = j + 1){
  B[(i * nk + j)] = (((double)(i) * (double)((j + 1))) / (double)(nj));
}
}

for(int64_t i = 0; i < nl;   i = i + 1){

for(int64_t j = 0; j < nj;   j = j + 1){
  C[(i * nl + j)] = (((double)(i) * (double)((j + 3))) / (double)(nl));
}
}

for(int64_t i = 0; i < ni;   i = i + 1){

for(int64_t j = 0; j < nl;   j = j + 1){
  D[(i * ni + j)] = (((double)(i) * (double)((j + 2))) / (double)(nk));
}
}

for(int64_t i = 0; i < ni;   i = i + 1){

for(int64_t j = 0; j < nj;   j = j + 1){
  tmp[(i * ni + j)] = 0;
}
}
  return;
}


void _ZL6kerneliiiiddPdS_S_S_S_(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  struct dim3_struct block;    /* Address-exposed local */
  struct dim3_struct grid;    /* Address-exposed local */
  struct dim3_struct grid_copy1;    /* Address-exposed local */
  struct dim3_struct block_copy1;    /* Address-exposed local */
  struct dim3_coerced grid_coerced1;    /* Address-exposed local */
  struct dim3_coerced block_coerced1;    /* Address-exposed local */
  struct dim3_struct grid_copy2;    /* Address-exposed local */
  struct dim3_struct block_copy2;    /* Address-exposed local */
  struct dim3_coerced grid_coerced2;    /* Address-exposed local */
  struct dim3_coerced block_coerced2;    /* Address-exposed local */
  uint32_t blockDim_x_val;
  int32_t gridDim_x_val1;
  int32_t gridDim_y_val1;
  uint8_t* unused_ptr1;
  uint8_t* unused_ptr2;
  uint8_t* unused_ptr3;
  uint8_t* unused_ptr4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t gridDim_x_val2;
  int32_t gridDim_y_val2;
  uint8_t* unused_ptr5;
  uint8_t* unused_ptr6;
  uint8_t* unused_ptr7;
  uint8_t* unused_ptr8;
//YEBIN: this point in function printer

  blockDim_x_val = (256 / 32);
  block.x = blockDim_x_val;
  block.y = 32;
  block.z = 1;
  gridDim_x_val1 = _Z10num_blocksss(ni, block.x);
  gridDim_y_val1 = _Z10num_blocksss(nj, block.y);
  grid.x = gridDim_x_val1;
  grid.y = gridDim_y_val1;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy1)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy1)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_coerced1)), ((uint8_t*)(&grid_copy1)), 12);
  memcpy(((uint8_t*)(&block_coerced1)), ((uint8_t*)(&block_copy1)), 12);
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < gridDim_x_val1;   i = i + 1){

for(int32_t j = 0; j < gridDim_y_val1;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, gridDim_x_val1, gridDim_y_val1, 1, blockDim_x_val, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  gridDim_x_val2 = _Z10num_blocksss(ni, block.x);
  gridDim_y_val2 = _Z10num_blocksss(nl, block.y);
  grid.x = gridDim_x_val2;
  grid.y = gridDim_y_val2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_coerced2)), ((uint8_t*)(&grid_copy2)), 12);
  memcpy(((uint8_t*)(&block_coerced2)), ((uint8_t*)(&block_copy2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < gridDim_x_val2;   i = i + 1){

for(int32_t j = 0; j < gridDim_y_val2;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, gridDim_x_val2, gridDim_y_val2, 1, blockDim_x_val, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}


void _ZL11print_arrayiiPd(uint32_t ni, uint32_t nl, double* D) {
  int64_t i;
  int64_t j;
  int32_t unused_var3;
//YEBIN: this point in function printer


for(int64_t i = 0; i < ni;   i = i + 1){

for(int64_t j = 0; j < nl;   j = j + 1){
  uint32_t fprintf_ret_val = fprintf(stderr, (format_string_double_space), D[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, (format_string_newline));
  }
}
}
  fprintf(stderr, (format_string_newline));
}


void _Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;
//YEBIN: this point in function printer

  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) {
  if (j < nj) {
  dot = 0;

for(int64_t k = 0; k < nk;   k = k + 1){
  dot = (dot + ((alpha * A[(i * nk + k)]) * B[(k * nj + j)]));
}
  tmp[(i * nj + j)] = dot;
  }
  }
  return;
}


void _Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t l;
  double dot;
  int64_t j;
//YEBIN: this point in function printer

  i = blockDim_x * blockIdx_x + threadIdx_x;
  l = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) {
  if (l < nl) {
  dot = (D[(i * nj + l)] * beta);

for(int64_t j = 0; j < nj;   j = j + 1){
  dot = (dot + (tmp[(i * nj + j)] * C[(j * nl + l)]));
}
  D[(i * nl + l)] = dot;
  }
  }
  return;
}
