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
struct Dim3; // Structure likely representing dimensions (e.g., grid/block)
struct Dim3Coerced; // Structure likely for type casting/memory layout
                    // compatibility

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
// Standard C FILE structure definition (opaque)
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
// Represents 3D dimensions, similar to CUDA's dim3
struct Dim3 {
  uint32_t X;
  uint32_t Y;
  uint32_t Z;
};
// Used for memory copying/casting of Dim3, likely for ABI compatibility
struct Dim3Coerced {
  uint64_t Data1;
  uint32_t Data2;
};

/* External Global Variable Declarations */

/* Function Declarations */
// CUDA API function declarations (likely stubs or linked elsewhere if not a
// pure CPU build)
uint32_t cudaSetupArgument(uint8_t, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t *);
// Calculates number of blocks needed based on total size and block size
int16_t calculate_num_blocks(int16_t, int16_t)
    __ATTRIBUTELIST__((noinline, nothrow));
// Main program entry point
int main(int, char **) __ATTRIBUTELIST__((noinline));
// Initializes input matrices
void initialize_arrays(uint32_t, uint32_t, uint32_t, uint32_t, double *,
                       double *, double *, double *, double *)
    __ATTRIBUTELIST__((noinline, nothrow));
// CUDA API function declarations
uint32_t cudaMemcpy(uint8_t *, uint8_t *, uint64_t, uint32_t);
// Executes the core GEMM computation using OpenMP parallel loops calling kernel
// functions
void run_gemm_kernels(uint32_t, uint32_t, uint32_t, uint32_t, double, double,
                      double *, double *, double *, double *, double *)
    __ATTRIBUTELIST__((noinline));
// CUDA API function declarations
uint32_t cudaFree(uint8_t *);
// Prints the content of a matrix
void print_array(uint32_t, uint32_t, double *) __ATTRIBUTELIST__((noinline));
// CUDA API function declarations
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t,
                           void *);
uint32_t cudaMalloc(uint8_t **, uint64_t);
// Kernel function performing the first part of GEMM: Tmp = alpha * A * B
void kernel_multiply_ab(uint32_t, uint32_t, uint32_t, uint32_t, double, double,
                        double *, double *, double *, double *, double *,
                        uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                        uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                        uint32_t, uint32_t)
    __ATTRIBUTELIST__((noinline, nothrow));
// Kernel function performing the second part of GEMM: D = beta * D + Tmp * C
void kernel_update_d(uint32_t, uint32_t, uint32_t, uint32_t, double, double,
                     double *, double *, double *, double *, double *, uint32_t,
                     uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                     uint32_t, uint32_t, uint32_t, uint32_t, uint32_t)
    __ATTRIBUTELIST__((noinline, nothrow));

/* Global Variable Definitions and Initialization */
uint8_t FormatStringDouble[8] = {
    "%0.2lf "};                          // Format string for printing doubles
uint8_t FormatStringNewline[2] = {"\n"}; // Format string for newline

/* LLVM Intrinsic Builtin Function Bodies */
// These are likely compiler intrinsics for basic arithmetic operations
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

// Helper function to calculate grid dimensions (similar to CUDA)
int16_t calculate_num_blocks(int16_t TotalSize, int16_t BlockSize) {
  // Ceiling division: (TotalSize + BlockSize - 1) / BlockSize
  return ((TotalSize + BlockSize) - 1) / BlockSize;
}

