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
struct l_struct_struct_OC__IO_FILE;
struct l_struct_struct_OC_dim3;
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  uint8_t field19[1];
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};
struct l_struct_struct_OC_dim3 {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
};
struct l_unnamed_1 {
  uint64_t field0;
  uint32_t field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiiiiiPdS_S_S_S_S_S_(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiiiiPdS_S_S_S_S_S_(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiiPd(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z14kernel_A_mul_BiiiPdS_S__OC_1(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


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
static __forceinline uint32_t llvm_OC_smax_OC_i32(int32_t a, int32_t b) {
  uint32_t r;
r = a > b ? a :b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  int32_t nk;
  int32_t nl;
  int32_t nm;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* E;
  uint8_t* F;
  uint8_t* G;
  int32_t call68;
  int32_t call96;

  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  nl = atoi(argv[5]);
  nm = atoi(argv[6]);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(nj * nm * 8);
  D = malloc(nm * nl * 8);
  E = malloc(ni * nj * 8);
  F = malloc(nj * nl * 8);
  G = malloc(ni * nl * 8);
  _ZL10init_arrayiiiiiPdS_S_S_S_S_S_(ni, nj, nk, nl, nm, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)E), ((double*)F), ((double*)G));
;
  _ZL6kerneliiiiiPdS_S_S_S_S_S_(ni, nj, nk, nl, nm, ((double*)E), ((double*)A), ((double*)B), ((double*)F), ((double*)C), ((double*)D), ((double*)G));
;
  if (dump_code == 1) {
_ZL11print_arrayiiPd(ni, nl, ((double*)G));
  }
free(((uint8_t*)((double*)E)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)F)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
free(((uint8_t*)((double*)G)));
  return 0;
}


void _ZL10init_arrayiiiiiPdS_S_S_S_S_S_(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* A, double* B, double* C, double* D, double* E, double* F, double* G) {
  int32_t smax86;
  int32_t smax93;
  uint64_t llvm_acc_1;
  uint64_t llvm_acc_2;
  int32_t smax72;
  int32_t smax79;
  int32_t smax58;
  int32_t smax65;
  int32_t smax43;
  int32_t smax50;
  int32_t smax28;
  int32_t smax35;
  int32_t smax14;
  int32_t smax21;
  int32_t smax;
  int32_t smax7;

  smax86 = llvm_OC_smax_OC_i32(nk, 0);
  smax93 = llvm_OC_smax_OC_i32(ni, 0);

for(int64_t llvm_acc_1 = 0; llvm_acc_1 < smax93; ){

for(int64_t llvm_acc_2 = 0; llvm_acc_2 < smax86; ){
  A[(llvm_acc_1 * ni + llvm_acc_2)] = (((double)(llvm_acc_1) * (double)(llvm_acc_2)) / (double)(ni));
}
}
  smax72 = llvm_OC_smax_OC_i32(nj, 0);
  smax79 = llvm_OC_smax_OC_i32(nk, 0);

for(int64_t llvm_acc_3 = 0; llvm_acc_3 < smax79; ){

for(int64_t llvm_acc_4 = 0; llvm_acc_4 < smax72; ){
  B[(llvm_acc_3 * nk + llvm_acc_4)] = (((double)(llvm_acc_3) * (double)((j + 1))) / (double)(nj));
}
}
  smax58 = llvm_OC_smax_OC_i32(nm, 0);
  smax65 = llvm_OC_smax_OC_i32(nj, 0);

for(int64_t llvm_acc_5 = 0; llvm_acc_5 < smax65; ){

for(int64_t llvm_acc_6 = 0; llvm_acc_6 < smax58; ){
  C[(llvm_acc_5 * nj + llvm_acc_6)] = (((double)(llvm_acc_5) * (double)((llvm_acc_6 + 3))) / (double)(nl));
}
}
  smax43 = llvm_OC_smax_OC_i32(nl, 0);
  smax50 = llvm_OC_smax_OC_i32(nm, 0);

for(int64_t llvm_acc_7 = 0; llvm_acc_7 < smax50; ){

for(int64_t llvm_acc_8 = 0; llvm_acc_8 < smax43; ){
  D[(llvm_acc_7 * nm + llvm_acc_8)] = (((double)(llvm_acc_7) * (double)((llvm_acc_8 + 2))) / (double)(nk));
}
}
  smax28 = llvm_OC_smax_OC_i32(nj, 0);
  smax35 = llvm_OC_smax_OC_i32(ni, 0);

for(int64_t llvm_acc_9 = 0; llvm_acc_9 < smax35; ){

for(int64_t llvm_acc_10 = 0; llvm_acc_10 < smax28; ){
  E[(llvm_acc_9 * ni + llvm_acc_10)] = 0;
}
}
  smax14 = llvm_OC_smax_OC_i32(nl, 0);
  smax21 = llvm_OC_smax_OC_i32(nj, 0);

for(int64_t llvm_acc_11 = 0; llvm_acc_11 < smax21; ){

for(int64_t llvm_acc_12 = 0; llvm_acc_12 < smax14; ){
  F[(llvm_acc_11 * nj + llvm_acc_12)] = 0;
}
}
  smax = llvm_OC_smax_OC_i32(nl, 0);
  smax7 = llvm_OC_smax_OC_i32(ni, 0);

for(int64_t llvm_acc_13 = 0; llvm_acc_13 < smax7; ){

for(int64_t llvm_acc_14 = 0; llvm_acc_14 < smax; ){
  G[(llvm_acc_13 * ni + llvm_acc_14)] = 0;
}
}
  return;
}


void _ZL6kerneliiiiiPdS_S_S_S_S_S_(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* E, double* A, double* B, double* F, double* C, double* D, double* G) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp2;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp2_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp9;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp10;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp9_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp10_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp20;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp21;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp21_2e_coerce;    /* Address-exposed local */
  uint32_t div;
  int32_t call;
  int32_t call1;
  uint8_t* _15;
  uint8_t* _16;
  uint8_t* _17;
  uint8_t* _18;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t call6;
  int32_t call8;
  uint8_t* _19;
  uint8_t* _20;
  uint8_t* _21;
  uint8_t* _22;
  int32_t call17;
  int32_t call19;
  uint8_t* _23;
  uint8_t* _24;
  uint8_t* _25;
  uint8_t* _26;

  div = (256 / 32);
  block.field0 = div;
  block.field1 = 32;
  block.field2 = 1;
  call = _ZL10num_blocksii(ni, block.field0);
  call1 = _ZL10num_blocksii(nj, block.field1);
  grid.field0 = call;
  grid.field1 = call1;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&agg_2e_tmp2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < call; ){

for(int32_t j = 0; j < call1; ){

for(int32_t k = 0; k < 8; ){

for(int32_t l = 0; l < 32; ){
_Z14kernel_A_mul_BiiiPdS_S__OC_1(ni, nj, nk, E, A, B, call, call1, 1, div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  call6 = _ZL10num_blocksii(nj, block.field0);
  call8 = _ZL10num_blocksii(nl, block.field1);
  grid.field0 = call6;
  grid.field1 = call8;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp9)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp10)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp9_2e_coerce)), ((uint8_t*)(&agg_2e_tmp9)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp10_2e_coerce)), ((uint8_t*)(&agg_2e_tmp10)), 12);
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < call6; ){

for(int32_t j = 0; j < call8; ){

for(int32_t k = 0; k < 8; ){

for(int32_t l = 0; l < 32; ){
_Z14kernel_A_mul_BiiiPdS_S__OC_1(nj, nl, nm, F, C, D, call6, call8, 1, div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  call17 = _ZL10num_blocksii(ni, block.field0);
  call19 = _ZL10num_blocksii(nl, block.field1);
  grid.field0 = call17;
  grid.field1 = call19;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp20)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp21)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&agg_2e_tmp20)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp21_2e_coerce)), ((uint8_t*)(&agg_2e_tmp21)), 12);
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < call17; ){

for(int32_t j = 0; j < call19; ){

for(int32_t k = 0; k < 8; ){

for(int32_t l = 0; l < 32; ){
_Z14kernel_A_mul_BiiiPdS_S__OC_1(ni, nl, nj, G, E, F, call17, call19, 1, div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}


void _ZL11print_arrayiiPd(uint32_t ni, uint32_t nl, double* G) {
  int32_t smax;
  int32_t smax9;
  uint64_t llvm_acc_27;
  uint64_t llvm_acc_28;
  int32_t call11;

  smax = llvm_OC_smax_OC_i32(nl, 0);
  smax9 = llvm_OC_smax_OC_i32(ni, 0);

for(int64_t llvm_acc_27 = 0; llvm_acc_27 < smax9; ){

for(int64_t llvm_acc_28 = 0; llvm_acc_28 < smax; ){
  int32_t call = fprintf(stderr, (_OC_str), G[(llvm_acc_27 * ni + llvm_acc_28)]);
  if ((int)(llvm_acc_27 * ni + llvm_acc_28) % (int)20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
}
  fprintf(stderr, (_OC_str_OC_1));
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z14kernel_A_mul_BiiiPdS_S__OC_1(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int32_t smax;
  uint64_t llvm_acc_29;
  double dot_2e_0_2e_lcssa;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < ni) {
  if (j < nj) {
  smax = llvm_OC_smax_OC_i32(nk, 0);
  dot_2e_0_2e_lcssa = 0;

for(int64_t llvm_acc_29 = 0; llvm_acc_29 < smax; ){
  double dot = (dot_2e_0_2e_lcssa + (A[(i * nk + llvm_acc_29)] * B[(llvm_acc_29 * nj + j)]));
}
  C[(i * nj + j)] = dot_2e_0_2e_lcssa;
  }
  }
  return;
}

