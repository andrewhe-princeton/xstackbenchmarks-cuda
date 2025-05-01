/* Provide Declarations */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__)
#define __ATTRIBUTELIST__(x) __attribute__(x)
#else
#define __ATTRIBUTELIST__(x)
#endif

#ifdef _MSC_VER /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

/* Global Declarations */

/* Types Declarations */
struct IoFile;
struct Dim3;
struct Dim3Coerced;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct IoFile {
  uint32_t Field0;
  uint8_t Field1;
  uint8_t *Field2;
  uint8_t *Field3;
  uint8_t *Field4;
  uint8_t *Field5;
  uint8_t *Field6;
  uint8_t *Field7;
  uint8_t *Field8;
  uint8_t *Field9;
  uint8_t *Field10;
  uint8_t *Field11;
  void *Field12;
  struct IoFile *Field13;
  uint32_t Field14;
  uint32_t Field15;
  uint64_t Field16;
  uint16_t Field17;
  uint8_t Field18;
  uint8_t Field19[1];
  uint8_t *Field20;
  uint64_t Field21;
  void *Field22;
  void *Field23;
  struct IoFile *Field24;
  uint8_t *Field25;
  uint64_t Field26;
  uint32_t Field27;
  uint8_t Field28[20];
};
struct Dim3 {
  uint32_t X;
  uint32_t Y;
  uint32_t Z;
};
struct Dim3Coerced {
  uint64_t Data1;
  uint32_t Data2;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t *);
int16_t calculate_num_blocks(int16_t, int16_t)
    __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void initialize_arrays(uint32_t, uint32_t, uint32_t, uint32_t, double *,
                       double *, double *, double *, double *)
    __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t *, uint8_t *, uint64_t, uint32_t);
void run_gemm_kernels(uint32_t, uint32_t, uint32_t, uint32_t, double, double,
                      double *, double *, double *, double *, double *)
    __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t *);
void print_array(uint32_t, uint32_t, double *) __ATTRIBUTELIST__((noinline));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t,
                           void *);
uint32_t cudaMalloc(uint8_t **, uint64_t);
void kernel_multiply_ab(uint32_t, uint32_t, uint32_t, uint32_t, double, double,
                        double *, double *, double *, double *, double *,
                        uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                        uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                        uint32_t, uint32_t)
    __ATTRIBUTELIST__((noinline, nothrow));
void kernel_update_d(uint32_t, uint32_t, uint32_t, uint32_t, double, double,
                     double *, double *, double *, double *, double *, uint32_t,
                     uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                     uint32_t, uint32_t, uint32_t, uint32_t, uint32_t)
    __ATTRIBUTELIST__((noinline, nothrow));

/* Global Variable Definitions and Initialization */
uint8_t FormatStringDouble[8] = {"%0.2lf "};
uint8_t FormatStringNewline[2] = {"\n"};

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

int16_t calculate_num_blocks(int16_t TotalSize, int16_t BlockSize) {
  return ((TotalSize + BlockSize) - 1) / BlockSize;
}

int main(int argc, char **argv) {
  int32_t DumpCode;
  int64_t Ni;
  int64_t Nj;
  int64_t Nk;
  int64_t Nl;
  uint8_t *MatrixA;
  uint8_t *MatrixB;
  uint8_t *MatrixC;
  uint8_t *MatrixD;
  uint8_t *MatrixTmp;
  int32_t call47;
  int32_t call66;

  DumpCode = atoi(argv[1]);
  Ni = atoi(argv[2]);
  Nj = atoi(argv[3]);
  Nk = atoi(argv[4]);
  Nl = atoi(argv[5]);
  MatrixA = malloc(Ni * Nk * 8);
  MatrixB = malloc(Nk * Nj * 8);
  MatrixC = malloc(Nl * Nj * 8);
  MatrixD = malloc(Ni * Nl * 8);
  MatrixTmp = malloc(Ni * Nj * 8);
  initialize_arrays(Ni, Nj, Nk, Nl, ((double *)MatrixA), ((double *)MatrixB),
                    ((double *)MatrixC), ((double *)MatrixD),
                    ((double *)MatrixTmp));
  ;
  run_gemm_kernels(Ni, Nj, Nk, Nl, 32412, 2123, ((double *)MatrixTmp),
                   ((double *)MatrixA), ((double *)MatrixB),
                   ((double *)MatrixC), ((double *)MatrixD));
  ;
  if (DumpCode == 1) {
    print_array(Ni, Nl, ((double *)MatrixD));
  }
  free(((uint8_t *)((double *)MatrixTmp)));
  free(((uint8_t *)((double *)MatrixA)));
  free(((uint8_t *)((double *)MatrixB)));
  free(((uint8_t *)((double *)MatrixC)));
  free(((uint8_t *)((double *)MatrixD)));
  return 0;
}