int main(int argc, char **argv) {
  int32_t DumpCode; // Flag to enable printing output matrix
  // Matrix dimensions read from command line arguments
  int64_t Ni;
  int64_t Nj;
  int64_t Nk;
  int64_t Nl;
  // Pointers to matrix data (allocated on heap)
  uint8_t *MatrixA;
  uint8_t *MatrixB;
  uint8_t *MatrixC;
  uint8_t *MatrixD;   // Output matrix
  uint8_t *MatrixTmp; // Temporary matrix for intermediate result
  int32_t call47;     // Placeholder variable, likely unused artifact
  int32_t call66;     // Placeholder variable, likely unused artifact

  // Parse command line arguments
  DumpCode = atoi(argv[1]);
  Ni = atoi(argv[2]);
  Nj = atoi(argv[3]);
  Nk = atoi(argv[4]);
  Nl = atoi(argv[5]);
  // Allocate memory for matrices (size * sizeof(double))
  MatrixA = malloc(Ni * Nk * 8);
  MatrixB = malloc(Nk * Nj * 8);
  MatrixC = malloc(Nl * Nj * 8); // Note: Dimensions seem swapped (Nl*Nj vs
                                 // Nj*Nl) - potential bug or specific layout
  MatrixD = malloc(Ni * Nl * 8);
  MatrixTmp = malloc(Ni * Nj * 8);
  // Initialize matrices with data
  initialize_arrays(Ni, Nj, Nk, Nl, ((double *)MatrixA), ((double *)MatrixB),
                    ((double *)MatrixC), ((double *)MatrixD),
                    ((double *)MatrixTmp));
  ; // Empty statement artifact
  // Perform the main computation (GEMM) using OpenMP
  run_gemm_kernels(Ni, Nj, Nk, Nl, 32412, 2123, ((double *)MatrixTmp),
                   ((double *)MatrixA), ((double *)MatrixB),
                   ((double *)MatrixC), ((double *)MatrixD));
  ; // Empty statement artifact
  // Conditionally print the output matrix D
  if (DumpCode == 1) {
    print_array(Ni, Nl, ((double *)MatrixD));
  }
  // Free allocated memory
  free(((uint8_t *)((double *)MatrixTmp)));
  free(((uint8_t *)((double *)MatrixA)));
  free(((uint8_t *)((double *)MatrixB)));
  free(((uint8_t *)((double *)MatrixC)));
  free(((uint8_t *)((double *)MatrixD)));
  return 0;
}

// Initializes matrices A, B, C, D, Tmp sequentially
void initialize_arrays(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                       double *MatrixA, double *MatrixB, double *MatrixC,
                       double *MatrixD, double *MatrixTmp) {
  int64_t RowIndex;
  int64_t ColIndex;

  // Initialize Matrix A
  for (int64_t RowIndex = 0; RowIndex < Ni; RowIndex = RowIndex + 1) {
    for (int64_t ColIndex = 0; ColIndex < Nk; ColIndex = ColIndex + 1) {
      // Note: Indexing uses Ni as stride, assumes row-major layout for
      // A[Ni][Nk]
      MatrixA[(RowIndex * Ni + ColIndex)] =
          (((double)(RowIndex) * (double)(ColIndex)) / (double)(Ni));
    }
  }

  // Initialize Matrix B
  for (int64_t RowIndex = 0; RowIndex < Nk; RowIndex = RowIndex + 1) {
    for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
      // Note: Indexing uses Nk as stride, assumes row-major layout for
      // B[Nk][Nj]
      MatrixB[(RowIndex * Nk + ColIndex)] =
          (((double)(RowIndex) * (double)((ColIndex + 1))) / (double)(Nj));
    }
  }

  // Initialize Matrix C
  for (int64_t RowIndex = 0; RowIndex < Nl; RowIndex = RowIndex + 1) {
    for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
      // Note: Indexing uses Nl as stride, assumes row-major layout for
      // C[Nl][Nj]
      MatrixC[(RowIndex * Nl + ColIndex)] =
          (((double)(RowIndex) * (double)((ColIndex + 3))) / (double)(Nl));
    }
  }

  // Initialize Matrix D
  for (int64_t RowIndex = 0; RowIndex < Ni; RowIndex = RowIndex + 1) {
    for (int64_t ColIndex = 0; ColIndex < Nl; ColIndex = ColIndex + 1) {
      // Note: Indexing uses Ni as stride, assumes row-major layout for
      // D[Ni][Nl]
      MatrixD[(RowIndex * Ni + ColIndex)] =
          (((double)(RowIndex) * (double)((ColIndex + 2))) /
           (double)(Nk)); // Denominator Nk seems unusual here
    }
  }

  // Initialize Matrix Tmp to zeros
  for (int64_t RowIndex = 0; RowIndex < Ni; RowIndex = RowIndex + 1) {
    for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
      // Note: Indexing uses Ni as stride, assumes row-major layout for
      // Tmp[Ni][Nj]
      MatrixTmp[(RowIndex * Ni + ColIndex)] = 0;
    }
  }
  return;
}

// Orchestrates the parallel execution of GEMM kernels using OpenMP
void run_gemm_kernels(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                      double Alpha, double Beta, double *MatrixTmp,
                      double *MatrixA, double *MatrixB, double *MatrixC,
                      double *MatrixD) {
  // Structures mimicking CUDA block/grid dimensions
  struct Dim3 BlockDim; /* Address-exposed local */
  struct Dim3 GridDim;  /* Address-exposed local */
  // Temporary copies, likely artifacts from translation or for specific ABI
  // needs
  struct Dim3 GridDimCopy;             /* Address-exposed local */
  struct Dim3 BlockDimCopy;            /* Address-exposed local */
  struct Dim3Coerced GridDimCoerced;   /* Address-exposed local */
  struct Dim3Coerced BlockDimCoerced;  /* Address-exposed local */
  struct Dim3 GridDimCopy2;            /* Address-exposed local */
  struct Dim3 BlockDimCopy2;           /* Address-exposed local */
  struct Dim3Coerced GridDimCoerced2;  /* Address-exposed local */
  struct Dim3Coerced BlockDimCoerced2; /* Address-exposed local */
  // Dimensions for thread mapping (mimicking CUDA block dimensions)
  uint32_t BlockDimX;
  // Dimensions for loop bounds (mimicking CUDA grid dimensions)
  int32_t GridDimX;
  int32_t GridDimY;
  // Placeholder variables, likely unused artifacts
  uint8_t LlvmPlaceholder1;
  uint8_t *LlvmPlaceholder2;
  uint8_t *LlvmPlaceholder3;
  uint8_t *LlvmPlaceholder4;
  // Loop indices used within the parallel regions
  uint32_t RowIndex;
  uint32_t ColIndex;
  uint32_t LoopK; // Inner loop index within the parallel region, maps to
                  // kernel's ThreadIdxX
  uint32_t LoopL; // Inner loop index within the parallel region, maps to
                  // kernel's ThreadIdxY
  // Grid dimensions for the second kernel launch
  int32_t GridDimX2;
  int32_t GridDimY2;
  // Placeholder variables, likely unused artifacts
  uint8_t *LlvmPlaceholder5;
  uint8_t *LlvmPlaceholder6;
  uint8_t *LlvmPlaceholder7;
  uint8_t *LlvmPlaceholder8;

  // --- First Kernel Launch: Tmp = alpha * A * B ---

  // Define block dimensions (fixed size)
  BlockDimX = (256 / 32); // 8
  BlockDim.X = BlockDimX;
  BlockDim.Y = 32;
  BlockDim.Z = 1;
  // Calculate grid dimensions based on matrix sizes and block dimensions
  GridDimX =
      calculate_num_blocks(Ni, BlockDim.X); // Number of blocks in X dimension
  GridDimY =
      calculate_num_blocks(Nj, BlockDim.Y); // Number of blocks in Y dimension
  GridDim.X = GridDimX;
  GridDim.Y = GridDimY;
  GridDim.Z = 1;
  // Memory copies likely related to original code structure or ABI, not
  // functionally critical for OpenMP logic
  memcpy(((uint8_t *)(&GridDimCopy)), ((uint8_t *)(&GridDim)), 12);
  memcpy(((uint8_t *)(&BlockDimCopy)), ((uint8_t *)(&BlockDim)), 12);
  memcpy(((uint8_t *)(&GridDimCoerced)), ((uint8_t *)(&GridDimCopy)), 12);
  memcpy(((uint8_t *)(&BlockDimCoerced)), ((uint8_t *)(&BlockDimCopy)), 12);

  // Parallel region 1: Executes kernel_multiply_ab using OpenMP threads
  // The outer two loops (RowIndex, ColIndex) are parallelized across threads.
  // collapse(2) merges these two loops into a single iteration space for better
  // load balancing.
#pragma omp parallel for collapse(2)
  for (int32_t RowIndex = 0; RowIndex < GridDimX;
       RowIndex = RowIndex + 1) { // Iterates over blocks in X
    for (int32_t ColIndex = 0; ColIndex < GridDimY;
         ColIndex = ColIndex + 1) { // Iterates over blocks in Y
      // Inner loops mimic CUDA threads within a block (iterate 8x32 = 256 times
      // per outer loop pair)
      for (int32_t LoopK = 0; LoopK < 8;
           LoopK = LoopK + 1) { // Mimics threadIdx.x
        for (int32_t LoopL = 0; LoopL < 32;
             LoopL = LoopL + 1) { // Mimics threadIdx.y
          // Each call to kernel_multiply_ab computes one element (or part) of
          // the result matrix Tmp. Indices (RowIndex, ColIndex, LoopK, LoopL)
          // map to CUDA's blockIdx and threadIdx.
          kernel_multiply_ab(Ni, Nj, Nk, Nl, Alpha, Beta, MatrixTmp, MatrixA,
                             MatrixB, MatrixC, MatrixD, GridDimX, GridDimY, 1,
                             BlockDimX, 32, 1, RowIndex, ColIndex, 0, LoopK,
                             LoopL, 0);
        }
      }
    }
  } // End of first parallel region

  // --- Second Kernel Launch: D = beta * D + Tmp * C ---

  // Recalculate grid dimensions for the second kernel based on D's dimensions
  // (Ni x Nl)
  GridDimX2 =
      calculate_num_blocks(Ni, BlockDim.X); // Number of blocks in X dimension
  GridDimY2 = calculate_num_blocks(
      Nl, BlockDim.Y); // Number of blocks in Y dimension (using Nl)
  GridDim.X = GridDimX2;
  GridDim.Y = GridDimY2;
  GridDim.Z = 1;
  // Memory copies likely related to original code structure or ABI
  memcpy(((uint8_t *)(&GridDimCopy2)), ((uint8_t *)(&GridDim)), 12);
  memcpy(((uint8_t *)(&BlockDimCopy2)), ((uint8_t *)(&BlockDim)), 12);
  memcpy(((uint8_t *)(&GridDimCoerced2)), ((uint8_t *)(&GridDimCopy2)), 12);
  memcpy(((uint8_t *)(&BlockDimCoerced2)), ((uint8_t *)(&BlockDimCopy2)), 12);

  // Parallel region 2: Executes kernel_update_d using OpenMP threads
  // Similar parallelization strategy as the first kernel.
#pragma omp parallel for collapse(2)
  for (int32_t RowIndex = 0; RowIndex < GridDimX2;
       RowIndex = RowIndex + 1) { // Iterates over blocks in X
    for (int32_t ColIndex = 0; ColIndex < GridDimY2;
         ColIndex = ColIndex + 1) { // Iterates over blocks in Y
      // Inner loops mimic CUDA threads within a block
      for (int32_t LoopK = 0; LoopK < 8;
           LoopK = LoopK + 1) { // Mimics threadIdx.x
        for (int32_t LoopL = 0; LoopL < 32;
             LoopL = LoopL + 1) { // Mimics threadIdx.y
          // Each call to kernel_update_d computes one element of the final
          // matrix D.
          kernel_update_d(Ni, Nj, Nk, Nl, Alpha, Beta, MatrixTmp, MatrixA,
                          MatrixB, MatrixC, MatrixD, GridDimX2, GridDimY2, 1,
                          BlockDimX, 32, 1, RowIndex, ColIndex, 0, LoopK, LoopL,
                          0);
        }
      }
    }
  } // End of second parallel region
  return;
}