void initialize_arrays(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                       double *MatrixA, double *MatrixB, double *MatrixC,
                       double *MatrixD, double *MatrixTmp) {
  int64_t RowIndex;
  int64_t ColIndex;

  for (int64_t RowIndex = 0; RowIndex < Ni; RowIndex = RowIndex + 1) {

    for (int64_t ColIndex = 0; ColIndex < Nk; ColIndex = ColIndex + 1) {
      MatrixA[(RowIndex * Ni + ColIndex)] =
          (((double)(RowIndex) * (double)(ColIndex)) / (double)(Ni));
    }
  }

  for (int64_t RowIndex = 0; RowIndex < Nk; RowIndex = RowIndex + 1) {

    for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
      MatrixB[(RowIndex * Nk + ColIndex)] =
          (((double)(RowIndex) * (double)((ColIndex + 1))) / (double)(Nj));
    }
  }

  for (int64_t RowIndex = 0; RowIndex < Nl; RowIndex = RowIndex + 1) {

    for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
      MatrixC[(RowIndex * Nl + ColIndex)] =
          (((double)(RowIndex) * (double)((ColIndex + 3))) / (double)(Nl));
    }
  }

  for (int64_t RowIndex = 0; RowIndex < Ni; RowIndex = RowIndex + 1) {

    for (int64_t ColIndex = 0; ColIndex < Nl; ColIndex = ColIndex + 1) {
      MatrixD[(RowIndex * Ni + ColIndex)] =
          (((double)(RowIndex) * (double)((ColIndex + 2))) / (double)(Nk));
    }
  }

  for (int64_t RowIndex = 0; RowIndex < Ni; RowIndex = RowIndex + 1) {

    for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
      MatrixTmp[(RowIndex * Ni + ColIndex)] = 0;
    }
  }
  return;
}

void run_gemm_kernels(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                      double Alpha, double Beta, double *MatrixTmp,
                      double *MatrixA, double *MatrixB, double *MatrixC,
                      double *MatrixD) {
  struct Dim3 BlockDim;                /* Address-exposed local */
  struct Dim3 GridDim;                 /* Address-exposed local */
  struct Dim3 GridDimCopy;             /* Address-exposed local */
  struct Dim3 BlockDimCopy;            /* Address-exposed local */
  struct Dim3Coerced GridDimCoerced;   /* Address-exposed local */
  struct Dim3Coerced BlockDimCoerced;  /* Address-exposed local */
  struct Dim3 GridDimCopy2;            /* Address-exposed local */
  struct Dim3 BlockDimCopy2;           /* Address-exposed local */
  struct Dim3Coerced GridDimCoerced2;  /* Address-exposed local */
  struct Dim3Coerced BlockDimCoerced2; /* Address-exposed local */
  uint32_t BlockDimX;
  int32_t GridDimX;
  int32_t GridDimY;
  uint8_t LlvmPlaceholder1;
  uint8_t *LlvmPlaceholder2;
  uint8_t *LlvmPlaceholder3;
  uint8_t *LlvmPlaceholder4;
  uint32_t RowIndex;
  uint32_t ColIndex;
  uint32_t LoopK;
  uint32_t LoopL;
  int32_t GridDimX2;
  int32_t GridDimY2;
  uint8_t *LlvmPlaceholder5;
  uint8_t *LlvmPlaceholder6;
  uint8_t *LlvmPlaceholder7;
  uint8_t *LlvmPlaceholder8;

  BlockDimX = (256 / 32);
  BlockDim.X = BlockDimX;
  BlockDim.Y = 32;
  BlockDim.Z = 1;
  GridDimX = calculate_num_blocks(Ni, BlockDim.X);
  GridDimY = calculate_num_blocks(Nj, BlockDim.Y);
  GridDim.X = GridDimX;
  GridDim.Y = GridDimY;
  GridDim.Z = 1;
  memcpy(((uint8_t *)(&GridDimCopy)), ((uint8_t *)(&GridDim)), 12);
  memcpy(((uint8_t *)(&BlockDimCopy)), ((uint8_t *)(&BlockDim)), 12);
  memcpy(((uint8_t *)(&GridDimCoerced)), ((uint8_t *)(&GridDimCopy)), 12);
  memcpy(((uint8_t *)(&BlockDimCoerced)), ((uint8_t *)(&BlockDimCopy)), 12);
#pragma omp parallel for collapse(2)
  for (int32_t RowIndex = 0; RowIndex < GridDimX; RowIndex = RowIndex + 1) {

    for (int32_t ColIndex = 0; ColIndex < GridDimY; ColIndex = ColIndex + 1) {

      for (int32_t LoopK = 0; LoopK < 8; LoopK = LoopK + 1) {

        for (int32_t LoopL = 0; LoopL < 32; LoopL = LoopL + 1) {
          kernel_multiply_ab(Ni, Nj, Nk, Nl, Alpha, Beta, MatrixTmp, MatrixA,
                             MatrixB, MatrixC, MatrixD, GridDimX, GridDimY, 1,
                             BlockDimX, 32, 1, RowIndex, ColIndex, 0, LoopK,
                             LoopL, 0);
        }
      }
    }
  }
  GridDimX2 = calculate_num_blocks(Ni, BlockDim.X);
  GridDimY2 = calculate_num_blocks(Nl, BlockDim.Y);
  GridDim.X = GridDimX2;
  GridDim.Y = GridDimY2;
  GridDim.Z = 1;
  memcpy(((uint8_t *)(&GridDimCopy2)), ((uint8_t *)(&GridDim)), 12);
  memcpy(((uint8_t *)(&BlockDimCopy2)), ((uint8_t *)(&BlockDim)), 12);
  memcpy(((uint8_t *)(&GridDimCoerced2)), ((uint8_t *)(&GridDimCopy2)), 12);
  memcpy(((uint8_t *)(&BlockDimCoerced2)), ((uint8_t *)(&BlockDimCopy2)), 12);
#pragma omp parallel for collapse(2)
  for (int32_t RowIndex = 0; RowIndex < GridDimX2; RowIndex = RowIndex + 1) {

    for (int32_t ColIndex = 0; ColIndex < GridDimY2; ColIndex = ColIndex + 1) {

      for (int32_t LoopK = 0; LoopK < 8; LoopK = LoopK + 1) {

        for (int32_t LoopL = 0; LoopL < 32; LoopL = LoopL + 1) {
          kernel_update_d(Ni, Nj, Nk, Nl, Alpha, Beta, MatrixTmp, MatrixA,
                          MatrixB, MatrixC, MatrixD, GridDimX2, GridDimY2, 1,
                          BlockDimX, 32, 1, RowIndex, ColIndex, 0, LoopK, LoopL,
                          0);
        }
      }
    }
  }
  return;
}