// Prints the elements of a 2D matrix (assumed row-major)
void print_array(uint32_t Rows, uint32_t Cols, double *MatrixToPrint) {
  int64_t RowIndex;
  int64_t ColIndex;
  int32_t FprintfResult; // Stores return value of fprintf, not used

  for (int64_t RowIndex = 0; RowIndex < Rows; RowIndex = RowIndex + 1) {
    for (int64_t ColIndex = 0; ColIndex < Cols; ColIndex = ColIndex + 1) {
      // Note: Indexing uses Rows as stride, assumes MatrixToPrint[Rows][Cols]
      // layout
      uint32_t call = fprintf(stderr, (FormatStringDouble),
                              MatrixToPrint[(RowIndex * Rows + ColIndex)]);
      // Print a newline every 20 elements for better readability
      if ((int)(RowIndex * Rows + ColIndex) % (int)20 == 0) {
        fprintf(stderr, (FormatStringNewline));
      }
    }
  }
  // Print a final newline
  fprintf(stderr, (FormatStringNewline));
}

// Kernel function: Computes a portion of Tmp = alpha * A * B
// This function is called repeatedly by threads within the first OpenMP
// parallel region.
void kernel_multiply_ab(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                        double Alpha, double Beta, double *MatrixTmp,
                        double *MatrixA, double *MatrixB, double *MatrixC,
                        double *MatrixD, uint32_t GridDimX, uint32_t GridDimY,
                        uint32_t GridDimZ, uint32_t BlockDimX,
                        uint32_t BlockDimY, uint32_t BlockDimZ,
                        uint32_t BlockIdxX, uint32_t BlockIdxY,
                        uint32_t BlockIdxZ, uint32_t ThreadIdxX,
                        uint32_t ThreadIdxY, uint32_t ThreadIdxZ) {
  // Calculate the global row and column indices this "thread" is responsible
  // for
  int32_t RowIndex;  // Global row index in Tmp and A
  int32_t ColIndex;  // Global column index in Tmp and B
  int64_t LoopK;     // Index for the inner dimension of multiplication
  double DotProduct; // Accumulator for the dot product

  // Map block/thread indices to global matrix indices (similar to CUDA)
  RowIndex = BlockDimX * BlockIdxX +
             ThreadIdxX; // ni = blockDim.x * blockIdx.x + threadIdx.x
  ColIndex = BlockDimY * BlockIdxY +
             ThreadIdxY; // nj = blockDim.y * blockIdx.y + threadIdx.y

  // Boundary check: Ensure indices are within matrix dimensions
  if (RowIndex < Ni) {
    if (ColIndex < Nj) {
      DotProduct = 0;
      // Perform dot product: Tmp[RowIndex][ColIndex] = sum(A[RowIndex][k] *
      // B[k][ColIndex])
      for (int64_t LoopK = 0; LoopK < Nk; LoopK = LoopK + 1) {
        // Note: Indexing assumes specific row-major layouts as noted in
        // initialize_arrays
        DotProduct =
            (DotProduct +
             ((Alpha * MatrixA[(RowIndex * Nk + LoopK)]) * // A[RowIndex][LoopK]
                                                           // (stride Nk?)
              MatrixB[(LoopK * Nj + ColIndex)])); // B[LoopK][ColIndex] (stride
                                                  // Nj?)
        // Potential indexing mismatch if strides don't match matrix dimensions
        // used in malloc/init.
      }
      // Store the computed dot product (scaled by Alpha) into the temporary
      // matrix Note: Indexing uses Nj as stride, assumes Tmp[Ni][Nj] layout
      MatrixTmp[(RowIndex * Nj + ColIndex)] = DotProduct;
    }
  }
  return;
}