void print_array(uint32_t Rows, uint32_t Cols, double *MatrixToPrint) {
  int64_t RowIndex;
  int64_t ColIndex;
  int32_t FprintfResult;

  for (int64_t RowIndex = 0; RowIndex < Rows; RowIndex = RowIndex + 1) {

    for (int64_t ColIndex = 0; ColIndex < Cols; ColIndex = ColIndex + 1) {
      uint32_t call = fprintf(stderr, (FormatStringDouble),
                              MatrixToPrint[(RowIndex * Rows + ColIndex)]);
      if ((int)(RowIndex * Rows + ColIndex) % (int)20 == 0) {
        fprintf(stderr, (FormatStringNewline));
      }
    }
  }
  fprintf(stderr, (FormatStringNewline));
}

void kernel_multiply_ab(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                        double Alpha, double Beta, double *MatrixTmp,
                        double *MatrixA, double *MatrixB, double *MatrixC,
                        double *MatrixD, uint32_t GridDimX, uint32_t GridDimY,
                        uint32_t GridDimZ, uint32_t BlockDimX,
                        uint32_t BlockDimY, uint32_t BlockDimZ,
                        uint32_t BlockIdxX, uint32_t BlockIdxY,
                        uint32_t BlockIdxZ, uint32_t ThreadIdxX,
                        uint32_t ThreadIdxY, uint32_t ThreadIdxZ) {
  int32_t RowIndex;
  int32_t ColIndex;
  int64_t LoopK;
  double DotProduct;

  RowIndex = BlockDimX * BlockIdxX + ThreadIdxX;
  ColIndex = BlockDimY * BlockIdxY + ThreadIdxY;
  if (RowIndex < Ni) {
    if (ColIndex < Nj) {
      DotProduct = 0;

      for (int64_t LoopK = 0; LoopK < Nk; LoopK = LoopK + 1) {
        DotProduct = (DotProduct + ((Alpha * MatrixA[(RowIndex * Nk + LoopK)]) *
                                    MatrixB[(LoopK * Nj + ColIndex)]));
      }
      MatrixTmp[(RowIndex * Nj + ColIndex)] = DotProduct;
    }
  }
  return;
}

void kernel_update_d(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                     double Alpha, double Beta, double *MatrixTmp,
                     double *MatrixA, double *MatrixB, double *MatrixC,
                     double *MatrixD, uint32_t GridDimX, uint32_t GridDimY,
                     uint32_t GridDimZ, uint32_t BlockDimX, uint32_t BlockDimY,
                     uint32_t BlockDimZ, uint32_t BlockIdxX, uint32_t BlockIdxY,
                     uint32_t BlockIdxZ, uint32_t ThreadIdxX,
                     uint32_t ThreadIdxY, uint32_t ThreadIdxZ) {
  int32_t RowIndex;
  int32_t LoopL;
  double DotProduct;
  int64_t ColIndex;

  RowIndex = BlockDimX * BlockIdxX + ThreadIdxX;
  LoopL = BlockDimY * BlockIdxY + ThreadIdxY;
  if (RowIndex < Ni) {
    if (LoopL < Nl) {
      DotProduct = (MatrixD[(RowIndex * Nj + LoopL)] * Beta);

      for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
        DotProduct = (DotProduct + (MatrixTmp[(RowIndex * Nj + ColIndex)] *
                                    MatrixC[(ColIndex * Nl + LoopL)]));
      }
      MatrixD[(RowIndex * Nl + LoopL)] = DotProduct;
    }
  }
  return;
}