// Kernel function: Computes a portion of D = beta * D + Tmp * C
// This function is called repeatedly by threads within the second OpenMP
// parallel region.
void kernel_update_d(uint32_t Ni, uint32_t Nj, uint32_t Nk, uint32_t Nl,
                     double Alpha, double Beta, double *MatrixTmp,
                     double *MatrixA, double *MatrixB, double *MatrixC,
                     double *MatrixD, uint32_t GridDimX, uint32_t GridDimY,
                     uint32_t GridDimZ, uint32_t BlockDimX, uint32_t BlockDimY,
                     uint32_t BlockDimZ, uint32_t BlockIdxX, uint32_t BlockIdxY,
                     uint32_t BlockIdxZ, uint32_t ThreadIdxX,
                     uint32_t ThreadIdxY, uint32_t ThreadIdxZ) {
  // Calculate the global row and column indices this "thread" is responsible
  // for
  int32_t RowIndex;  // Global row index in D and Tmp
  int32_t LoopL;     // Global column index in D and C (renamed from ColIndex in
                     // kernel_multiply_ab context)
  double DotProduct; // Accumulator for the dot product
  int64_t ColIndex;  // Index for the inner dimension of multiplication (Nj)

  // Map block/thread indices to global matrix indices
  RowIndex = BlockDimX * BlockIdxX +
             ThreadIdxX; // ni = blockDim.x * blockIdx.x + threadIdx.x
  LoopL = BlockDimY * BlockIdxY +
          ThreadIdxY; // nl = blockDim.y * blockIdx.y + threadIdx.y

  // Boundary check: Ensure indices are within matrix dimensions
  if (RowIndex < Ni) {
    if (LoopL < Nl) {
      // Initialize dot product with scaled value of existing D element
      // Note: Indexing uses Nj as stride for D, assumes D[Ni][Nl] layout but
      // uses Nj stride? Potential issue.
      DotProduct = (MatrixD[(RowIndex * Nj + LoopL)] * Beta);

      // Perform dot product: sum(Tmp[RowIndex][j] * C[j][LoopL])
      for (int64_t ColIndex = 0; ColIndex < Nj; ColIndex = ColIndex + 1) {
        // Note: Indexing assumes specific row-major layouts. Check consistency.
        DotProduct = (DotProduct +
                      (MatrixTmp[(RowIndex * Nj + ColIndex)] * // Tmp[RowIndex][ColIndex]
                                                               // (stride Nj?)
                       MatrixC[(ColIndex * Nl + LoopL)])); // C[ColIndex][LoopL]
                                                           // (stride Nl?)
      }
      // Store the final computed value into the output matrix D
      // Note: Indexing uses Nl as stride for D, assumes D[Ni][Nl] layout.
      MatrixD[(RowIndex * Nl + LoopL)] = DotProduct;
    }
  }
  return;
}
