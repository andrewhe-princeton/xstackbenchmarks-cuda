; ModuleID = 'laplace3d.cu'
source_filename = "laplace3d.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

$_ZSt4sqrtf = comdat any

@.str = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"nx\00", align 1
@.str.2 = private unnamed_addr constant [47 x i8] c"Illegal argument - nx must be greater than 99\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ny\00", align 1
@.str.4 = private unnamed_addr constant [47 x i8] c"Illegal argument - ny must be greater than 99\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"nz\00", align 1
@.str.6 = private unnamed_addr constant [47 x i8] c"Illegal argument - nz must be greater than 99\0A\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"repeat\00", align 1
@.str.8 = private unnamed_addr constant [53 x i8] c"Illegal argument - repeat must be greater than zero\0A\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"\0AGrid dimensions: %d x %d x %d\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.10 = private unnamed_addr constant [21 x i8] c"There is no device.\0A\00", align 1
@.str.11 = private unnamed_addr constant [37 x i8] c"There is no device supporting CUDA.\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"\0A dimGrid  = %d %d %d \0A\00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c" dimBlock = %d %d %d \0A\00", align 1
@.str.14 = private unnamed_addr constant [19 x i8] c"\0A rms error = %f \0A\00", align 1
@.str.15 = private unnamed_addr constant [35 x i8] c"CUDA_SAFE_CALL( cudaFree(d_u1) );\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.16 = private unnamed_addr constant [35 x i8] c"CUDA_SAFE_CALL( cudaFree(d_u2) );\0A\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"free(h_u1);\0A\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"free(h_u2);\0A\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"free(h_u3);\0A\00", align 1
@.str.20 = private unnamed_addr constant [31 x i8] c"Usage:  laplace3d [OPTION]...\0A\00", align 1
@.str.21 = private unnamed_addr constant [34 x i8] c"6-point stencil 3D Laplace test \0A\00", align 1
@.str.22 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.23 = private unnamed_addr constant [51 x i8] c"Example: run 100 iterations on a 256x128x128 grid\0A\00", align 1
@.str.24 = private unnamed_addr constant [53 x i8] c"./laplace3d --nx=256 --ny=128 --nz=128 --repeat=100\0A\00", align 1
@.str.25 = private unnamed_addr constant [10 x i8] c"Options:\0A\00", align 1
@.str.26 = private unnamed_addr constant [33 x i8] c"--help\09\09\09Display this help menu\0A\00", align 1
@.str.27 = private unnamed_addr constant [25 x i8] c"--nx=[SIZE]\09\09Grid width\0A\00", align 1
@.str.28 = private unnamed_addr constant [26 x i8] c"--ny=[SIZE]\09\09Grid height\0A\00", align 1
@.str.29 = private unnamed_addr constant [25 x i8] c"--nz=[SIZE]\09\09Grid depth\0A\00", align 1
@.str.30 = private unnamed_addr constant [40 x i8] c"--repeat=[COUNT]\09Number of repetitions\0A\00", align 1

; Function Attrs: noinline uwtable
define dso_local void @_Z13GPU_laplace3diiiiPfS_(i32 %NX, i32 %NY, i32 %NZ, i32 %pitch, float* %d_u1, float* %d_u2) #0 !dbg !611 {
entry:
  %NX.addr = alloca i32, align 4
  %NY.addr = alloca i32, align 4
  %NZ.addr = alloca i32, align 4
  %pitch.addr = alloca i32, align 4
  %d_u1.addr = alloca float*, align 8
  %d_u2.addr = alloca float*, align 8
  store i32 %NX, i32* %NX.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %NX.addr, metadata !616, metadata !DIExpression()), !dbg !617
  store i32 %NY, i32* %NY.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %NY.addr, metadata !618, metadata !DIExpression()), !dbg !619
  store i32 %NZ, i32* %NZ.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %NZ.addr, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 %pitch, i32* %pitch.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pitch.addr, metadata !622, metadata !DIExpression()), !dbg !623
  store float* %d_u1, float** %d_u1.addr, align 8
  call void @llvm.dbg.declare(metadata float** %d_u1.addr, metadata !624, metadata !DIExpression()), !dbg !625
  store float* %d_u2, float** %d_u2.addr, align 8
  call void @llvm.dbg.declare(metadata float** %d_u2.addr, metadata !626, metadata !DIExpression()), !dbg !627
  %0 = bitcast i32* %NX.addr to i8*, !dbg !628
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !628
  %2 = icmp eq i32 %1, 0, !dbg !628
  br i1 %2, label %setup.next, label %setup.end, !dbg !628

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %NY.addr to i8*, !dbg !628
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !628
  %5 = icmp eq i32 %4, 0, !dbg !628
  br i1 %5, label %setup.next1, label %setup.end, !dbg !628

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %NZ.addr to i8*, !dbg !628
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !628
  %8 = icmp eq i32 %7, 0, !dbg !628
  br i1 %8, label %setup.next2, label %setup.end, !dbg !628

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %pitch.addr to i8*, !dbg !628
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 12), !dbg !628
  %11 = icmp eq i32 %10, 0, !dbg !628
  br i1 %11, label %setup.next3, label %setup.end, !dbg !628

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float** %d_u1.addr to i8*, !dbg !628
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 16), !dbg !628
  %14 = icmp eq i32 %13, 0, !dbg !628
  br i1 %14, label %setup.next4, label %setup.end, !dbg !628

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float** %d_u2.addr to i8*, !dbg !628
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 24), !dbg !628
  %17 = icmp eq i32 %16, 0, !dbg !628
  br i1 %17, label %setup.next5, label %setup.end, !dbg !628

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, i32, float*, float*)* @_Z13GPU_laplace3diiiiPfS_ to i8*)), !dbg !628
  br label %setup.end, !dbg !628

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !629
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline nounwind uwtable
define dso_local void @Gold_laplace3d(i32 %NX, i32 %NY, i32 %NZ, float* %u1, float* %u2) #2 !dbg !630 {
entry:
  %NX.addr = alloca i32, align 4
  %NY.addr = alloca i32, align 4
  %NZ.addr = alloca i32, align 4
  %u1.addr = alloca float*, align 8
  %u2.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %ind = alloca i32, align 4
  %sixth = alloca float, align 4
  store i32 %NX, i32* %NX.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %NX.addr, metadata !633, metadata !DIExpression()), !dbg !634
  store i32 %NY, i32* %NY.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %NY.addr, metadata !635, metadata !DIExpression()), !dbg !636
  store i32 %NZ, i32* %NZ.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %NZ.addr, metadata !637, metadata !DIExpression()), !dbg !638
  store float* %u1, float** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata float** %u1.addr, metadata !639, metadata !DIExpression()), !dbg !640
  store float* %u2, float** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata float** %u2.addr, metadata !641, metadata !DIExpression()), !dbg !642
  call void @llvm.dbg.declare(metadata i32* %i, metadata !643, metadata !DIExpression()), !dbg !644
  call void @llvm.dbg.declare(metadata i32* %j, metadata !645, metadata !DIExpression()), !dbg !646
  call void @llvm.dbg.declare(metadata i32* %k, metadata !647, metadata !DIExpression()), !dbg !648
  call void @llvm.dbg.declare(metadata i32* %ind, metadata !649, metadata !DIExpression()), !dbg !650
  call void @llvm.dbg.declare(metadata float* %sixth, metadata !651, metadata !DIExpression()), !dbg !652
  store float 0x3FC5555560000000, float* %sixth, align 4, !dbg !652
  store i32 0, i32* %k, align 4, !dbg !653
  br label %for.cond, !dbg !655

for.cond:                                         ; preds = %for.inc55, %entry
  %0 = load i32, i32* %k, align 4, !dbg !656
  %1 = load i32, i32* %NZ.addr, align 4, !dbg !658
  %cmp = icmp slt i32 %0, %1, !dbg !659
  br i1 %cmp, label %for.body, label %for.end57, !dbg !660

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !661
  br label %for.cond1, !dbg !664

for.cond1:                                        ; preds = %for.inc52, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !665
  %3 = load i32, i32* %NY.addr, align 4, !dbg !667
  %cmp2 = icmp slt i32 %2, %3, !dbg !668
  br i1 %cmp2, label %for.body3, label %for.end54, !dbg !669

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %i, align 4, !dbg !670
  br label %for.cond4, !dbg !673

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, i32* %i, align 4, !dbg !674
  %5 = load i32, i32* %NX.addr, align 4, !dbg !676
  %cmp5 = icmp slt i32 %4, %5, !dbg !677
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !678

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, i32* %i, align 4, !dbg !679
  %7 = load i32, i32* %j, align 4, !dbg !681
  %8 = load i32, i32* %NX.addr, align 4, !dbg !682
  %mul = mul nsw i32 %7, %8, !dbg !683
  %add = add nsw i32 %6, %mul, !dbg !684
  %9 = load i32, i32* %k, align 4, !dbg !685
  %10 = load i32, i32* %NX.addr, align 4, !dbg !686
  %mul7 = mul nsw i32 %9, %10, !dbg !687
  %11 = load i32, i32* %NY.addr, align 4, !dbg !688
  %mul8 = mul nsw i32 %mul7, %11, !dbg !689
  %add9 = add nsw i32 %add, %mul8, !dbg !690
  store i32 %add9, i32* %ind, align 4, !dbg !691
  %12 = load i32, i32* %i, align 4, !dbg !692
  %cmp10 = icmp eq i32 %12, 0, !dbg !694
  br i1 %cmp10, label %if.then, label %lor.lhs.false, !dbg !695

lor.lhs.false:                                    ; preds = %for.body6
  %13 = load i32, i32* %i, align 4, !dbg !696
  %14 = load i32, i32* %NX.addr, align 4, !dbg !697
  %sub = sub nsw i32 %14, 1, !dbg !698
  %cmp11 = icmp eq i32 %13, %sub, !dbg !699
  br i1 %cmp11, label %if.then, label %lor.lhs.false12, !dbg !700

lor.lhs.false12:                                  ; preds = %lor.lhs.false
  %15 = load i32, i32* %j, align 4, !dbg !701
  %cmp13 = icmp eq i32 %15, 0, !dbg !702
  br i1 %cmp13, label %if.then, label %lor.lhs.false14, !dbg !703

lor.lhs.false14:                                  ; preds = %lor.lhs.false12
  %16 = load i32, i32* %j, align 4, !dbg !704
  %17 = load i32, i32* %NY.addr, align 4, !dbg !705
  %sub15 = sub nsw i32 %17, 1, !dbg !706
  %cmp16 = icmp eq i32 %16, %sub15, !dbg !707
  br i1 %cmp16, label %if.then, label %lor.lhs.false17, !dbg !708

lor.lhs.false17:                                  ; preds = %lor.lhs.false14
  %18 = load i32, i32* %k, align 4, !dbg !709
  %cmp18 = icmp eq i32 %18, 0, !dbg !710
  br i1 %cmp18, label %if.then, label %lor.lhs.false19, !dbg !711

lor.lhs.false19:                                  ; preds = %lor.lhs.false17
  %19 = load i32, i32* %k, align 4, !dbg !712
  %20 = load i32, i32* %NZ.addr, align 4, !dbg !713
  %sub20 = sub nsw i32 %20, 1, !dbg !714
  %cmp21 = icmp eq i32 %19, %sub20, !dbg !715
  br i1 %cmp21, label %if.then, label %if.else, !dbg !716

if.then:                                          ; preds = %lor.lhs.false19, %lor.lhs.false17, %lor.lhs.false14, %lor.lhs.false12, %lor.lhs.false, %for.body6
  %21 = load float*, float** %u1.addr, align 8, !dbg !717
  %22 = load i32, i32* %ind, align 4, !dbg !719
  %idxprom = sext i32 %22 to i64, !dbg !717
  %arrayidx = getelementptr inbounds float, float* %21, i64 %idxprom, !dbg !717
  %23 = load float, float* %arrayidx, align 4, !dbg !717
  %24 = load float*, float** %u2.addr, align 8, !dbg !720
  %25 = load i32, i32* %ind, align 4, !dbg !721
  %idxprom22 = sext i32 %25 to i64, !dbg !720
  %arrayidx23 = getelementptr inbounds float, float* %24, i64 %idxprom22, !dbg !720
  store float %23, float* %arrayidx23, align 4, !dbg !722
  br label %if.end, !dbg !723

if.else:                                          ; preds = %lor.lhs.false19
  %26 = load float*, float** %u1.addr, align 8, !dbg !724
  %27 = load i32, i32* %ind, align 4, !dbg !726
  %sub24 = sub nsw i32 %27, 1, !dbg !727
  %idxprom25 = sext i32 %sub24 to i64, !dbg !724
  %arrayidx26 = getelementptr inbounds float, float* %26, i64 %idxprom25, !dbg !724
  %28 = load float, float* %arrayidx26, align 4, !dbg !724
  %29 = load float*, float** %u1.addr, align 8, !dbg !728
  %30 = load i32, i32* %ind, align 4, !dbg !729
  %add27 = add nsw i32 %30, 1, !dbg !730
  %idxprom28 = sext i32 %add27 to i64, !dbg !728
  %arrayidx29 = getelementptr inbounds float, float* %29, i64 %idxprom28, !dbg !728
  %31 = load float, float* %arrayidx29, align 4, !dbg !728
  %add30 = fadd contract float %28, %31, !dbg !731
  %32 = load float*, float** %u1.addr, align 8, !dbg !732
  %33 = load i32, i32* %ind, align 4, !dbg !733
  %34 = load i32, i32* %NX.addr, align 4, !dbg !734
  %sub31 = sub nsw i32 %33, %34, !dbg !735
  %idxprom32 = sext i32 %sub31 to i64, !dbg !732
  %arrayidx33 = getelementptr inbounds float, float* %32, i64 %idxprom32, !dbg !732
  %35 = load float, float* %arrayidx33, align 4, !dbg !732
  %add34 = fadd contract float %add30, %35, !dbg !736
  %36 = load float*, float** %u1.addr, align 8, !dbg !737
  %37 = load i32, i32* %ind, align 4, !dbg !738
  %38 = load i32, i32* %NX.addr, align 4, !dbg !739
  %add35 = add nsw i32 %37, %38, !dbg !740
  %idxprom36 = sext i32 %add35 to i64, !dbg !737
  %arrayidx37 = getelementptr inbounds float, float* %36, i64 %idxprom36, !dbg !737
  %39 = load float, float* %arrayidx37, align 4, !dbg !737
  %add38 = fadd contract float %add34, %39, !dbg !741
  %40 = load float*, float** %u1.addr, align 8, !dbg !742
  %41 = load i32, i32* %ind, align 4, !dbg !743
  %42 = load i32, i32* %NX.addr, align 4, !dbg !744
  %43 = load i32, i32* %NY.addr, align 4, !dbg !745
  %mul39 = mul nsw i32 %42, %43, !dbg !746
  %sub40 = sub nsw i32 %41, %mul39, !dbg !747
  %idxprom41 = sext i32 %sub40 to i64, !dbg !742
  %arrayidx42 = getelementptr inbounds float, float* %40, i64 %idxprom41, !dbg !742
  %44 = load float, float* %arrayidx42, align 4, !dbg !742
  %add43 = fadd contract float %add38, %44, !dbg !748
  %45 = load float*, float** %u1.addr, align 8, !dbg !749
  %46 = load i32, i32* %ind, align 4, !dbg !750
  %47 = load i32, i32* %NX.addr, align 4, !dbg !751
  %48 = load i32, i32* %NY.addr, align 4, !dbg !752
  %mul44 = mul nsw i32 %47, %48, !dbg !753
  %add45 = add nsw i32 %46, %mul44, !dbg !754
  %idxprom46 = sext i32 %add45 to i64, !dbg !749
  %arrayidx47 = getelementptr inbounds float, float* %45, i64 %idxprom46, !dbg !749
  %49 = load float, float* %arrayidx47, align 4, !dbg !749
  %add48 = fadd contract float %add43, %49, !dbg !755
  %50 = load float, float* %sixth, align 4, !dbg !756
  %mul49 = fmul contract float %add48, %50, !dbg !757
  %51 = load float*, float** %u2.addr, align 8, !dbg !758
  %52 = load i32, i32* %ind, align 4, !dbg !759
  %idxprom50 = sext i32 %52 to i64, !dbg !758
  %arrayidx51 = getelementptr inbounds float, float* %51, i64 %idxprom50, !dbg !758
  store float %mul49, float* %arrayidx51, align 4, !dbg !760
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !761

for.inc:                                          ; preds = %if.end
  %53 = load i32, i32* %i, align 4, !dbg !762
  %inc = add nsw i32 %53, 1, !dbg !762
  store i32 %inc, i32* %i, align 4, !dbg !762
  br label %for.cond4, !dbg !763, !llvm.loop !764

for.end:                                          ; preds = %for.cond4
  br label %for.inc52, !dbg !766

for.inc52:                                        ; preds = %for.end
  %54 = load i32, i32* %j, align 4, !dbg !767
  %inc53 = add nsw i32 %54, 1, !dbg !767
  store i32 %inc53, i32* %j, align 4, !dbg !767
  br label %for.cond1, !dbg !768, !llvm.loop !769

for.end54:                                        ; preds = %for.cond1
  br label %for.inc55, !dbg !771

for.inc55:                                        ; preds = %for.end54
  %55 = load i32, i32* %k, align 4, !dbg !772
  %inc56 = add nsw i32 %55, 1, !dbg !772
  store i32 %inc56, i32* %k, align 4, !dbg !772
  br label %for.cond, !dbg !773, !llvm.loop !774

for.end57:                                        ; preds = %for.cond
  ret void, !dbg !776
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #3 !dbg !777 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %NX = alloca i32, align 4
  %NY = alloca i32, align 4
  %NZ = alloca i32, align 4
  %REPEAT = alloca i32, align 4
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %ind = alloca i32, align 4
  %pitch = alloca i32, align 4
  %pitch_bytes = alloca i64, align 8
  %h_u1 = alloca float*, align 8
  %h_u2 = alloca float*, align 8
  %h_u3 = alloca float*, align 8
  %h_foo = alloca float*, align 8
  %err = alloca float, align 4
  %d_u1 = alloca float*, align 8
  %d_u2 = alloca float*, align 8
  %d_foo = alloca float*, align 8
  %deviceCount = alloca i32, align 4
  %dev = alloca i32, align 4
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %dimGrid = alloca %struct.dim3, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp138 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp138.coerce = alloca { i64, i32 }, align 4
  %i152 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !780, metadata !DIExpression()), !dbg !781
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !782, metadata !DIExpression()), !dbg !783
  call void @llvm.dbg.declare(metadata i32* %NX, metadata !784, metadata !DIExpression()), !dbg !785
  call void @llvm.dbg.declare(metadata i32* %NY, metadata !786, metadata !DIExpression()), !dbg !787
  call void @llvm.dbg.declare(metadata i32* %NZ, metadata !788, metadata !DIExpression()), !dbg !789
  call void @llvm.dbg.declare(metadata i32* %REPEAT, metadata !790, metadata !DIExpression()), !dbg !791
  call void @llvm.dbg.declare(metadata i32* %bx, metadata !792, metadata !DIExpression()), !dbg !793
  call void @llvm.dbg.declare(metadata i32* %by, metadata !794, metadata !DIExpression()), !dbg !795
  call void @llvm.dbg.declare(metadata i32* %i, metadata !796, metadata !DIExpression()), !dbg !797
  call void @llvm.dbg.declare(metadata i32* %j, metadata !798, metadata !DIExpression()), !dbg !799
  call void @llvm.dbg.declare(metadata i32* %k, metadata !800, metadata !DIExpression()), !dbg !801
  call void @llvm.dbg.declare(metadata i32* %ind, metadata !802, metadata !DIExpression()), !dbg !803
  call void @llvm.dbg.declare(metadata i32* %pitch, metadata !804, metadata !DIExpression()), !dbg !805
  call void @llvm.dbg.declare(metadata i64* %pitch_bytes, metadata !806, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.declare(metadata float** %h_u1, metadata !808, metadata !DIExpression()), !dbg !809
  call void @llvm.dbg.declare(metadata float** %h_u2, metadata !810, metadata !DIExpression()), !dbg !811
  call void @llvm.dbg.declare(metadata float** %h_u3, metadata !812, metadata !DIExpression()), !dbg !813
  call void @llvm.dbg.declare(metadata float** %h_foo, metadata !814, metadata !DIExpression()), !dbg !815
  call void @llvm.dbg.declare(metadata float* %err, metadata !816, metadata !DIExpression()), !dbg !817
  call void @llvm.dbg.declare(metadata float** %d_u1, metadata !818, metadata !DIExpression()), !dbg !819
  call void @llvm.dbg.declare(metadata float** %d_u2, metadata !820, metadata !DIExpression()), !dbg !821
  call void @llvm.dbg.declare(metadata float** %d_foo, metadata !822, metadata !DIExpression()), !dbg !823
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !824
  br i1 true, label %if.then, label %if.end, !dbg !826

if.then:                                          ; preds = %entry
  call void @_Z9printHelpv(), !dbg !827
  store i32 1, i32* %retval, align 4, !dbg !829
  br label %return, !dbg !829

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !830
  %tobool = icmp ne i32* %NX, null, !dbg !832
  br i1 %tobool, label %if.then1, label %if.else, !dbg !833

if.then1:                                         ; preds = %if.end
  %2 = load i32, i32* %NX, align 4, !dbg !834
  %cmp = icmp sle i32 %2, 99, !dbg !837
  br i1 %cmp, label %if.then2, label %if.end3, !dbg !838

if.then2:                                         ; preds = %if.then1
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.2, i64 0, i64 0)), !dbg !839
  store i32 -1, i32* %retval, align 4, !dbg !841
  br label %return, !dbg !841

if.end3:                                          ; preds = %if.then1
  br label %if.end4, !dbg !842

if.else:                                          ; preds = %if.end
  store i32 100, i32* %NX, align 4, !dbg !843
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.end3
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !844
  %tobool5 = icmp ne i32* %NY, null, !dbg !846
  br i1 %tobool5, label %if.then6, label %if.else11, !dbg !847

if.then6:                                         ; preds = %if.end4
  %4 = load i32, i32* %NY, align 4, !dbg !848
  %cmp7 = icmp sle i32 %4, 99, !dbg !851
  br i1 %cmp7, label %if.then8, label %if.end10, !dbg !852

if.then8:                                         ; preds = %if.then6
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.4, i64 0, i64 0)), !dbg !853
  store i32 -1, i32* %retval, align 4, !dbg !855
  br label %return, !dbg !855

if.end10:                                         ; preds = %if.then6
  br label %if.end12, !dbg !856

if.else11:                                        ; preds = %if.end4
  store i32 100, i32* %NY, align 4, !dbg !857
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.end10
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !858
  %tobool13 = icmp ne i32* %NZ, null, !dbg !860
  br i1 %tobool13, label %if.then14, label %if.else19, !dbg !861

if.then14:                                        ; preds = %if.end12
  %6 = load i32, i32* %NZ, align 4, !dbg !862
  %cmp15 = icmp sle i32 %6, 99, !dbg !865
  br i1 %cmp15, label %if.then16, label %if.end18, !dbg !866

if.then16:                                        ; preds = %if.then14
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.6, i64 0, i64 0)), !dbg !867
  store i32 -1, i32* %retval, align 4, !dbg !869
  br label %return, !dbg !869

if.end18:                                         ; preds = %if.then14
  br label %if.end20, !dbg !870

if.else19:                                        ; preds = %if.end12
  store i32 100, i32* %NZ, align 4, !dbg !871
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.end18
  %7 = load i8**, i8*** %argv.addr, align 8, !dbg !872
  %tobool21 = icmp ne i32* %REPEAT, null, !dbg !874
  br i1 %tobool21, label %if.then22, label %if.else27, !dbg !875

if.then22:                                        ; preds = %if.end20
  %8 = load i32, i32* %REPEAT, align 4, !dbg !876
  %cmp23 = icmp sle i32 %8, 0, !dbg !879
  br i1 %cmp23, label %if.then24, label %if.end26, !dbg !880

if.then24:                                        ; preds = %if.then22
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.8, i64 0, i64 0)), !dbg !881
  store i32 -1, i32* %retval, align 4, !dbg !883
  br label %return, !dbg !883

if.end26:                                         ; preds = %if.then22
  br label %if.end28, !dbg !884

if.else27:                                        ; preds = %if.end20
  store i32 1, i32* %REPEAT, align 4, !dbg !885
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %if.end26
  %9 = load i32, i32* %NX, align 4, !dbg !886
  %10 = load i32, i32* %NY, align 4, !dbg !887
  %11 = load i32, i32* %NZ, align 4, !dbg !888
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i64 0, i64 0), i32 %9, i32 %10, i32 %11), !dbg !889
  call void @llvm.dbg.declare(metadata i32* %deviceCount, metadata !890, metadata !DIExpression()), !dbg !891
  %call30 = call i32 @cudaGetDeviceCount(i32* %deviceCount), !dbg !892
  %12 = load i32, i32* %deviceCount, align 4, !dbg !893
  %cmp31 = icmp eq i32 %12, 0, !dbg !895
  br i1 %cmp31, label %if.then32, label %if.end34, !dbg !896

if.then32:                                        ; preds = %if.end28
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !897
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0)), !dbg !899
  call void @exit(i32 1) #8, !dbg !900
  unreachable, !dbg !900

if.end34:                                         ; preds = %if.end28
  call void @llvm.dbg.declare(metadata i32* %dev, metadata !901, metadata !DIExpression()), !dbg !902
  store i32 0, i32* %dev, align 4, !dbg !903
  br label %for.cond, !dbg !905

for.cond:                                         ; preds = %for.inc, %if.end34
  %14 = load i32, i32* %dev, align 4, !dbg !906
  %15 = load i32, i32* %deviceCount, align 4, !dbg !908
  %cmp35 = icmp slt i32 %14, %15, !dbg !909
  br i1 %cmp35, label %for.body, label %for.end, !dbg !910

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.cudaDeviceProp* %deviceProp, metadata !911, metadata !DIExpression()), !dbg !986
  %16 = load i32, i32* %dev, align 4, !dbg !987
  %call36 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 %16), !dbg !988
  %major = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 11, !dbg !989
  %17 = load i32, i32* %major, align 8, !dbg !989
  %cmp37 = icmp sge i32 %17, 1, !dbg !991
  br i1 %cmp37, label %if.then38, label %if.end39, !dbg !992

if.then38:                                        ; preds = %for.body
  br label %for.end, !dbg !993

if.end39:                                         ; preds = %for.body
  br label %for.inc, !dbg !994

for.inc:                                          ; preds = %if.end39
  %18 = load i32, i32* %dev, align 4, !dbg !995
  %inc = add nsw i32 %18, 1, !dbg !995
  store i32 %inc, i32* %dev, align 4, !dbg !995
  br label %for.cond, !dbg !996, !llvm.loop !997

for.end:                                          ; preds = %if.then38, %for.cond
  %19 = load i32, i32* %dev, align 4, !dbg !999
  %20 = load i32, i32* %deviceCount, align 4, !dbg !1001
  %cmp40 = icmp eq i32 %19, %20, !dbg !1002
  br i1 %cmp40, label %if.then41, label %if.else43, !dbg !1003

if.then41:                                        ; preds = %for.end
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1004
  %call42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.11, i64 0, i64 0)), !dbg !1006
  call void @exit(i32 1) #8, !dbg !1007
  unreachable, !dbg !1007

if.else43:                                        ; preds = %for.end
  %22 = load i32, i32* %dev, align 4, !dbg !1008
  %call44 = call i32 @cudaSetDevice(i32 %22), !dbg !1009
  br label %if.end45

if.end45:                                         ; preds = %if.else43
  %23 = load i32, i32* %NX, align 4, !dbg !1010
  %conv = sext i32 %23 to i64, !dbg !1010
  %mul = mul i64 4, %conv, !dbg !1011
  %24 = load i32, i32* %NY, align 4, !dbg !1012
  %conv46 = sext i32 %24 to i64, !dbg !1012
  %mul47 = mul i64 %mul, %conv46, !dbg !1013
  %25 = load i32, i32* %NZ, align 4, !dbg !1014
  %conv48 = sext i32 %25 to i64, !dbg !1014
  %mul49 = mul i64 %mul47, %conv48, !dbg !1015
  %call50 = call noalias i8* @malloc(i64 %mul49) #9, !dbg !1016
  %26 = bitcast i8* %call50 to float*, !dbg !1017
  store float* %26, float** %h_u1, align 8, !dbg !1018
  %27 = load i32, i32* %NX, align 4, !dbg !1019
  %conv51 = sext i32 %27 to i64, !dbg !1019
  %mul52 = mul i64 4, %conv51, !dbg !1020
  %28 = load i32, i32* %NY, align 4, !dbg !1021
  %conv53 = sext i32 %28 to i64, !dbg !1021
  %mul54 = mul i64 %mul52, %conv53, !dbg !1022
  %29 = load i32, i32* %NZ, align 4, !dbg !1023
  %conv55 = sext i32 %29 to i64, !dbg !1023
  %mul56 = mul i64 %mul54, %conv55, !dbg !1024
  %call57 = call noalias i8* @malloc(i64 %mul56) #9, !dbg !1025
  %30 = bitcast i8* %call57 to float*, !dbg !1026
  store float* %30, float** %h_u2, align 8, !dbg !1027
  %31 = load i32, i32* %NX, align 4, !dbg !1028
  %conv58 = sext i32 %31 to i64, !dbg !1028
  %mul59 = mul i64 4, %conv58, !dbg !1029
  %32 = load i32, i32* %NY, align 4, !dbg !1030
  %conv60 = sext i32 %32 to i64, !dbg !1030
  %mul61 = mul i64 %mul59, %conv60, !dbg !1031
  %33 = load i32, i32* %NZ, align 4, !dbg !1032
  %conv62 = sext i32 %33 to i64, !dbg !1032
  %mul63 = mul i64 %mul61, %conv62, !dbg !1033
  %call64 = call noalias i8* @malloc(i64 %mul63) #9, !dbg !1034
  %34 = bitcast i8* %call64 to float*, !dbg !1035
  store float* %34, float** %h_u3, align 8, !dbg !1036
  %35 = bitcast float** %d_u1 to i8**, !dbg !1037
  %36 = load i32, i32* %NX, align 4, !dbg !1038
  %conv65 = sext i32 %36 to i64, !dbg !1038
  %mul66 = mul i64 4, %conv65, !dbg !1039
  %37 = load i32, i32* %NY, align 4, !dbg !1040
  %38 = load i32, i32* %NZ, align 4, !dbg !1041
  %mul67 = mul nsw i32 %37, %38, !dbg !1042
  %conv68 = sext i32 %mul67 to i64, !dbg !1040
  %call69 = call i32 @cudaMallocPitch(i8** %35, i64* %pitch_bytes, i64 %mul66, i64 %conv68), !dbg !1043
  %39 = bitcast float** %d_u2 to i8**, !dbg !1044
  %40 = load i32, i32* %NX, align 4, !dbg !1045
  %conv70 = sext i32 %40 to i64, !dbg !1045
  %mul71 = mul i64 4, %conv70, !dbg !1046
  %41 = load i32, i32* %NY, align 4, !dbg !1047
  %42 = load i32, i32* %NZ, align 4, !dbg !1048
  %mul72 = mul nsw i32 %41, %42, !dbg !1049
  %conv73 = sext i32 %mul72 to i64, !dbg !1047
  %call74 = call i32 @cudaMallocPitch(i8** %39, i64* %pitch_bytes, i64 %mul71, i64 %conv73), !dbg !1050
  %43 = load i64, i64* %pitch_bytes, align 8, !dbg !1051
  %div = udiv i64 %43, 4, !dbg !1052
  %conv75 = trunc i64 %div to i32, !dbg !1051
  store i32 %conv75, i32* %pitch, align 4, !dbg !1053
  store i32 0, i32* %k, align 4, !dbg !1054
  br label %for.cond76, !dbg !1056

for.cond76:                                       ; preds = %for.inc112, %if.end45
  %44 = load i32, i32* %k, align 4, !dbg !1057
  %45 = load i32, i32* %NZ, align 4, !dbg !1059
  %cmp77 = icmp slt i32 %44, %45, !dbg !1060
  br i1 %cmp77, label %for.body78, label %for.end114, !dbg !1061

for.body78:                                       ; preds = %for.cond76
  store i32 0, i32* %j, align 4, !dbg !1062
  br label %for.cond79, !dbg !1065

for.cond79:                                       ; preds = %for.inc109, %for.body78
  %46 = load i32, i32* %j, align 4, !dbg !1066
  %47 = load i32, i32* %NY, align 4, !dbg !1068
  %cmp80 = icmp slt i32 %46, %47, !dbg !1069
  br i1 %cmp80, label %for.body81, label %for.end111, !dbg !1070

for.body81:                                       ; preds = %for.cond79
  store i32 0, i32* %i, align 4, !dbg !1071
  br label %for.cond82, !dbg !1074

for.cond82:                                       ; preds = %for.inc106, %for.body81
  %48 = load i32, i32* %i, align 4, !dbg !1075
  %49 = load i32, i32* %NX, align 4, !dbg !1077
  %cmp83 = icmp slt i32 %48, %49, !dbg !1078
  br i1 %cmp83, label %for.body84, label %for.end108, !dbg !1079

for.body84:                                       ; preds = %for.cond82
  %50 = load i32, i32* %i, align 4, !dbg !1080
  %51 = load i32, i32* %j, align 4, !dbg !1082
  %52 = load i32, i32* %NX, align 4, !dbg !1083
  %mul85 = mul nsw i32 %51, %52, !dbg !1084
  %add = add nsw i32 %50, %mul85, !dbg !1085
  %53 = load i32, i32* %k, align 4, !dbg !1086
  %54 = load i32, i32* %NX, align 4, !dbg !1087
  %mul86 = mul nsw i32 %53, %54, !dbg !1088
  %55 = load i32, i32* %NY, align 4, !dbg !1089
  %mul87 = mul nsw i32 %mul86, %55, !dbg !1090
  %add88 = add nsw i32 %add, %mul87, !dbg !1091
  store i32 %add88, i32* %ind, align 4, !dbg !1092
  %56 = load i32, i32* %i, align 4, !dbg !1093
  %cmp89 = icmp eq i32 %56, 0, !dbg !1095
  br i1 %cmp89, label %if.then101, label %lor.lhs.false, !dbg !1096

lor.lhs.false:                                    ; preds = %for.body84
  %57 = load i32, i32* %i, align 4, !dbg !1097
  %58 = load i32, i32* %NX, align 4, !dbg !1098
  %sub = sub nsw i32 %58, 1, !dbg !1099
  %cmp90 = icmp eq i32 %57, %sub, !dbg !1100
  br i1 %cmp90, label %if.then101, label %lor.lhs.false91, !dbg !1101

lor.lhs.false91:                                  ; preds = %lor.lhs.false
  %59 = load i32, i32* %j, align 4, !dbg !1102
  %cmp92 = icmp eq i32 %59, 0, !dbg !1103
  br i1 %cmp92, label %if.then101, label %lor.lhs.false93, !dbg !1104

lor.lhs.false93:                                  ; preds = %lor.lhs.false91
  %60 = load i32, i32* %j, align 4, !dbg !1105
  %61 = load i32, i32* %NY, align 4, !dbg !1106
  %sub94 = sub nsw i32 %61, 1, !dbg !1107
  %cmp95 = icmp eq i32 %60, %sub94, !dbg !1108
  br i1 %cmp95, label %if.then101, label %lor.lhs.false96, !dbg !1109

lor.lhs.false96:                                  ; preds = %lor.lhs.false93
  %62 = load i32, i32* %k, align 4, !dbg !1110
  %cmp97 = icmp eq i32 %62, 0, !dbg !1111
  br i1 %cmp97, label %if.then101, label %lor.lhs.false98, !dbg !1112

lor.lhs.false98:                                  ; preds = %lor.lhs.false96
  %63 = load i32, i32* %k, align 4, !dbg !1113
  %64 = load i32, i32* %NZ, align 4, !dbg !1114
  %sub99 = sub nsw i32 %64, 1, !dbg !1115
  %cmp100 = icmp eq i32 %63, %sub99, !dbg !1116
  br i1 %cmp100, label %if.then101, label %if.else102, !dbg !1117

if.then101:                                       ; preds = %lor.lhs.false98, %lor.lhs.false96, %lor.lhs.false93, %lor.lhs.false91, %lor.lhs.false, %for.body84
  %65 = load float*, float** %h_u1, align 8, !dbg !1118
  %66 = load i32, i32* %ind, align 4, !dbg !1119
  %idxprom = sext i32 %66 to i64, !dbg !1118
  %arrayidx = getelementptr inbounds float, float* %65, i64 %idxprom, !dbg !1118
  store float 1.000000e+00, float* %arrayidx, align 4, !dbg !1120
  br label %if.end105, !dbg !1118

if.else102:                                       ; preds = %lor.lhs.false98
  %67 = load float*, float** %h_u1, align 8, !dbg !1121
  %68 = load i32, i32* %ind, align 4, !dbg !1122
  %idxprom103 = sext i32 %68 to i64, !dbg !1121
  %arrayidx104 = getelementptr inbounds float, float* %67, i64 %idxprom103, !dbg !1121
  store float 0.000000e+00, float* %arrayidx104, align 4, !dbg !1123
  br label %if.end105

if.end105:                                        ; preds = %if.else102, %if.then101
  br label %for.inc106, !dbg !1124

for.inc106:                                       ; preds = %if.end105
  %69 = load i32, i32* %i, align 4, !dbg !1125
  %inc107 = add nsw i32 %69, 1, !dbg !1125
  store i32 %inc107, i32* %i, align 4, !dbg !1125
  br label %for.cond82, !dbg !1126, !llvm.loop !1127

for.end108:                                       ; preds = %for.cond82
  br label %for.inc109, !dbg !1129

for.inc109:                                       ; preds = %for.end108
  %70 = load i32, i32* %j, align 4, !dbg !1130
  %inc110 = add nsw i32 %70, 1, !dbg !1130
  store i32 %inc110, i32* %j, align 4, !dbg !1130
  br label %for.cond79, !dbg !1131, !llvm.loop !1132

for.end111:                                       ; preds = %for.cond79
  br label %for.inc112, !dbg !1134

for.inc112:                                       ; preds = %for.end111
  %71 = load i32, i32* %k, align 4, !dbg !1135
  %inc113 = add nsw i32 %71, 1, !dbg !1135
  store i32 %inc113, i32* %k, align 4, !dbg !1135
  br label %for.cond76, !dbg !1136, !llvm.loop !1137

for.end114:                                       ; preds = %for.cond76
  %72 = load float*, float** %d_u1, align 8, !dbg !1139
  %73 = bitcast float* %72 to i8*, !dbg !1139
  %74 = load i64, i64* %pitch_bytes, align 8, !dbg !1140
  %75 = load float*, float** %h_u1, align 8, !dbg !1141
  %76 = bitcast float* %75 to i8*, !dbg !1141
  %77 = load i32, i32* %NX, align 4, !dbg !1142
  %conv115 = sext i32 %77 to i64, !dbg !1142
  %mul116 = mul i64 4, %conv115, !dbg !1143
  %78 = load i32, i32* %NX, align 4, !dbg !1144
  %conv117 = sext i32 %78 to i64, !dbg !1144
  %mul118 = mul i64 4, %conv117, !dbg !1145
  %79 = load i32, i32* %NY, align 4, !dbg !1146
  %80 = load i32, i32* %NZ, align 4, !dbg !1147
  %mul119 = mul nsw i32 %79, %80, !dbg !1148
  %conv120 = sext i32 %mul119 to i64, !dbg !1146
  %call121 = call i32 @cudaMemcpy2D(i8* %73, i64 %74, i8* %76, i64 %mul116, i64 %mul118, i64 %conv120, i32 1), !dbg !1149
  %call122 = call i32 @cudaThreadSynchronize(), !dbg !1150
  %81 = load i32, i32* %NX, align 4, !dbg !1151
  %sub123 = sub nsw i32 %81, 1, !dbg !1152
  %div124 = sdiv i32 %sub123, 32, !dbg !1153
  %add125 = add nsw i32 1, %div124, !dbg !1154
  store i32 %add125, i32* %bx, align 4, !dbg !1155
  %82 = load i32, i32* %NY, align 4, !dbg !1156
  %sub126 = sub nsw i32 %82, 1, !dbg !1157
  %div127 = sdiv i32 %sub126, 4, !dbg !1158
  %add128 = add nsw i32 1, %div127, !dbg !1159
  store i32 %add128, i32* %by, align 4, !dbg !1160
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !1161, metadata !DIExpression()), !dbg !1185
  %83 = load i32, i32* %bx, align 4, !dbg !1186
  %84 = load i32, i32* %by, align 4, !dbg !1187
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGrid, i32 %83, i32 %84, i32 1), !dbg !1185
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !1188, metadata !DIExpression()), !dbg !1189
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlock, i32 32, i32 4, i32 1), !dbg !1189
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 0, !dbg !1190
  %85 = load i32, i32* %x, align 4, !dbg !1190
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 1, !dbg !1191
  %86 = load i32, i32* %y, align 4, !dbg !1191
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 2, !dbg !1192
  %87 = load i32, i32* %z, align 4, !dbg !1192
  %call129 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i64 0, i64 0), i32 %85, i32 %86, i32 %87), !dbg !1193
  %x130 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 0, !dbg !1194
  %88 = load i32, i32* %x130, align 4, !dbg !1194
  %y131 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 1, !dbg !1195
  %89 = load i32, i32* %y131, align 4, !dbg !1195
  %z132 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 2, !dbg !1196
  %90 = load i32, i32* %z132, align 4, !dbg !1196
  %call133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i64 0, i64 0), i32 %88, i32 %89, i32 %90), !dbg !1197
  %call134 = call i32 @cudaThreadSynchronize(), !dbg !1198
  store i32 1, i32* %i, align 4, !dbg !1199
  br label %for.cond135, !dbg !1201

for.cond135:                                      ; preds = %for.inc142, %for.end114
  %91 = load i32, i32* %i, align 4, !dbg !1202
  %92 = load i32, i32* %REPEAT, align 4, !dbg !1204
  %cmp136 = icmp sle i32 %91, %92, !dbg !1205
  br i1 %cmp136, label %for.body137, label %for.end144, !dbg !1206

for.body137:                                      ; preds = %for.cond135
  %93 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1207
  %94 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !1207
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %93, i8* align 4 %94, i64 12, i1 false), !dbg !1207
  %95 = bitcast %struct.dim3* %agg.tmp138 to i8*, !dbg !1209
  %96 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !1209
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %95, i8* align 4 %96, i64 12, i1 false), !dbg !1209
  %97 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1210
  %98 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1210
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %97, i8* align 4 %98, i64 12, i1 false), !dbg !1210
  %99 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1210
  %100 = load i64, i64* %99, align 4, !dbg !1210
  %101 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1210
  %102 = load i32, i32* %101, align 4, !dbg !1210
  %103 = bitcast { i64, i32 }* %agg.tmp138.coerce to i8*, !dbg !1210
  %104 = bitcast %struct.dim3* %agg.tmp138 to i8*, !dbg !1210
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %103, i8* align 4 %104, i64 12, i1 false), !dbg !1210
  %105 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp138.coerce, i32 0, i32 0, !dbg !1210
  %106 = load i64, i64* %105, align 4, !dbg !1210
  %107 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp138.coerce, i32 0, i32 1, !dbg !1210
  %108 = load i32, i32* %107, align 4, !dbg !1210
  %call139 = call i32 @cudaConfigureCall(i64 %100, i32 %102, i64 %106, i32 %108, i64 0, %struct.CUstream_st* null), !dbg !1210
  %tobool140 = icmp ne i32 %call139, 0, !dbg !1210
  br i1 %tobool140, label %kcall.end, label %kcall.configok, !dbg !1211

kcall.configok:                                   ; preds = %for.body137
  %109 = load i32, i32* %NX, align 4, !dbg !1212
  %110 = load i32, i32* %NY, align 4, !dbg !1213
  %111 = load i32, i32* %NZ, align 4, !dbg !1214
  %112 = load i32, i32* %pitch, align 4, !dbg !1215
  %113 = load float*, float** %d_u1, align 8, !dbg !1216
  %114 = load float*, float** %d_u2, align 8, !dbg !1217
  call void @_Z13GPU_laplace3diiiiPfS_(i32 %109, i32 %110, i32 %111, i32 %112, float* %113, float* %114), !dbg !1211
  br label %kcall.end, !dbg !1211

kcall.end:                                        ; preds = %kcall.configok, %for.body137
  %115 = load float*, float** %d_u1, align 8, !dbg !1218
  store float* %115, float** %d_foo, align 8, !dbg !1219
  %116 = load float*, float** %d_u2, align 8, !dbg !1220
  store float* %116, float** %d_u1, align 8, !dbg !1221
  %117 = load float*, float** %d_foo, align 8, !dbg !1222
  store float* %117, float** %d_u2, align 8, !dbg !1223
  %call141 = call i32 @cudaThreadSynchronize(), !dbg !1224
  br label %for.inc142, !dbg !1225

for.inc142:                                       ; preds = %kcall.end
  %118 = load i32, i32* %i, align 4, !dbg !1226
  %inc143 = add nsw i32 %118, 1, !dbg !1226
  store i32 %inc143, i32* %i, align 4, !dbg !1226
  br label %for.cond135, !dbg !1227, !llvm.loop !1228

for.end144:                                       ; preds = %for.cond135
  %119 = load float*, float** %h_u2, align 8, !dbg !1230
  %120 = bitcast float* %119 to i8*, !dbg !1230
  %121 = load i32, i32* %NX, align 4, !dbg !1231
  %conv145 = sext i32 %121 to i64, !dbg !1231
  %mul146 = mul i64 4, %conv145, !dbg !1232
  %122 = load float*, float** %d_u1, align 8, !dbg !1233
  %123 = bitcast float* %122 to i8*, !dbg !1233
  %124 = load i64, i64* %pitch_bytes, align 8, !dbg !1234
  %125 = load i32, i32* %NX, align 4, !dbg !1235
  %conv147 = sext i32 %125 to i64, !dbg !1235
  %mul148 = mul i64 4, %conv147, !dbg !1236
  %126 = load i32, i32* %NY, align 4, !dbg !1237
  %127 = load i32, i32* %NZ, align 4, !dbg !1238
  %mul149 = mul nsw i32 %126, %127, !dbg !1239
  %conv150 = sext i32 %mul149 to i64, !dbg !1237
  %call151 = call i32 @cudaMemcpy2D(i8* %120, i64 %mul146, i8* %123, i64 %124, i64 %mul148, i64 %conv150, i32 2), !dbg !1240
  call void @llvm.dbg.declare(metadata i32* %i152, metadata !1241, metadata !DIExpression()), !dbg !1243
  store i32 1, i32* %i152, align 4, !dbg !1243
  br label %for.cond153, !dbg !1244

for.cond153:                                      ; preds = %for.inc156, %for.end144
  %128 = load i32, i32* %i152, align 4, !dbg !1245
  %129 = load i32, i32* %REPEAT, align 4, !dbg !1247
  %cmp154 = icmp sle i32 %128, %129, !dbg !1248
  br i1 %cmp154, label %for.body155, label %for.end158, !dbg !1249

for.body155:                                      ; preds = %for.cond153
  %130 = load i32, i32* %NX, align 4, !dbg !1250
  %131 = load i32, i32* %NY, align 4, !dbg !1252
  %132 = load i32, i32* %NZ, align 4, !dbg !1253
  %133 = load float*, float** %h_u1, align 8, !dbg !1254
  %134 = load float*, float** %h_u3, align 8, !dbg !1255
  call void @Gold_laplace3d(i32 %130, i32 %131, i32 %132, float* %133, float* %134), !dbg !1256
  %135 = load float*, float** %h_u1, align 8, !dbg !1257
  store float* %135, float** %h_foo, align 8, !dbg !1258
  %136 = load float*, float** %h_u3, align 8, !dbg !1259
  store float* %136, float** %h_u1, align 8, !dbg !1260
  %137 = load float*, float** %h_foo, align 8, !dbg !1261
  store float* %137, float** %h_u3, align 8, !dbg !1262
  br label %for.inc156, !dbg !1263

for.inc156:                                       ; preds = %for.body155
  %138 = load i32, i32* %i152, align 4, !dbg !1264
  %inc157 = add nsw i32 %138, 1, !dbg !1264
  store i32 %inc157, i32* %i152, align 4, !dbg !1264
  br label %for.cond153, !dbg !1265, !llvm.loop !1266

for.end158:                                       ; preds = %for.cond153
  store float 0.000000e+00, float* %err, align 4, !dbg !1268
  store i32 0, i32* %k, align 4, !dbg !1269
  br label %for.cond159, !dbg !1271

for.cond159:                                      ; preds = %for.inc191, %for.end158
  %139 = load i32, i32* %k, align 4, !dbg !1272
  %140 = load i32, i32* %NZ, align 4, !dbg !1274
  %cmp160 = icmp slt i32 %139, %140, !dbg !1275
  br i1 %cmp160, label %for.body161, label %for.end193, !dbg !1276

for.body161:                                      ; preds = %for.cond159
  store i32 0, i32* %j, align 4, !dbg !1277
  br label %for.cond162, !dbg !1280

for.cond162:                                      ; preds = %for.inc188, %for.body161
  %141 = load i32, i32* %j, align 4, !dbg !1281
  %142 = load i32, i32* %NY, align 4, !dbg !1283
  %cmp163 = icmp slt i32 %141, %142, !dbg !1284
  br i1 %cmp163, label %for.body164, label %for.end190, !dbg !1285

for.body164:                                      ; preds = %for.cond162
  store i32 0, i32* %i, align 4, !dbg !1286
  br label %for.cond165, !dbg !1289

for.cond165:                                      ; preds = %for.inc185, %for.body164
  %143 = load i32, i32* %i, align 4, !dbg !1290
  %144 = load i32, i32* %NX, align 4, !dbg !1292
  %cmp166 = icmp slt i32 %143, %144, !dbg !1293
  br i1 %cmp166, label %for.body167, label %for.end187, !dbg !1294

for.body167:                                      ; preds = %for.cond165
  %145 = load i32, i32* %i, align 4, !dbg !1295
  %146 = load i32, i32* %j, align 4, !dbg !1297
  %147 = load i32, i32* %NX, align 4, !dbg !1298
  %mul168 = mul nsw i32 %146, %147, !dbg !1299
  %add169 = add nsw i32 %145, %mul168, !dbg !1300
  %148 = load i32, i32* %k, align 4, !dbg !1301
  %149 = load i32, i32* %NX, align 4, !dbg !1302
  %mul170 = mul nsw i32 %148, %149, !dbg !1303
  %150 = load i32, i32* %NY, align 4, !dbg !1304
  %mul171 = mul nsw i32 %mul170, %150, !dbg !1305
  %add172 = add nsw i32 %add169, %mul171, !dbg !1306
  store i32 %add172, i32* %ind, align 4, !dbg !1307
  %151 = load float*, float** %h_u1, align 8, !dbg !1308
  %152 = load i32, i32* %ind, align 4, !dbg !1309
  %idxprom173 = sext i32 %152 to i64, !dbg !1308
  %arrayidx174 = getelementptr inbounds float, float* %151, i64 %idxprom173, !dbg !1308
  %153 = load float, float* %arrayidx174, align 4, !dbg !1308
  %154 = load float*, float** %h_u2, align 8, !dbg !1310
  %155 = load i32, i32* %ind, align 4, !dbg !1311
  %idxprom175 = sext i32 %155 to i64, !dbg !1310
  %arrayidx176 = getelementptr inbounds float, float* %154, i64 %idxprom175, !dbg !1310
  %156 = load float, float* %arrayidx176, align 4, !dbg !1310
  %sub177 = fsub contract float %153, %156, !dbg !1312
  %157 = load float*, float** %h_u1, align 8, !dbg !1313
  %158 = load i32, i32* %ind, align 4, !dbg !1314
  %idxprom178 = sext i32 %158 to i64, !dbg !1313
  %arrayidx179 = getelementptr inbounds float, float* %157, i64 %idxprom178, !dbg !1313
  %159 = load float, float* %arrayidx179, align 4, !dbg !1313
  %160 = load float*, float** %h_u2, align 8, !dbg !1315
  %161 = load i32, i32* %ind, align 4, !dbg !1316
  %idxprom180 = sext i32 %161 to i64, !dbg !1315
  %arrayidx181 = getelementptr inbounds float, float* %160, i64 %idxprom180, !dbg !1315
  %162 = load float, float* %arrayidx181, align 4, !dbg !1315
  %sub182 = fsub contract float %159, %162, !dbg !1317
  %mul183 = fmul contract float %sub177, %sub182, !dbg !1318
  %163 = load float, float* %err, align 4, !dbg !1319
  %add184 = fadd contract float %163, %mul183, !dbg !1319
  store float %add184, float* %err, align 4, !dbg !1319
  br label %for.inc185, !dbg !1320

for.inc185:                                       ; preds = %for.body167
  %164 = load i32, i32* %i, align 4, !dbg !1321
  %inc186 = add nsw i32 %164, 1, !dbg !1321
  store i32 %inc186, i32* %i, align 4, !dbg !1321
  br label %for.cond165, !dbg !1322, !llvm.loop !1323

for.end187:                                       ; preds = %for.cond165
  br label %for.inc188, !dbg !1325

for.inc188:                                       ; preds = %for.end187
  %165 = load i32, i32* %j, align 4, !dbg !1326
  %inc189 = add nsw i32 %165, 1, !dbg !1326
  store i32 %inc189, i32* %j, align 4, !dbg !1326
  br label %for.cond162, !dbg !1327, !llvm.loop !1328

for.end190:                                       ; preds = %for.cond162
  br label %for.inc191, !dbg !1330

for.inc191:                                       ; preds = %for.end190
  %166 = load i32, i32* %k, align 4, !dbg !1331
  %inc192 = add nsw i32 %166, 1, !dbg !1331
  store i32 %inc192, i32* %k, align 4, !dbg !1331
  br label %for.cond159, !dbg !1332, !llvm.loop !1333

for.end193:                                       ; preds = %for.cond159
  %167 = load float, float* %err, align 4, !dbg !1335
  %168 = load i32, i32* %NX, align 4, !dbg !1336
  %169 = load i32, i32* %NY, align 4, !dbg !1337
  %mul194 = mul nsw i32 %168, %169, !dbg !1338
  %170 = load i32, i32* %NZ, align 4, !dbg !1339
  %mul195 = mul nsw i32 %mul194, %170, !dbg !1340
  %conv196 = sitofp i32 %mul195 to float, !dbg !1341
  %div197 = fdiv float %167, %conv196, !dbg !1342
  %call198 = call float @_ZSt4sqrtf(float %div197), !dbg !1343
  %conv199 = fpext float %call198 to double, !dbg !1343
  %call200 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.14, i64 0, i64 0), double %conv199), !dbg !1344
  %call201 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i64 0, i64 0)), !dbg !1345
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1346
  %call202 = call i32 @fflush(%struct._IO_FILE* %171), !dbg !1347
  %172 = load float*, float** %d_u1, align 8, !dbg !1348
  %173 = bitcast float* %172 to i8*, !dbg !1348
  %call203 = call i32 @cudaFree(i8* %173), !dbg !1349
  %call204 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.16, i64 0, i64 0)), !dbg !1350
  %174 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1351
  %call205 = call i32 @fflush(%struct._IO_FILE* %174), !dbg !1352
  %175 = load float*, float** %d_u2, align 8, !dbg !1353
  %176 = bitcast float* %175 to i8*, !dbg !1353
  %call206 = call i32 @cudaFree(i8* %176), !dbg !1354
  %call207 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.17, i64 0, i64 0)), !dbg !1355
  %177 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1356
  %call208 = call i32 @fflush(%struct._IO_FILE* %177), !dbg !1357
  %178 = load float*, float** %h_u1, align 8, !dbg !1358
  %179 = bitcast float* %178 to i8*, !dbg !1358
  call void @free(i8* %179) #9, !dbg !1359
  %call209 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i64 0, i64 0)), !dbg !1360
  %180 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1361
  %call210 = call i32 @fflush(%struct._IO_FILE* %180), !dbg !1362
  %181 = load float*, float** %h_u2, align 8, !dbg !1363
  %182 = bitcast float* %181 to i8*, !dbg !1363
  call void @free(i8* %182) #9, !dbg !1364
  %call211 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i64 0, i64 0)), !dbg !1365
  %183 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1366
  %call212 = call i32 @fflush(%struct._IO_FILE* %183), !dbg !1367
  %184 = load float*, float** %h_u3, align 8, !dbg !1368
  %185 = bitcast float* %184 to i8*, !dbg !1368
  call void @free(i8* %185) #9, !dbg !1369
  br label %return, !dbg !1370

return:                                           ; preds = %for.end193, %if.then24, %if.then16, %if.then8, %if.then2, %if.then
  %186 = load i32, i32* %retval, align 4, !dbg !1370
  ret i32 %186, !dbg !1370
}

; Function Attrs: noinline uwtable
define dso_local void @_Z9printHelpv() #0 !dbg !1371 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.20, i64 0, i64 0)), !dbg !1372
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.21, i64 0, i64 0)), !dbg !1373
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0)), !dbg !1374
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.23, i64 0, i64 0)), !dbg !1375
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.24, i64 0, i64 0)), !dbg !1376
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0)), !dbg !1377
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i64 0, i64 0)), !dbg !1378
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.26, i64 0, i64 0)), !dbg !1379
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.27, i64 0, i64 0)), !dbg !1380
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.28, i64 0, i64 0)), !dbg !1381
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.29, i64 0, i64 0)), !dbg !1382
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.30, i64 0, i64 0)), !dbg !1383
  ret void, !dbg !1384
}

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @cudaGetDeviceCount(i32*) #4

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

declare dso_local i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #4

declare dso_local i32 @cudaSetDevice(i32) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #6

declare dso_local i32 @cudaMallocPitch(i8**, i64*, i64, i64) #4

declare dso_local i32 @cudaMemcpy2D(i8*, i64, i8*, i64, i64, i64, i32) #4

declare dso_local i32 @cudaThreadSynchronize() #4

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #2 comdat align 2 !dbg !1385 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1386, metadata !DIExpression()), !dbg !1388
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1389, metadata !DIExpression()), !dbg !1390
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1391, metadata !DIExpression()), !dbg !1392
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1393, metadata !DIExpression()), !dbg !1394
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1395
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1396
  store i32 %0, i32* %x, align 4, !dbg !1395
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1397
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1398
  store i32 %1, i32* %y, align 4, !dbg !1397
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1399
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1400
  store i32 %2, i32* %z, align 4, !dbg !1399
  ret void, !dbg !1401
}

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local float @_ZSt4sqrtf(float %__x) #2 comdat !dbg !1402 {
entry:
  %__x.addr = alloca float, align 4
  store float %__x, float* %__x.addr, align 4
  call void @llvm.dbg.declare(metadata float* %__x.addr, metadata !1403, metadata !DIExpression()), !dbg !1404
  %0 = load float, float* %__x.addr, align 4, !dbg !1405
  %call = call float @sqrtf(float %0) #9, !dbg !1406
  ret float %call, !dbg !1407
}

declare dso_local i32 @fflush(%struct._IO_FILE*) #4

declare dso_local i32 @cudaFree(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: nounwind
declare dso_local float @sqrtf(float) #6

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.dbg.cu = !{!4}
!llvm.ident = !{!610}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !5, producer: "clang version 9.0.0 (https://github.com/yebinchon/llvm-project a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !6, retainedTypes: !16, imports: !25, nameTableKind: None)
!5 = !DIFile(filename: "laplace3d.cu", directory: "/u/ah7226/xstack-benchmark/ispass-2009/LPS")
!6 = !{!7}
!7 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !8, line: 796, baseType: !9, size: 32, elements: !10, identifier: "_ZTS14cudaMemcpyKind")
!8 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "")
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!11, !12, !13, !14, !15}
!11 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!12 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!13 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!14 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!15 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!16 = !{!17, !21, !23, !22}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !{!26, !33, !37, !39, !41, !43, !45, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !75, !77, !81, !83, !85, !87, !91, !96, !98, !100, !105, !109, !111, !113, !115, !117, !119, !121, !123, !125, !130, !134, !136, !141, !145, !147, !149, !151, !153, !155, !159, !161, !163, !167, !172, !176, !178, !180, !182, !184, !188, !190, !192, !196, !198, !200, !202, !204, !206, !208, !210, !212, !214, !218, !224, !226, !228, !232, !234, !236, !238, !240, !242, !244, !246, !250, !254, !256, !258, !263, !265, !267, !269, !271, !273, !275, !279, !285, !289, !294, !296, !300, !304, !317, !321, !325, !329, !333, !338, !340, !344, !348, !352, !360, !364, !368, !372, !376, !380, !386, !390, !394, !396, !404, !408, !415, !417, !419, !423, !427, !431, !436, !440, !445, !446, !447, !448, !450, !451, !452, !453, !454, !455, !456, !458, !459, !460, !461, !462, !466, !467, !468, !469, !470, !471, !472, !473, !474, !475, !476, !477, !478, !479, !480, !481, !482, !483, !484, !485, !486, !487, !488, !489, !490, !494, !496, !498, !500, !502, !504, !506, !508, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !595, !597, !599, !601, !603, !605}
!26 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !28, file: !29, line: 223)
!27 = !DINamespace(name: "std", scope: null)
!28 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !29, file: !29, line: 53, type: !30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!29 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/__clang_cuda_math_forward_declares.h", directory: "")
!30 = !DISubroutineType(types: !31)
!31 = !{!32, !32}
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !34, file: !29, line: 224)
!34 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !29, file: !29, line: 55, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!35 = !DISubroutineType(types: !36)
!36 = !{!22, !22}
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !38, file: !29, line: 225)
!38 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !29, file: !29, line: 57, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !40, file: !29, line: 226)
!40 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !29, file: !29, line: 59, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !42, file: !29, line: 227)
!42 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !29, file: !29, line: 61, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !44, file: !29, line: 228)
!44 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !29, file: !29, line: 65, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !46, file: !29, line: 229)
!46 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !29, file: !29, line: 63, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!47 = !DISubroutineType(types: !48)
!48 = !{!22, !22, !22}
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !50, file: !29, line: 230)
!50 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !29, file: !29, line: 67, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !52, file: !29, line: 231)
!52 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !29, file: !29, line: 69, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !54, file: !29, line: 232)
!54 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !29, file: !29, line: 71, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !56, file: !29, line: 233)
!56 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !29, file: !29, line: 73, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !58, file: !29, line: 234)
!58 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !29, file: !29, line: 75, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !60, file: !29, line: 235)
!60 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !29, file: !29, line: 77, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !62, file: !29, line: 236)
!62 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !29, file: !29, line: 81, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !64, file: !29, line: 237)
!64 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !29, file: !29, line: 79, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !66, file: !29, line: 238)
!66 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !29, file: !29, line: 85, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !68, file: !29, line: 239)
!68 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !29, file: !29, line: 83, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !70, file: !29, line: 240)
!70 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !29, file: !29, line: 87, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !72, file: !29, line: 241)
!72 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !29, file: !29, line: 89, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !74, file: !29, line: 242)
!74 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !29, file: !29, line: 91, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !76, file: !29, line: 243)
!76 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !29, file: !29, line: 93, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !78, file: !29, line: 244)
!78 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !29, file: !29, line: 95, type: !79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!79 = !DISubroutineType(types: !80)
!80 = !{!22, !22, !22, !22}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !82, file: !29, line: 245)
!82 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !29, file: !29, line: 97, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !84, file: !29, line: 246)
!84 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !29, file: !29, line: 99, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !86, file: !29, line: 247)
!86 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !29, file: !29, line: 101, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !88, file: !29, line: 248)
!88 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !29, file: !29, line: 103, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!89 = !DISubroutineType(types: !90)
!90 = !{!32, !22}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !92, file: !29, line: 249)
!92 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !29, file: !29, line: 105, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!93 = !DISubroutineType(types: !94)
!94 = !{!22, !22, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !97, file: !29, line: 250)
!97 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !29, file: !29, line: 107, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !99, file: !29, line: 251)
!99 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !29, file: !29, line: 109, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !101, file: !29, line: 252)
!101 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !29, file: !29, line: 114, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!102 = !DISubroutineType(types: !103)
!103 = !{!104, !22}
!104 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !106, file: !29, line: 253)
!106 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !29, file: !29, line: 118, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!107 = !DISubroutineType(types: !108)
!108 = !{!104, !22, !22}
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !110, file: !29, line: 254)
!110 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !29, file: !29, line: 117, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !112, file: !29, line: 255)
!112 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !29, file: !29, line: 123, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !114, file: !29, line: 256)
!114 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !29, file: !29, line: 127, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !116, file: !29, line: 257)
!116 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !29, file: !29, line: 126, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !118, file: !29, line: 258)
!118 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !29, file: !29, line: 129, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !120, file: !29, line: 259)
!120 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !29, file: !29, line: 134, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !122, file: !29, line: 260)
!122 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !29, file: !29, line: 136, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !124, file: !29, line: 261)
!124 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !29, file: !29, line: 138, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !126, file: !29, line: 262)
!126 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !29, file: !29, line: 139, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!127 = !DISubroutineType(types: !128)
!128 = !{!129, !129}
!129 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !131, file: !29, line: 263)
!131 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !29, file: !29, line: 141, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!132 = !DISubroutineType(types: !133)
!133 = !{!22, !22, !32}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !135, file: !29, line: 264)
!135 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !29, file: !29, line: 143, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !137, file: !29, line: 265)
!137 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !29, file: !29, line: 144, type: !138, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!138 = !DISubroutineType(types: !139)
!139 = !{!140, !140}
!140 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !142, file: !29, line: 266)
!142 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !29, file: !29, line: 146, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!143 = !DISubroutineType(types: !144)
!144 = !{!140, !22}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !146, file: !29, line: 267)
!146 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !29, file: !29, line: 159, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !148, file: !29, line: 268)
!148 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !29, file: !29, line: 148, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !150, file: !29, line: 269)
!150 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !29, file: !29, line: 150, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !152, file: !29, line: 270)
!152 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !29, file: !29, line: 152, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !154, file: !29, line: 271)
!154 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !29, file: !29, line: 154, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !156, file: !29, line: 272)
!156 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !29, file: !29, line: 161, type: !157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!157 = !DISubroutineType(types: !158)
!158 = !{!129, !22}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !160, file: !29, line: 273)
!160 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !29, file: !29, line: 163, type: !157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !162, file: !29, line: 274)
!162 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !29, file: !29, line: 164, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !164, file: !29, line: 275)
!164 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !29, file: !29, line: 166, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!165 = !DISubroutineType(types: !166)
!166 = !{!22, !22, !21}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !168, file: !29, line: 276)
!168 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !29, file: !29, line: 167, type: !169, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!169 = !DISubroutineType(types: !170)
!170 = !{!171, !18}
!171 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !173, file: !29, line: 277)
!173 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !29, file: !29, line: 168, type: !174, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!174 = !DISubroutineType(types: !175)
!175 = !{!22, !18}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !177, file: !29, line: 278)
!177 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !29, file: !29, line: 170, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !179, file: !29, line: 279)
!179 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !29, file: !29, line: 172, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !181, file: !29, line: 280)
!181 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !29, file: !29, line: 176, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !183, file: !29, line: 281)
!183 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !29, file: !29, line: 178, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !185, file: !29, line: 282)
!185 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !29, file: !29, line: 180, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DISubroutineType(types: !187)
!187 = !{!22, !22, !22, !95}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !189, file: !29, line: 283)
!189 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !29, file: !29, line: 182, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !191, file: !29, line: 284)
!191 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !29, file: !29, line: 184, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !193, file: !29, line: 285)
!193 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !29, file: !29, line: 186, type: !194, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!194 = !DISubroutineType(types: !195)
!195 = !{!22, !22, !129}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !197, file: !29, line: 286)
!197 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !29, file: !29, line: 188, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !199, file: !29, line: 287)
!199 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !29, file: !29, line: 190, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !201, file: !29, line: 288)
!201 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !29, file: !29, line: 192, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !203, file: !29, line: 289)
!203 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !29, file: !29, line: 194, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !205, file: !29, line: 290)
!205 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !29, file: !29, line: 196, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !207, file: !29, line: 291)
!207 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !29, file: !29, line: 198, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !209, file: !29, line: 292)
!209 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !29, file: !29, line: 200, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !211, file: !29, line: 293)
!211 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !29, file: !29, line: 202, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !213, file: !29, line: 294)
!213 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !29, file: !29, line: 204, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !215, file: !217, line: 52)
!215 = !DISubprogram(name: "abs", scope: !216, file: !216, line: 840, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!217 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !219, file: !223, line: 83)
!219 = !DISubprogram(name: "acos", scope: !220, file: !220, line: 53, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!221 = !DISubroutineType(types: !222)
!222 = !{!171, !171}
!223 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cmath", directory: "")
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !225, file: !223, line: 102)
!225 = !DISubprogram(name: "asin", scope: !220, file: !220, line: 55, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !227, file: !223, line: 121)
!227 = !DISubprogram(name: "atan", scope: !220, file: !220, line: 57, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !229, file: !223, line: 140)
!229 = !DISubprogram(name: "atan2", scope: !220, file: !220, line: 59, type: !230, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DISubroutineType(types: !231)
!231 = !{!171, !171, !171}
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !233, file: !223, line: 161)
!233 = !DISubprogram(name: "ceil", scope: !220, file: !220, line: 159, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !235, file: !223, line: 180)
!235 = !DISubprogram(name: "cos", scope: !220, file: !220, line: 62, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !237, file: !223, line: 199)
!237 = !DISubprogram(name: "cosh", scope: !220, file: !220, line: 71, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !239, file: !223, line: 218)
!239 = !DISubprogram(name: "exp", scope: !220, file: !220, line: 95, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !241, file: !223, line: 237)
!241 = !DISubprogram(name: "fabs", scope: !220, file: !220, line: 162, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !243, file: !223, line: 256)
!243 = !DISubprogram(name: "floor", scope: !220, file: !220, line: 165, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !245, file: !223, line: 275)
!245 = !DISubprogram(name: "fmod", scope: !220, file: !220, line: 168, type: !230, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !247, file: !223, line: 296)
!247 = !DISubprogram(name: "frexp", scope: !220, file: !220, line: 98, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DISubroutineType(types: !249)
!249 = !{!171, !171, !95}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !251, file: !223, line: 315)
!251 = !DISubprogram(name: "ldexp", scope: !220, file: !220, line: 101, type: !252, flags: DIFlagPrototyped, spFlags: 0)
!252 = !DISubroutineType(types: !253)
!253 = !{!171, !171, !32}
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !255, file: !223, line: 334)
!255 = !DISubprogram(name: "log", scope: !220, file: !220, line: 104, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !257, file: !223, line: 353)
!257 = !DISubprogram(name: "log10", scope: !220, file: !220, line: 107, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !259, file: !223, line: 372)
!259 = !DISubprogram(name: "modf", scope: !220, file: !220, line: 110, type: !260, flags: DIFlagPrototyped, spFlags: 0)
!260 = !DISubroutineType(types: !261)
!261 = !{!171, !171, !262}
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !264, file: !223, line: 384)
!264 = !DISubprogram(name: "pow", scope: !220, file: !220, line: 140, type: !230, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !266, file: !223, line: 421)
!266 = !DISubprogram(name: "sin", scope: !220, file: !220, line: 64, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !268, file: !223, line: 440)
!268 = !DISubprogram(name: "sinh", scope: !220, file: !220, line: 73, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !270, file: !223, line: 459)
!270 = !DISubprogram(name: "sqrt", scope: !220, file: !220, line: 143, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !272, file: !223, line: 478)
!272 = !DISubprogram(name: "tan", scope: !220, file: !220, line: 66, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !274, file: !223, line: 497)
!274 = !DISubprogram(name: "tanh", scope: !220, file: !220, line: 75, type: !221, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !276, file: !278, line: 127)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !216, line: 62, baseType: !277)
!277 = !DICompositeType(tag: DW_TAG_structure_type, file: !216, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!278 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cstdlib", directory: "")
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !280, file: !278, line: 128)
!280 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !216, line: 70, baseType: !281)
!281 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !216, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !282, identifier: "_ZTS6ldiv_t")
!282 = !{!283, !284}
!283 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !281, file: !216, line: 68, baseType: !129, size: 64)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !281, file: !216, line: 69, baseType: !129, size: 64, offset: 64)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !286, file: !278, line: 130)
!286 = !DISubprogram(name: "abort", scope: !216, file: !216, line: 591, type: !287, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!287 = !DISubroutineType(types: !288)
!288 = !{null}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !290, file: !278, line: 134)
!290 = !DISubprogram(name: "atexit", scope: !216, file: !216, line: 595, type: !291, flags: DIFlagPrototyped, spFlags: 0)
!291 = !DISubroutineType(types: !292)
!292 = !{!32, !293}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !287, size: 64)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !295, file: !278, line: 140)
!295 = !DISubprogram(name: "atof", scope: !216, file: !216, line: 101, type: !169, flags: DIFlagPrototyped, spFlags: 0)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !297, file: !278, line: 141)
!297 = !DISubprogram(name: "atoi", scope: !216, file: !216, line: 104, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DISubroutineType(types: !299)
!299 = !{!32, !18}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !301, file: !278, line: 142)
!301 = !DISubprogram(name: "atol", scope: !216, file: !216, line: 107, type: !302, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DISubroutineType(types: !303)
!303 = !{!129, !18}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !305, file: !278, line: 143)
!305 = !DISubprogram(name: "bsearch", scope: !216, file: !216, line: 820, type: !306, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DISubroutineType(types: !307)
!307 = !{!24, !308, !308, !310, !310, !313}
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!309 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !311, line: 46, baseType: !312)
!311 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/stddef.h", directory: "")
!312 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !216, line: 808, baseType: !314)
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64)
!315 = !DISubroutineType(types: !316)
!316 = !{!32, !308, !308}
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !318, file: !278, line: 144)
!318 = !DISubprogram(name: "calloc", scope: !216, file: !216, line: 542, type: !319, flags: DIFlagPrototyped, spFlags: 0)
!319 = !DISubroutineType(types: !320)
!320 = !{!24, !310, !310}
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !322, file: !278, line: 145)
!322 = !DISubprogram(name: "div", scope: !216, file: !216, line: 852, type: !323, flags: DIFlagPrototyped, spFlags: 0)
!323 = !DISubroutineType(types: !324)
!324 = !{!276, !32, !32}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !326, file: !278, line: 146)
!326 = !DISubprogram(name: "exit", scope: !216, file: !216, line: 617, type: !327, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!327 = !DISubroutineType(types: !328)
!328 = !{null, !32}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !330, file: !278, line: 147)
!330 = !DISubprogram(name: "free", scope: !216, file: !216, line: 565, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DISubroutineType(types: !332)
!332 = !{null, !24}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !334, file: !278, line: 148)
!334 = !DISubprogram(name: "getenv", scope: !216, file: !216, line: 634, type: !335, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DISubroutineType(types: !336)
!336 = !{!337, !18}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !339, file: !278, line: 149)
!339 = !DISubprogram(name: "labs", scope: !216, file: !216, line: 841, type: !127, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !341, file: !278, line: 150)
!341 = !DISubprogram(name: "ldiv", scope: !216, file: !216, line: 854, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DISubroutineType(types: !343)
!343 = !{!280, !129, !129}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !345, file: !278, line: 151)
!345 = !DISubprogram(name: "malloc", scope: !216, file: !216, line: 539, type: !346, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DISubroutineType(types: !347)
!347 = !{!24, !310}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !349, file: !278, line: 153)
!349 = !DISubprogram(name: "mblen", scope: !216, file: !216, line: 922, type: !350, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DISubroutineType(types: !351)
!351 = !{!32, !18, !310}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !353, file: !278, line: 154)
!353 = !DISubprogram(name: "mbstowcs", scope: !216, file: !216, line: 933, type: !354, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DISubroutineType(types: !355)
!355 = !{!310, !356, !359, !310}
!356 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !357)
!357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !358, size: 64)
!358 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !18)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !361, file: !278, line: 155)
!361 = !DISubprogram(name: "mbtowc", scope: !216, file: !216, line: 925, type: !362, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DISubroutineType(types: !363)
!363 = !{!32, !356, !359, !310}
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !365, file: !278, line: 157)
!365 = !DISubprogram(name: "qsort", scope: !216, file: !216, line: 830, type: !366, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !24, !310, !310, !313}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !369, file: !278, line: 163)
!369 = !DISubprogram(name: "rand", scope: !216, file: !216, line: 453, type: !370, flags: DIFlagPrototyped, spFlags: 0)
!370 = !DISubroutineType(types: !371)
!371 = !{!32}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !373, file: !278, line: 164)
!373 = !DISubprogram(name: "realloc", scope: !216, file: !216, line: 550, type: !374, flags: DIFlagPrototyped, spFlags: 0)
!374 = !DISubroutineType(types: !375)
!375 = !{!24, !24, !310}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !377, file: !278, line: 165)
!377 = !DISubprogram(name: "srand", scope: !216, file: !216, line: 455, type: !378, flags: DIFlagPrototyped, spFlags: 0)
!378 = !DISubroutineType(types: !379)
!379 = !{null, !9}
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !381, file: !278, line: 166)
!381 = !DISubprogram(name: "strtod", scope: !216, file: !216, line: 117, type: !382, flags: DIFlagPrototyped, spFlags: 0)
!382 = !DISubroutineType(types: !383)
!383 = !{!171, !359, !384}
!384 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !385)
!385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !337, size: 64)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !387, file: !278, line: 167)
!387 = !DISubprogram(name: "strtol", scope: !216, file: !216, line: 176, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!388 = !DISubroutineType(types: !389)
!389 = !{!129, !359, !384, !32}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !391, file: !278, line: 168)
!391 = !DISubprogram(name: "strtoul", scope: !216, file: !216, line: 180, type: !392, flags: DIFlagPrototyped, spFlags: 0)
!392 = !DISubroutineType(types: !393)
!393 = !{!312, !359, !384, !32}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !395, file: !278, line: 169)
!395 = !DISubprogram(name: "system", scope: !216, file: !216, line: 784, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !397, file: !278, line: 171)
!397 = !DISubprogram(name: "wcstombs", scope: !216, file: !216, line: 936, type: !398, flags: DIFlagPrototyped, spFlags: 0)
!398 = !DISubroutineType(types: !399)
!399 = !{!310, !400, !401, !310}
!400 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !337)
!401 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !402)
!402 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !403, size: 64)
!403 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !358)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !405, file: !278, line: 172)
!405 = !DISubprogram(name: "wctomb", scope: !216, file: !216, line: 929, type: !406, flags: DIFlagPrototyped, spFlags: 0)
!406 = !DISubroutineType(types: !407)
!407 = !{!32, !337, !358}
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !410, file: !278, line: 200)
!409 = !DINamespace(name: "__gnu_cxx", scope: null)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !216, line: 80, baseType: !411)
!411 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !216, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !412, identifier: "_ZTS7lldiv_t")
!412 = !{!413, !414}
!413 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !411, file: !216, line: 78, baseType: !140, size: 64)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !411, file: !216, line: 79, baseType: !140, size: 64, offset: 64)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !416, file: !278, line: 206)
!416 = !DISubprogram(name: "_Exit", scope: !216, file: !216, line: 629, type: !327, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !418, file: !278, line: 210)
!418 = !DISubprogram(name: "llabs", scope: !216, file: !216, line: 844, type: !138, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !420, file: !278, line: 216)
!420 = !DISubprogram(name: "lldiv", scope: !216, file: !216, line: 858, type: !421, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DISubroutineType(types: !422)
!422 = !{!410, !140, !140}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !424, file: !278, line: 227)
!424 = !DISubprogram(name: "atoll", scope: !216, file: !216, line: 112, type: !425, flags: DIFlagPrototyped, spFlags: 0)
!425 = !DISubroutineType(types: !426)
!426 = !{!140, !18}
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !428, file: !278, line: 228)
!428 = !DISubprogram(name: "strtoll", scope: !216, file: !216, line: 200, type: !429, flags: DIFlagPrototyped, spFlags: 0)
!429 = !DISubroutineType(types: !430)
!430 = !{!140, !359, !384, !32}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !432, file: !278, line: 229)
!432 = !DISubprogram(name: "strtoull", scope: !216, file: !216, line: 205, type: !433, flags: DIFlagPrototyped, spFlags: 0)
!433 = !DISubroutineType(types: !434)
!434 = !{!435, !359, !384, !32}
!435 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !437, file: !278, line: 231)
!437 = !DISubprogram(name: "strtof", scope: !216, file: !216, line: 123, type: !438, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DISubroutineType(types: !439)
!439 = !{!22, !359, !384}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !441, file: !278, line: 232)
!441 = !DISubprogram(name: "strtold", scope: !216, file: !216, line: 126, type: !442, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DISubroutineType(types: !443)
!443 = !{!444, !359, !384}
!444 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !410, file: !278, line: 240)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !416, file: !278, line: 242)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !418, file: !278, line: 244)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !449, file: !278, line: 245)
!449 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !409, file: !278, line: 213, type: !421, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !420, file: !278, line: 246)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !424, file: !278, line: 248)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !437, file: !278, line: 249)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !428, file: !278, line: 250)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !432, file: !278, line: 251)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !441, file: !278, line: 252)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !286, file: !457, line: 38)
!457 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/stdlib.h", directory: "")
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !290, file: !457, line: 39)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !326, file: !457, line: 40)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !276, file: !457, line: 51)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !280, file: !457, line: 52)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !463, file: !457, line: 54)
!463 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !27, file: !217, line: 79, type: !464, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DISubroutineType(types: !465)
!465 = !{!444, !444}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !295, file: !457, line: 55)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !297, file: !457, line: 56)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !301, file: !457, line: 57)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !305, file: !457, line: 58)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !318, file: !457, line: 59)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !449, file: !457, line: 60)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !330, file: !457, line: 61)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !334, file: !457, line: 62)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !339, file: !457, line: 63)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !341, file: !457, line: 64)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !345, file: !457, line: 65)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !349, file: !457, line: 67)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !353, file: !457, line: 68)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !361, file: !457, line: 69)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !365, file: !457, line: 71)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !369, file: !457, line: 72)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !373, file: !457, line: 73)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !377, file: !457, line: 74)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !381, file: !457, line: 75)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !387, file: !457, line: 76)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !391, file: !457, line: 77)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !395, file: !457, line: 78)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !397, file: !457, line: 80)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !405, file: !457, line: 81)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !491, file: !493, line: 414)
!491 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !492, file: !492, line: 1126, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!492 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "")
!493 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/__clang_cuda_cmath.h", directory: "")
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !495, file: !493, line: 415)
!495 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !492, file: !492, line: 1154, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !497, file: !493, line: 416)
!497 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !492, file: !492, line: 1121, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !499, file: !493, line: 417)
!499 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !492, file: !492, line: 1159, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !501, file: !493, line: 418)
!501 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !492, file: !492, line: 1111, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !503, file: !493, line: 419)
!503 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !492, file: !492, line: 1116, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !505, file: !493, line: 420)
!505 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !492, file: !492, line: 1164, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !507, file: !493, line: 421)
!507 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !492, file: !492, line: 1199, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !509, file: !493, line: 422)
!509 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !510, file: !510, line: 647, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!510 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "")
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !512, file: !493, line: 423)
!512 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !492, file: !492, line: 973, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !514, file: !493, line: 424)
!514 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !492, file: !492, line: 1027, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !516, file: !493, line: 425)
!516 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !492, file: !492, line: 1096, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !518, file: !493, line: 426)
!518 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !492, file: !492, line: 1259, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !520, file: !493, line: 427)
!520 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !492, file: !492, line: 1249, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !522, file: !493, line: 428)
!522 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !510, file: !510, line: 637, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !524, file: !493, line: 429)
!524 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !492, file: !492, line: 1078, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !526, file: !493, line: 430)
!526 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !492, file: !492, line: 1169, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !528, file: !493, line: 431)
!528 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !510, file: !510, line: 582, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !530, file: !493, line: 432)
!530 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !492, file: !492, line: 1385, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !532, file: !493, line: 433)
!532 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !510, file: !510, line: 572, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !534, file: !493, line: 434)
!534 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !492, file: !492, line: 1337, type: !79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !536, file: !493, line: 435)
!536 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !510, file: !510, line: 602, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !538, file: !493, line: 436)
!538 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !510, file: !510, line: 597, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !540, file: !493, line: 437)
!540 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !492, file: !492, line: 1322, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !542, file: !493, line: 438)
!542 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !492, file: !492, line: 1312, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !544, file: !493, line: 439)
!544 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !492, file: !492, line: 1174, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !546, file: !493, line: 440)
!546 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !492, file: !492, line: 1390, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !548, file: !493, line: 441)
!548 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !492, file: !492, line: 1289, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !550, file: !493, line: 442)
!550 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !492, file: !492, line: 1284, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !552, file: !493, line: 443)
!552 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !492, file: !492, line: 933, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !554, file: !493, line: 444)
!554 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !492, file: !492, line: 1371, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !556, file: !493, line: 445)
!556 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !492, file: !492, line: 1140, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !558, file: !493, line: 446)
!558 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !492, file: !492, line: 1149, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !560, file: !493, line: 447)
!560 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !492, file: !492, line: 1069, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !562, file: !493, line: 448)
!562 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !492, file: !492, line: 1395, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !564, file: !493, line: 449)
!564 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !492, file: !492, line: 1131, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !566, file: !493, line: 450)
!566 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !492, file: !492, line: 924, type: !157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !568, file: !493, line: 451)
!568 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !492, file: !492, line: 1376, type: !157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !570, file: !493, line: 452)
!570 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !492, file: !492, line: 1317, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !572, file: !493, line: 453)
!572 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !492, file: !492, line: 938, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !574, file: !493, line: 454)
!574 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !492, file: !492, line: 1002, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !576, file: !493, line: 455)
!576 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !492, file: !492, line: 1352, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !578, file: !493, line: 456)
!578 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !492, file: !492, line: 1327, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !580, file: !493, line: 457)
!580 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !492, file: !492, line: 1332, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !582, file: !493, line: 458)
!582 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !492, file: !492, line: 919, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !584, file: !493, line: 459)
!584 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !492, file: !492, line: 1366, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !586, file: !493, line: 462)
!586 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !492, file: !492, line: 1299, type: !194, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !588, file: !493, line: 464)
!588 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !492, file: !492, line: 1294, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !590, file: !493, line: 465)
!590 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !492, file: !492, line: 1018, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !592, file: !493, line: 466)
!592 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !492, file: !492, line: 1101, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !594, file: !493, line: 467)
!594 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !510, file: !510, line: 887, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !596, file: !493, line: 468)
!596 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !492, file: !492, line: 1060, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !598, file: !493, line: 469)
!598 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !492, file: !492, line: 1106, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !600, file: !493, line: 470)
!600 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !492, file: !492, line: 1361, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !602, file: !493, line: 471)
!602 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !510, file: !510, line: 642, type: !35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !463, file: !604, line: 38)
!604 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/math.h", directory: "")
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !606, file: !604, line: 54)
!606 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !27, file: !223, line: 380, type: !607, flags: DIFlagPrototyped, spFlags: 0)
!607 = !DISubroutineType(types: !608)
!608 = !{!444, !444, !609}
!609 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !444, size: 64)
!610 = !{!"clang version 9.0.0 (https://github.com/yebinchon/llvm-project a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!611 = distinct !DISubprogram(name: "GPU_laplace3d", linkageName: "_Z13GPU_laplace3diiiiPfS_", scope: !612, file: !612, line: 26, type: !613, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !615)
!612 = !DIFile(filename: "./laplace3d_kernel.cu", directory: "/u/ah7226/xstack-benchmark/ispass-2009/LPS")
!613 = !DISubroutineType(types: !614)
!614 = !{null, !32, !32, !32, !32, !21, !21}
!615 = !{}
!616 = !DILocalVariable(name: "NX", arg: 1, scope: !611, file: !612, line: 26, type: !32)
!617 = !DILocation(line: 26, column: 35, scope: !611)
!618 = !DILocalVariable(name: "NY", arg: 2, scope: !611, file: !612, line: 26, type: !32)
!619 = !DILocation(line: 26, column: 43, scope: !611)
!620 = !DILocalVariable(name: "NZ", arg: 3, scope: !611, file: !612, line: 26, type: !32)
!621 = !DILocation(line: 26, column: 51, scope: !611)
!622 = !DILocalVariable(name: "pitch", arg: 4, scope: !611, file: !612, line: 26, type: !32)
!623 = !DILocation(line: 26, column: 59, scope: !611)
!624 = !DILocalVariable(name: "d_u1", arg: 5, scope: !611, file: !612, line: 27, type: !21)
!625 = !DILocation(line: 27, column: 38, scope: !611)
!626 = !DILocalVariable(name: "d_u2", arg: 6, scope: !611, file: !612, line: 27, type: !21)
!627 = !DILocation(line: 27, column: 51, scope: !611)
!628 = !DILocation(line: 28, column: 1, scope: !611)
!629 = !DILocation(line: 140, column: 1, scope: !611)
!630 = distinct !DISubprogram(name: "Gold_laplace3d", scope: !5, file: !5, line: 32, type: !631, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !615)
!631 = !DISubroutineType(types: !632)
!632 = !{null, !32, !32, !32, !21, !21}
!633 = !DILocalVariable(name: "NX", arg: 1, scope: !630, file: !5, line: 32, type: !32)
!634 = !DILocation(line: 32, column: 25, scope: !630)
!635 = !DILocalVariable(name: "NY", arg: 2, scope: !630, file: !5, line: 32, type: !32)
!636 = !DILocation(line: 32, column: 33, scope: !630)
!637 = !DILocalVariable(name: "NZ", arg: 3, scope: !630, file: !5, line: 32, type: !32)
!638 = !DILocation(line: 32, column: 41, scope: !630)
!639 = !DILocalVariable(name: "u1", arg: 4, scope: !630, file: !5, line: 32, type: !21)
!640 = !DILocation(line: 32, column: 52, scope: !630)
!641 = !DILocalVariable(name: "u2", arg: 5, scope: !630, file: !5, line: 32, type: !21)
!642 = !DILocation(line: 32, column: 63, scope: !630)
!643 = !DILocalVariable(name: "i", scope: !630, file: !5, line: 34, type: !32)
!644 = !DILocation(line: 34, column: 9, scope: !630)
!645 = !DILocalVariable(name: "j", scope: !630, file: !5, line: 34, type: !32)
!646 = !DILocation(line: 34, column: 12, scope: !630)
!647 = !DILocalVariable(name: "k", scope: !630, file: !5, line: 34, type: !32)
!648 = !DILocation(line: 34, column: 15, scope: !630)
!649 = !DILocalVariable(name: "ind", scope: !630, file: !5, line: 34, type: !32)
!650 = !DILocation(line: 34, column: 18, scope: !630)
!651 = !DILocalVariable(name: "sixth", scope: !630, file: !5, line: 35, type: !22)
!652 = !DILocation(line: 35, column: 9, scope: !630)
!653 = !DILocation(line: 37, column: 9, scope: !654)
!654 = distinct !DILexicalBlock(scope: !630, file: !5, line: 37, column: 3)
!655 = !DILocation(line: 37, column: 8, scope: !654)
!656 = !DILocation(line: 37, column: 13, scope: !657)
!657 = distinct !DILexicalBlock(scope: !654, file: !5, line: 37, column: 3)
!658 = !DILocation(line: 37, column: 15, scope: !657)
!659 = !DILocation(line: 37, column: 14, scope: !657)
!660 = !DILocation(line: 37, column: 3, scope: !654)
!661 = !DILocation(line: 38, column: 11, scope: !662)
!662 = distinct !DILexicalBlock(scope: !663, file: !5, line: 38, column: 5)
!663 = distinct !DILexicalBlock(scope: !657, file: !5, line: 37, column: 24)
!664 = !DILocation(line: 38, column: 10, scope: !662)
!665 = !DILocation(line: 38, column: 15, scope: !666)
!666 = distinct !DILexicalBlock(scope: !662, file: !5, line: 38, column: 5)
!667 = !DILocation(line: 38, column: 17, scope: !666)
!668 = !DILocation(line: 38, column: 16, scope: !666)
!669 = !DILocation(line: 38, column: 5, scope: !662)
!670 = !DILocation(line: 39, column: 13, scope: !671)
!671 = distinct !DILexicalBlock(scope: !672, file: !5, line: 39, column: 7)
!672 = distinct !DILexicalBlock(scope: !666, file: !5, line: 38, column: 26)
!673 = !DILocation(line: 39, column: 12, scope: !671)
!674 = !DILocation(line: 39, column: 17, scope: !675)
!675 = distinct !DILexicalBlock(scope: !671, file: !5, line: 39, column: 7)
!676 = !DILocation(line: 39, column: 19, scope: !675)
!677 = !DILocation(line: 39, column: 18, scope: !675)
!678 = !DILocation(line: 39, column: 7, scope: !671)
!679 = !DILocation(line: 40, column: 8, scope: !680)
!680 = distinct !DILexicalBlock(scope: !675, file: !5, line: 39, column: 28)
!681 = !DILocation(line: 40, column: 12, scope: !680)
!682 = !DILocation(line: 40, column: 14, scope: !680)
!683 = !DILocation(line: 40, column: 13, scope: !680)
!684 = !DILocation(line: 40, column: 10, scope: !680)
!685 = !DILocation(line: 40, column: 19, scope: !680)
!686 = !DILocation(line: 40, column: 21, scope: !680)
!687 = !DILocation(line: 40, column: 20, scope: !680)
!688 = !DILocation(line: 40, column: 24, scope: !680)
!689 = !DILocation(line: 40, column: 23, scope: !680)
!690 = !DILocation(line: 40, column: 17, scope: !680)
!691 = !DILocation(line: 40, column: 6, scope: !680)
!692 = !DILocation(line: 42, column: 13, scope: !693)
!693 = distinct !DILexicalBlock(scope: !680, file: !5, line: 42, column: 13)
!694 = !DILocation(line: 42, column: 14, scope: !693)
!695 = !DILocation(line: 42, column: 18, scope: !693)
!696 = !DILocation(line: 42, column: 21, scope: !693)
!697 = !DILocation(line: 42, column: 24, scope: !693)
!698 = !DILocation(line: 42, column: 26, scope: !693)
!699 = !DILocation(line: 42, column: 22, scope: !693)
!700 = !DILocation(line: 42, column: 29, scope: !693)
!701 = !DILocation(line: 42, column: 32, scope: !693)
!702 = !DILocation(line: 42, column: 33, scope: !693)
!703 = !DILocation(line: 42, column: 37, scope: !693)
!704 = !DILocation(line: 42, column: 40, scope: !693)
!705 = !DILocation(line: 42, column: 43, scope: !693)
!706 = !DILocation(line: 42, column: 45, scope: !693)
!707 = !DILocation(line: 42, column: 41, scope: !693)
!708 = !DILocation(line: 42, column: 47, scope: !693)
!709 = !DILocation(line: 42, column: 50, scope: !693)
!710 = !DILocation(line: 42, column: 51, scope: !693)
!711 = !DILocation(line: 42, column: 55, scope: !693)
!712 = !DILocation(line: 42, column: 58, scope: !693)
!713 = !DILocation(line: 42, column: 61, scope: !693)
!714 = !DILocation(line: 42, column: 63, scope: !693)
!715 = !DILocation(line: 42, column: 59, scope: !693)
!716 = !DILocation(line: 42, column: 13, scope: !680)
!717 = !DILocation(line: 43, column: 21, scope: !718)
!718 = distinct !DILexicalBlock(scope: !693, file: !5, line: 42, column: 67)
!719 = !DILocation(line: 43, column: 24, scope: !718)
!720 = !DILocation(line: 43, column: 11, scope: !718)
!721 = !DILocation(line: 43, column: 14, scope: !718)
!722 = !DILocation(line: 43, column: 19, scope: !718)
!723 = !DILocation(line: 44, column: 9, scope: !718)
!724 = !DILocation(line: 46, column: 23, scope: !725)
!725 = distinct !DILexicalBlock(scope: !693, file: !5, line: 45, column: 14)
!726 = !DILocation(line: 46, column: 26, scope: !725)
!727 = !DILocation(line: 46, column: 29, scope: !725)
!728 = !DILocation(line: 46, column: 39, scope: !725)
!729 = !DILocation(line: 46, column: 42, scope: !725)
!730 = !DILocation(line: 46, column: 45, scope: !725)
!731 = !DILocation(line: 46, column: 37, scope: !725)
!732 = !DILocation(line: 47, column: 23, scope: !725)
!733 = !DILocation(line: 47, column: 26, scope: !725)
!734 = !DILocation(line: 47, column: 30, scope: !725)
!735 = !DILocation(line: 47, column: 29, scope: !725)
!736 = !DILocation(line: 47, column: 21, scope: !725)
!737 = !DILocation(line: 47, column: 39, scope: !725)
!738 = !DILocation(line: 47, column: 42, scope: !725)
!739 = !DILocation(line: 47, column: 46, scope: !725)
!740 = !DILocation(line: 47, column: 45, scope: !725)
!741 = !DILocation(line: 47, column: 37, scope: !725)
!742 = !DILocation(line: 48, column: 23, scope: !725)
!743 = !DILocation(line: 48, column: 26, scope: !725)
!744 = !DILocation(line: 48, column: 30, scope: !725)
!745 = !DILocation(line: 48, column: 33, scope: !725)
!746 = !DILocation(line: 48, column: 32, scope: !725)
!747 = !DILocation(line: 48, column: 29, scope: !725)
!748 = !DILocation(line: 48, column: 21, scope: !725)
!749 = !DILocation(line: 48, column: 39, scope: !725)
!750 = !DILocation(line: 48, column: 42, scope: !725)
!751 = !DILocation(line: 48, column: 46, scope: !725)
!752 = !DILocation(line: 48, column: 49, scope: !725)
!753 = !DILocation(line: 48, column: 48, scope: !725)
!754 = !DILocation(line: 48, column: 45, scope: !725)
!755 = !DILocation(line: 48, column: 37, scope: !725)
!756 = !DILocation(line: 48, column: 57, scope: !725)
!757 = !DILocation(line: 48, column: 55, scope: !725)
!758 = !DILocation(line: 46, column: 11, scope: !725)
!759 = !DILocation(line: 46, column: 14, scope: !725)
!760 = !DILocation(line: 46, column: 19, scope: !725)
!761 = !DILocation(line: 50, column: 7, scope: !680)
!762 = !DILocation(line: 39, column: 24, scope: !675)
!763 = !DILocation(line: 39, column: 7, scope: !675)
!764 = distinct !{!764, !678, !765}
!765 = !DILocation(line: 50, column: 7, scope: !671)
!766 = !DILocation(line: 51, column: 5, scope: !672)
!767 = !DILocation(line: 38, column: 22, scope: !666)
!768 = !DILocation(line: 38, column: 5, scope: !666)
!769 = distinct !{!769, !669, !770}
!770 = !DILocation(line: 51, column: 5, scope: !662)
!771 = !DILocation(line: 52, column: 3, scope: !663)
!772 = !DILocation(line: 37, column: 20, scope: !657)
!773 = !DILocation(line: 37, column: 3, scope: !657)
!774 = distinct !{!774, !660, !775}
!775 = !DILocation(line: 52, column: 3, scope: !654)
!776 = !DILocation(line: 53, column: 1, scope: !630)
!777 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 61, type: !778, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !615)
!778 = !DISubroutineType(types: !779)
!779 = !{!32, !32, !385}
!780 = !DILocalVariable(name: "argc", arg: 1, scope: !777, file: !5, line: 61, type: !32)
!781 = !DILocation(line: 61, column: 14, scope: !777)
!782 = !DILocalVariable(name: "argv", arg: 2, scope: !777, file: !5, line: 61, type: !385)
!783 = !DILocation(line: 61, column: 27, scope: !777)
!784 = !DILocalVariable(name: "NX", scope: !777, file: !5, line: 65, type: !32)
!785 = !DILocation(line: 65, column: 10, scope: !777)
!786 = !DILocalVariable(name: "NY", scope: !777, file: !5, line: 65, type: !32)
!787 = !DILocation(line: 65, column: 14, scope: !777)
!788 = !DILocalVariable(name: "NZ", scope: !777, file: !5, line: 65, type: !32)
!789 = !DILocation(line: 65, column: 18, scope: !777)
!790 = !DILocalVariable(name: "REPEAT", scope: !777, file: !5, line: 65, type: !32)
!791 = !DILocation(line: 65, column: 22, scope: !777)
!792 = !DILocalVariable(name: "bx", scope: !777, file: !5, line: 65, type: !32)
!793 = !DILocation(line: 65, column: 30, scope: !777)
!794 = !DILocalVariable(name: "by", scope: !777, file: !5, line: 65, type: !32)
!795 = !DILocation(line: 65, column: 34, scope: !777)
!796 = !DILocalVariable(name: "i", scope: !777, file: !5, line: 65, type: !32)
!797 = !DILocation(line: 65, column: 38, scope: !777)
!798 = !DILocalVariable(name: "j", scope: !777, file: !5, line: 65, type: !32)
!799 = !DILocation(line: 65, column: 41, scope: !777)
!800 = !DILocalVariable(name: "k", scope: !777, file: !5, line: 65, type: !32)
!801 = !DILocation(line: 65, column: 44, scope: !777)
!802 = !DILocalVariable(name: "ind", scope: !777, file: !5, line: 65, type: !32)
!803 = !DILocation(line: 65, column: 47, scope: !777)
!804 = !DILocalVariable(name: "pitch", scope: !777, file: !5, line: 65, type: !32)
!805 = !DILocation(line: 65, column: 52, scope: !777)
!806 = !DILocalVariable(name: "pitch_bytes", scope: !777, file: !5, line: 66, type: !310)
!807 = !DILocation(line: 66, column: 10, scope: !777)
!808 = !DILocalVariable(name: "h_u1", scope: !777, file: !5, line: 67, type: !21)
!809 = !DILocation(line: 67, column: 11, scope: !777)
!810 = !DILocalVariable(name: "h_u2", scope: !777, file: !5, line: 67, type: !21)
!811 = !DILocation(line: 67, column: 18, scope: !777)
!812 = !DILocalVariable(name: "h_u3", scope: !777, file: !5, line: 67, type: !21)
!813 = !DILocation(line: 67, column: 25, scope: !777)
!814 = !DILocalVariable(name: "h_foo", scope: !777, file: !5, line: 67, type: !21)
!815 = !DILocation(line: 67, column: 32, scope: !777)
!816 = !DILocalVariable(name: "err", scope: !777, file: !5, line: 67, type: !22)
!817 = !DILocation(line: 67, column: 39, scope: !777)
!818 = !DILocalVariable(name: "d_u1", scope: !777, file: !5, line: 73, type: !21)
!819 = !DILocation(line: 73, column: 11, scope: !777)
!820 = !DILocalVariable(name: "d_u2", scope: !777, file: !5, line: 73, type: !21)
!821 = !DILocation(line: 73, column: 18, scope: !777)
!822 = !DILocalVariable(name: "d_foo", scope: !777, file: !5, line: 73, type: !21)
!823 = !DILocation(line: 73, column: 25, scope: !777)
!824 = !DILocation(line: 77, column: 27, scope: !825)
!825 = distinct !DILexicalBlock(scope: !777, file: !5, line: 77, column: 7)
!826 = !DILocation(line: 77, column: 7, scope: !777)
!827 = !DILocation(line: 78, column: 5, scope: !828)
!828 = distinct !DILexicalBlock(scope: !825, file: !5, line: 77, column: 41)
!829 = !DILocation(line: 79, column: 5, scope: !828)
!830 = !DILocation(line: 82, column: 29, scope: !831)
!831 = distinct !DILexicalBlock(scope: !777, file: !5, line: 82, column: 7)
!832 = !DILocation(line: 82, column: 7, scope: !831)
!833 = !DILocation(line: 82, column: 7, scope: !777)
!834 = !DILocation(line: 83, column: 9, scope: !835)
!835 = distinct !DILexicalBlock(scope: !836, file: !5, line: 83, column: 9)
!836 = distinct !DILexicalBlock(scope: !831, file: !5, line: 82, column: 48)
!837 = !DILocation(line: 83, column: 12, scope: !835)
!838 = !DILocation(line: 83, column: 9, scope: !836)
!839 = !DILocation(line: 84, column: 7, scope: !840)
!840 = distinct !DILexicalBlock(scope: !835, file: !5, line: 83, column: 20)
!841 = !DILocation(line: 85, column: 7, scope: !840)
!842 = !DILocation(line: 87, column: 3, scope: !836)
!843 = !DILocation(line: 89, column: 8, scope: !831)
!844 = !DILocation(line: 91, column: 27, scope: !845)
!845 = distinct !DILexicalBlock(scope: !777, file: !5, line: 91, column: 7)
!846 = !DILocation(line: 91, column: 7, scope: !845)
!847 = !DILocation(line: 91, column: 7, scope: !777)
!848 = !DILocation(line: 92, column: 9, scope: !849)
!849 = distinct !DILexicalBlock(scope: !850, file: !5, line: 92, column: 9)
!850 = distinct !DILexicalBlock(scope: !845, file: !5, line: 91, column: 45)
!851 = !DILocation(line: 92, column: 12, scope: !849)
!852 = !DILocation(line: 92, column: 9, scope: !850)
!853 = !DILocation(line: 93, column: 7, scope: !854)
!854 = distinct !DILexicalBlock(scope: !849, file: !5, line: 92, column: 20)
!855 = !DILocation(line: 94, column: 7, scope: !854)
!856 = !DILocation(line: 96, column: 3, scope: !850)
!857 = !DILocation(line: 98, column: 8, scope: !845)
!858 = !DILocation(line: 100, column: 28, scope: !859)
!859 = distinct !DILexicalBlock(scope: !777, file: !5, line: 100, column: 8)
!860 = !DILocation(line: 100, column: 8, scope: !859)
!861 = !DILocation(line: 100, column: 8, scope: !777)
!862 = !DILocation(line: 102, column: 9, scope: !863)
!863 = distinct !DILexicalBlock(scope: !864, file: !5, line: 102, column: 9)
!864 = distinct !DILexicalBlock(scope: !859, file: !5, line: 100, column: 46)
!865 = !DILocation(line: 102, column: 12, scope: !863)
!866 = !DILocation(line: 102, column: 9, scope: !864)
!867 = !DILocation(line: 103, column: 7, scope: !868)
!868 = distinct !DILexicalBlock(scope: !863, file: !5, line: 102, column: 20)
!869 = !DILocation(line: 104, column: 7, scope: !868)
!870 = !DILocation(line: 106, column: 3, scope: !864)
!871 = !DILocation(line: 108, column: 8, scope: !859)
!872 = !DILocation(line: 110, column: 28, scope: !873)
!873 = distinct !DILexicalBlock(scope: !777, file: !5, line: 110, column: 8)
!874 = !DILocation(line: 110, column: 8, scope: !873)
!875 = !DILocation(line: 110, column: 8, scope: !777)
!876 = !DILocation(line: 112, column: 9, scope: !877)
!877 = distinct !DILexicalBlock(scope: !878, file: !5, line: 112, column: 9)
!878 = distinct !DILexicalBlock(scope: !873, file: !5, line: 110, column: 54)
!879 = !DILocation(line: 112, column: 16, scope: !877)
!880 = !DILocation(line: 112, column: 9, scope: !878)
!881 = !DILocation(line: 113, column: 7, scope: !882)
!882 = distinct !DILexicalBlock(scope: !877, file: !5, line: 112, column: 23)
!883 = !DILocation(line: 114, column: 7, scope: !882)
!884 = !DILocation(line: 116, column: 3, scope: !878)
!885 = !DILocation(line: 118, column: 12, scope: !873)
!886 = !DILocation(line: 120, column: 47, scope: !777)
!887 = !DILocation(line: 120, column: 51, scope: !777)
!888 = !DILocation(line: 120, column: 55, scope: !777)
!889 = !DILocation(line: 120, column: 3, scope: !777)
!890 = !DILocalVariable(name: "deviceCount", scope: !777, file: !5, line: 123, type: !32)
!891 = !DILocation(line: 123, column: 7, scope: !777)
!892 = !DILocation(line: 124, column: 3, scope: !777)
!893 = !DILocation(line: 125, column: 7, scope: !894)
!894 = distinct !DILexicalBlock(scope: !777, file: !5, line: 125, column: 7)
!895 = !DILocation(line: 125, column: 19, scope: !894)
!896 = !DILocation(line: 125, column: 7, scope: !777)
!897 = !DILocation(line: 126, column: 15, scope: !898)
!898 = distinct !DILexicalBlock(scope: !894, file: !5, line: 125, column: 25)
!899 = !DILocation(line: 126, column: 7, scope: !898)
!900 = !DILocation(line: 127, column: 7, scope: !898)
!901 = !DILocalVariable(name: "dev", scope: !777, file: !5, line: 129, type: !32)
!902 = !DILocation(line: 129, column: 7, scope: !777)
!903 = !DILocation(line: 130, column: 12, scope: !904)
!904 = distinct !DILexicalBlock(scope: !777, file: !5, line: 130, column: 3)
!905 = !DILocation(line: 130, column: 8, scope: !904)
!906 = !DILocation(line: 130, column: 17, scope: !907)
!907 = distinct !DILexicalBlock(scope: !904, file: !5, line: 130, column: 3)
!908 = !DILocation(line: 130, column: 23, scope: !907)
!909 = !DILocation(line: 130, column: 21, scope: !907)
!910 = !DILocation(line: 130, column: 3, scope: !904)
!911 = !DILocalVariable(name: "deviceProp", scope: !912, file: !5, line: 131, type: !913)
!912 = distinct !DILexicalBlock(scope: !907, file: !5, line: 130, column: 43)
!913 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !8, line: 1257, size: 5056, flags: DIFlagTypePassByValue, elements: !914, identifier: "_ZTS14cudaDeviceProp")
!914 = !{!915, !919, !920, !921, !922, !923, !924, !925, !929, !930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !941, !942, !943, !944, !945, !949, !950, !951, !952, !953, !954, !955, !956, !957, !958, !959, !960, !961, !962, !963, !964, !965, !966, !967, !968, !969, !970, !971, !972, !973, !974, !975, !976, !977, !978, !979, !980, !981, !982, !983, !984, !985}
!915 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !913, file: !8, line: 1259, baseType: !916, size: 2048)
!916 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 2048, elements: !917)
!917 = !{!918}
!918 = !DISubrange(count: 256)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !913, file: !8, line: 1260, baseType: !310, size: 64, offset: 2048)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !913, file: !8, line: 1261, baseType: !310, size: 64, offset: 2112)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !913, file: !8, line: 1262, baseType: !32, size: 32, offset: 2176)
!922 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !913, file: !8, line: 1263, baseType: !32, size: 32, offset: 2208)
!923 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !913, file: !8, line: 1264, baseType: !310, size: 64, offset: 2240)
!924 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !913, file: !8, line: 1265, baseType: !32, size: 32, offset: 2304)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !913, file: !8, line: 1266, baseType: !926, size: 96, offset: 2336)
!926 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 96, elements: !927)
!927 = !{!928}
!928 = !DISubrange(count: 3)
!929 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !913, file: !8, line: 1267, baseType: !926, size: 96, offset: 2432)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !913, file: !8, line: 1268, baseType: !32, size: 32, offset: 2528)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !913, file: !8, line: 1269, baseType: !310, size: 64, offset: 2560)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !913, file: !8, line: 1270, baseType: !32, size: 32, offset: 2624)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !913, file: !8, line: 1271, baseType: !32, size: 32, offset: 2656)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !913, file: !8, line: 1272, baseType: !310, size: 64, offset: 2688)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !913, file: !8, line: 1273, baseType: !310, size: 64, offset: 2752)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !913, file: !8, line: 1274, baseType: !32, size: 32, offset: 2816)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !913, file: !8, line: 1275, baseType: !32, size: 32, offset: 2848)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !913, file: !8, line: 1276, baseType: !32, size: 32, offset: 2880)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !913, file: !8, line: 1277, baseType: !32, size: 32, offset: 2912)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !913, file: !8, line: 1278, baseType: !32, size: 32, offset: 2944)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !913, file: !8, line: 1279, baseType: !32, size: 32, offset: 2976)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !913, file: !8, line: 1280, baseType: !32, size: 32, offset: 3008)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !913, file: !8, line: 1281, baseType: !32, size: 32, offset: 3040)
!944 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !913, file: !8, line: 1282, baseType: !32, size: 32, offset: 3072)
!945 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !913, file: !8, line: 1283, baseType: !946, size: 64, offset: 3104)
!946 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 64, elements: !947)
!947 = !{!948}
!948 = !DISubrange(count: 2)
!949 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !913, file: !8, line: 1284, baseType: !946, size: 64, offset: 3168)
!950 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !913, file: !8, line: 1285, baseType: !926, size: 96, offset: 3232)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !913, file: !8, line: 1286, baseType: !946, size: 64, offset: 3328)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !913, file: !8, line: 1287, baseType: !926, size: 96, offset: 3392)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !913, file: !8, line: 1288, baseType: !926, size: 96, offset: 3488)
!954 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !913, file: !8, line: 1289, baseType: !32, size: 32, offset: 3584)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !913, file: !8, line: 1290, baseType: !946, size: 64, offset: 3616)
!956 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !913, file: !8, line: 1291, baseType: !926, size: 96, offset: 3680)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !913, file: !8, line: 1292, baseType: !946, size: 64, offset: 3776)
!958 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !913, file: !8, line: 1293, baseType: !32, size: 32, offset: 3840)
!959 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !913, file: !8, line: 1294, baseType: !946, size: 64, offset: 3872)
!960 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !913, file: !8, line: 1295, baseType: !926, size: 96, offset: 3936)
!961 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !913, file: !8, line: 1296, baseType: !946, size: 64, offset: 4032)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !913, file: !8, line: 1297, baseType: !926, size: 96, offset: 4096)
!963 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !913, file: !8, line: 1298, baseType: !32, size: 32, offset: 4192)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !913, file: !8, line: 1299, baseType: !946, size: 64, offset: 4224)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !913, file: !8, line: 1300, baseType: !310, size: 64, offset: 4288)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !913, file: !8, line: 1301, baseType: !32, size: 32, offset: 4352)
!967 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !913, file: !8, line: 1302, baseType: !32, size: 32, offset: 4384)
!968 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !913, file: !8, line: 1303, baseType: !32, size: 32, offset: 4416)
!969 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !913, file: !8, line: 1304, baseType: !32, size: 32, offset: 4448)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !913, file: !8, line: 1305, baseType: !32, size: 32, offset: 4480)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !913, file: !8, line: 1306, baseType: !32, size: 32, offset: 4512)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !913, file: !8, line: 1307, baseType: !32, size: 32, offset: 4544)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !913, file: !8, line: 1308, baseType: !32, size: 32, offset: 4576)
!974 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !913, file: !8, line: 1309, baseType: !32, size: 32, offset: 4608)
!975 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !913, file: !8, line: 1310, baseType: !32, size: 32, offset: 4640)
!976 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !913, file: !8, line: 1311, baseType: !32, size: 32, offset: 4672)
!977 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !913, file: !8, line: 1312, baseType: !32, size: 32, offset: 4704)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !913, file: !8, line: 1313, baseType: !32, size: 32, offset: 4736)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !913, file: !8, line: 1314, baseType: !32, size: 32, offset: 4768)
!980 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !913, file: !8, line: 1315, baseType: !32, size: 32, offset: 4800)
!981 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !913, file: !8, line: 1316, baseType: !310, size: 64, offset: 4864)
!982 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !913, file: !8, line: 1317, baseType: !32, size: 32, offset: 4928)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !913, file: !8, line: 1318, baseType: !32, size: 32, offset: 4960)
!984 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !913, file: !8, line: 1319, baseType: !32, size: 32, offset: 4992)
!985 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !913, file: !8, line: 1320, baseType: !32, size: 32, offset: 5024)
!986 = !DILocation(line: 131, column: 22, scope: !912)
!987 = !DILocation(line: 132, column: 44, scope: !912)
!988 = !DILocation(line: 132, column: 7, scope: !912)
!989 = !DILocation(line: 133, column: 22, scope: !990)
!990 = distinct !DILexicalBlock(scope: !912, file: !5, line: 133, column: 11)
!991 = !DILocation(line: 133, column: 28, scope: !990)
!992 = !DILocation(line: 133, column: 11, scope: !912)
!993 = !DILocation(line: 134, column: 11, scope: !990)
!994 = !DILocation(line: 135, column: 3, scope: !912)
!995 = !DILocation(line: 130, column: 36, scope: !907)
!996 = !DILocation(line: 130, column: 3, scope: !907)
!997 = distinct !{!997, !910, !998}
!998 = !DILocation(line: 135, column: 3, scope: !904)
!999 = !DILocation(line: 136, column: 7, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !777, file: !5, line: 136, column: 7)
!1001 = !DILocation(line: 136, column: 14, scope: !1000)
!1002 = !DILocation(line: 136, column: 11, scope: !1000)
!1003 = !DILocation(line: 136, column: 7, scope: !777)
!1004 = !DILocation(line: 137, column: 15, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !1000, file: !5, line: 136, column: 27)
!1006 = !DILocation(line: 137, column: 7, scope: !1005)
!1007 = !DILocation(line: 138, column: 7, scope: !1005)
!1008 = !DILocation(line: 141, column: 21, scope: !1000)
!1009 = !DILocation(line: 141, column: 7, scope: !1000)
!1010 = !DILocation(line: 146, column: 40, scope: !777)
!1011 = !DILocation(line: 146, column: 39, scope: !777)
!1012 = !DILocation(line: 146, column: 43, scope: !777)
!1013 = !DILocation(line: 146, column: 42, scope: !777)
!1014 = !DILocation(line: 146, column: 46, scope: !777)
!1015 = !DILocation(line: 146, column: 45, scope: !777)
!1016 = !DILocation(line: 146, column: 19, scope: !777)
!1017 = !DILocation(line: 146, column: 10, scope: !777)
!1018 = !DILocation(line: 146, column: 8, scope: !777)
!1019 = !DILocation(line: 147, column: 40, scope: !777)
!1020 = !DILocation(line: 147, column: 39, scope: !777)
!1021 = !DILocation(line: 147, column: 43, scope: !777)
!1022 = !DILocation(line: 147, column: 42, scope: !777)
!1023 = !DILocation(line: 147, column: 46, scope: !777)
!1024 = !DILocation(line: 147, column: 45, scope: !777)
!1025 = !DILocation(line: 147, column: 19, scope: !777)
!1026 = !DILocation(line: 147, column: 10, scope: !777)
!1027 = !DILocation(line: 147, column: 8, scope: !777)
!1028 = !DILocation(line: 148, column: 40, scope: !777)
!1029 = !DILocation(line: 148, column: 39, scope: !777)
!1030 = !DILocation(line: 148, column: 43, scope: !777)
!1031 = !DILocation(line: 148, column: 42, scope: !777)
!1032 = !DILocation(line: 148, column: 46, scope: !777)
!1033 = !DILocation(line: 148, column: 45, scope: !777)
!1034 = !DILocation(line: 148, column: 19, scope: !777)
!1035 = !DILocation(line: 148, column: 10, scope: !777)
!1036 = !DILocation(line: 148, column: 8, scope: !777)
!1037 = !DILocation(line: 149, column: 19, scope: !777)
!1038 = !DILocation(line: 149, column: 63, scope: !777)
!1039 = !DILocation(line: 149, column: 62, scope: !777)
!1040 = !DILocation(line: 149, column: 67, scope: !777)
!1041 = !DILocation(line: 149, column: 70, scope: !777)
!1042 = !DILocation(line: 149, column: 69, scope: !777)
!1043 = !DILocation(line: 149, column: 3, scope: !777)
!1044 = !DILocation(line: 150, column: 19, scope: !777)
!1045 = !DILocation(line: 150, column: 63, scope: !777)
!1046 = !DILocation(line: 150, column: 62, scope: !777)
!1047 = !DILocation(line: 150, column: 67, scope: !777)
!1048 = !DILocation(line: 150, column: 70, scope: !777)
!1049 = !DILocation(line: 150, column: 69, scope: !777)
!1050 = !DILocation(line: 150, column: 3, scope: !777)
!1051 = !DILocation(line: 153, column: 11, scope: !777)
!1052 = !DILocation(line: 153, column: 22, scope: !777)
!1053 = !DILocation(line: 153, column: 9, scope: !777)
!1054 = !DILocation(line: 157, column: 9, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !777, file: !5, line: 157, column: 3)
!1056 = !DILocation(line: 157, column: 8, scope: !1055)
!1057 = !DILocation(line: 157, column: 13, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1055, file: !5, line: 157, column: 3)
!1059 = !DILocation(line: 157, column: 15, scope: !1058)
!1060 = !DILocation(line: 157, column: 14, scope: !1058)
!1061 = !DILocation(line: 157, column: 3, scope: !1055)
!1062 = !DILocation(line: 158, column: 11, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1064, file: !5, line: 158, column: 5)
!1064 = distinct !DILexicalBlock(scope: !1058, file: !5, line: 157, column: 24)
!1065 = !DILocation(line: 158, column: 10, scope: !1063)
!1066 = !DILocation(line: 158, column: 15, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1063, file: !5, line: 158, column: 5)
!1068 = !DILocation(line: 158, column: 17, scope: !1067)
!1069 = !DILocation(line: 158, column: 16, scope: !1067)
!1070 = !DILocation(line: 158, column: 5, scope: !1063)
!1071 = !DILocation(line: 159, column: 13, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1073, file: !5, line: 159, column: 7)
!1073 = distinct !DILexicalBlock(scope: !1067, file: !5, line: 158, column: 26)
!1074 = !DILocation(line: 159, column: 12, scope: !1072)
!1075 = !DILocation(line: 159, column: 17, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1072, file: !5, line: 159, column: 7)
!1077 = !DILocation(line: 159, column: 19, scope: !1076)
!1078 = !DILocation(line: 159, column: 18, scope: !1076)
!1079 = !DILocation(line: 159, column: 7, scope: !1072)
!1080 = !DILocation(line: 160, column: 15, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1076, file: !5, line: 159, column: 28)
!1082 = !DILocation(line: 160, column: 19, scope: !1081)
!1083 = !DILocation(line: 160, column: 21, scope: !1081)
!1084 = !DILocation(line: 160, column: 20, scope: !1081)
!1085 = !DILocation(line: 160, column: 17, scope: !1081)
!1086 = !DILocation(line: 160, column: 26, scope: !1081)
!1087 = !DILocation(line: 160, column: 28, scope: !1081)
!1088 = !DILocation(line: 160, column: 27, scope: !1081)
!1089 = !DILocation(line: 160, column: 31, scope: !1081)
!1090 = !DILocation(line: 160, column: 30, scope: !1081)
!1091 = !DILocation(line: 160, column: 24, scope: !1081)
!1092 = !DILocation(line: 160, column: 13, scope: !1081)
!1093 = !DILocation(line: 162, column: 13, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1081, file: !5, line: 162, column: 13)
!1095 = !DILocation(line: 162, column: 14, scope: !1094)
!1096 = !DILocation(line: 162, column: 18, scope: !1094)
!1097 = !DILocation(line: 162, column: 21, scope: !1094)
!1098 = !DILocation(line: 162, column: 24, scope: !1094)
!1099 = !DILocation(line: 162, column: 26, scope: !1094)
!1100 = !DILocation(line: 162, column: 22, scope: !1094)
!1101 = !DILocation(line: 162, column: 29, scope: !1094)
!1102 = !DILocation(line: 162, column: 32, scope: !1094)
!1103 = !DILocation(line: 162, column: 33, scope: !1094)
!1104 = !DILocation(line: 162, column: 37, scope: !1094)
!1105 = !DILocation(line: 162, column: 40, scope: !1094)
!1106 = !DILocation(line: 162, column: 43, scope: !1094)
!1107 = !DILocation(line: 162, column: 45, scope: !1094)
!1108 = !DILocation(line: 162, column: 41, scope: !1094)
!1109 = !DILocation(line: 162, column: 47, scope: !1094)
!1110 = !DILocation(line: 162, column: 50, scope: !1094)
!1111 = !DILocation(line: 162, column: 51, scope: !1094)
!1112 = !DILocation(line: 162, column: 55, scope: !1094)
!1113 = !DILocation(line: 162, column: 58, scope: !1094)
!1114 = !DILocation(line: 162, column: 61, scope: !1094)
!1115 = !DILocation(line: 162, column: 63, scope: !1094)
!1116 = !DILocation(line: 162, column: 59, scope: !1094)
!1117 = !DILocation(line: 162, column: 13, scope: !1081)
!1118 = !DILocation(line: 163, column: 11, scope: !1094)
!1119 = !DILocation(line: 163, column: 16, scope: !1094)
!1120 = !DILocation(line: 163, column: 21, scope: !1094)
!1121 = !DILocation(line: 165, column: 11, scope: !1094)
!1122 = !DILocation(line: 165, column: 16, scope: !1094)
!1123 = !DILocation(line: 165, column: 21, scope: !1094)
!1124 = !DILocation(line: 166, column: 7, scope: !1081)
!1125 = !DILocation(line: 159, column: 24, scope: !1076)
!1126 = !DILocation(line: 159, column: 7, scope: !1076)
!1127 = distinct !{!1127, !1079, !1128}
!1128 = !DILocation(line: 166, column: 7, scope: !1072)
!1129 = !DILocation(line: 167, column: 5, scope: !1073)
!1130 = !DILocation(line: 158, column: 22, scope: !1067)
!1131 = !DILocation(line: 158, column: 5, scope: !1067)
!1132 = distinct !{!1132, !1070, !1133}
!1133 = !DILocation(line: 167, column: 5, scope: !1063)
!1134 = !DILocation(line: 168, column: 3, scope: !1064)
!1135 = !DILocation(line: 157, column: 20, scope: !1058)
!1136 = !DILocation(line: 157, column: 3, scope: !1058)
!1137 = distinct !{!1137, !1061, !1138}
!1138 = !DILocation(line: 168, column: 3, scope: !1055)
!1139 = !DILocation(line: 173, column: 16, scope: !777)
!1140 = !DILocation(line: 173, column: 22, scope: !777)
!1141 = !DILocation(line: 174, column: 32, scope: !777)
!1142 = !DILocation(line: 174, column: 52, scope: !777)
!1143 = !DILocation(line: 174, column: 51, scope: !777)
!1144 = !DILocation(line: 175, column: 46, scope: !777)
!1145 = !DILocation(line: 175, column: 45, scope: !777)
!1146 = !DILocation(line: 175, column: 50, scope: !777)
!1147 = !DILocation(line: 175, column: 53, scope: !777)
!1148 = !DILocation(line: 175, column: 52, scope: !777)
!1149 = !DILocation(line: 173, column: 3, scope: !777)
!1150 = !DILocation(line: 177, column: 3, scope: !777)
!1151 = !DILocation(line: 184, column: 13, scope: !777)
!1152 = !DILocation(line: 184, column: 15, scope: !777)
!1153 = !DILocation(line: 184, column: 18, scope: !777)
!1154 = !DILocation(line: 184, column: 10, scope: !777)
!1155 = !DILocation(line: 184, column: 6, scope: !777)
!1156 = !DILocation(line: 185, column: 13, scope: !777)
!1157 = !DILocation(line: 185, column: 15, scope: !777)
!1158 = !DILocation(line: 185, column: 18, scope: !777)
!1159 = !DILocation(line: 185, column: 10, scope: !777)
!1160 = !DILocation(line: 185, column: 6, scope: !777)
!1161 = !DILocalVariable(name: "dimGrid", scope: !777, file: !5, line: 187, type: !1162)
!1162 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1163, line: 427, baseType: !1164)
!1163 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!1164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1163, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1165, identifier: "_ZTS4dim3")
!1165 = !{!1166, !1167, !1168, !1169, !1173, !1182}
!1166 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1164, file: !1163, line: 419, baseType: !9, size: 32)
!1167 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1164, file: !1163, line: 419, baseType: !9, size: 32, offset: 32)
!1168 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1164, file: !1163, line: 419, baseType: !9, size: 32, offset: 64)
!1169 = !DISubprogram(name: "dim3", scope: !1164, file: !1163, line: 421, type: !1170, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{null, !1172, !9, !9, !9}
!1172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1164, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1173 = !DISubprogram(name: "dim3", scope: !1164, file: !1163, line: 422, type: !1174, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{null, !1172, !1176}
!1176 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1163, line: 383, baseType: !1177)
!1177 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1163, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1178, identifier: "_ZTS5uint3")
!1178 = !{!1179, !1180, !1181}
!1179 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1177, file: !1163, line: 192, baseType: !9, size: 32)
!1180 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1177, file: !1163, line: 192, baseType: !9, size: 32, offset: 32)
!1181 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1177, file: !1163, line: 192, baseType: !9, size: 32, offset: 64)
!1182 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1164, file: !1163, line: 423, type: !1183, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{!1176, !1172}
!1185 = !DILocation(line: 187, column: 8, scope: !777)
!1186 = !DILocation(line: 187, column: 16, scope: !777)
!1187 = !DILocation(line: 187, column: 19, scope: !777)
!1188 = !DILocalVariable(name: "dimBlock", scope: !777, file: !5, line: 188, type: !1162)
!1189 = !DILocation(line: 188, column: 8, scope: !777)
!1190 = !DILocation(line: 190, column: 46, scope: !777)
!1191 = !DILocation(line: 190, column: 56, scope: !777)
!1192 = !DILocation(line: 190, column: 66, scope: !777)
!1193 = !DILocation(line: 190, column: 3, scope: !777)
!1194 = !DILocation(line: 191, column: 45, scope: !777)
!1195 = !DILocation(line: 191, column: 56, scope: !777)
!1196 = !DILocation(line: 191, column: 67, scope: !777)
!1197 = !DILocation(line: 191, column: 3, scope: !777)
!1198 = !DILocation(line: 195, column: 3, scope: !777)
!1199 = !DILocation(line: 199, column: 10, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !777, file: !5, line: 199, column: 3)
!1201 = !DILocation(line: 199, column: 8, scope: !1200)
!1202 = !DILocation(line: 199, column: 15, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1200, file: !5, line: 199, column: 3)
!1204 = !DILocation(line: 199, column: 20, scope: !1203)
!1205 = !DILocation(line: 199, column: 17, scope: !1203)
!1206 = !DILocation(line: 199, column: 3, scope: !1200)
!1207 = !DILocation(line: 200, column: 21, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1203, file: !5, line: 199, column: 33)
!1209 = !DILocation(line: 200, column: 30, scope: !1208)
!1210 = !DILocation(line: 200, column: 18, scope: !1208)
!1211 = !DILocation(line: 200, column: 5, scope: !1208)
!1212 = !DILocation(line: 200, column: 42, scope: !1208)
!1213 = !DILocation(line: 200, column: 46, scope: !1208)
!1214 = !DILocation(line: 200, column: 50, scope: !1208)
!1215 = !DILocation(line: 200, column: 54, scope: !1208)
!1216 = !DILocation(line: 200, column: 61, scope: !1208)
!1217 = !DILocation(line: 200, column: 67, scope: !1208)
!1218 = !DILocation(line: 201, column: 13, scope: !1208)
!1219 = !DILocation(line: 201, column: 11, scope: !1208)
!1220 = !DILocation(line: 201, column: 26, scope: !1208)
!1221 = !DILocation(line: 201, column: 24, scope: !1208)
!1222 = !DILocation(line: 201, column: 39, scope: !1208)
!1223 = !DILocation(line: 201, column: 37, scope: !1208)
!1224 = !DILocation(line: 203, column: 5, scope: !1208)
!1225 = !DILocation(line: 205, column: 3, scope: !1208)
!1226 = !DILocation(line: 199, column: 28, scope: !1203)
!1227 = !DILocation(line: 199, column: 3, scope: !1203)
!1228 = distinct !{!1228, !1206, !1229}
!1229 = !DILocation(line: 205, column: 3, scope: !1200)
!1230 = !DILocation(line: 215, column: 16, scope: !777)
!1231 = !DILocation(line: 215, column: 36, scope: !777)
!1232 = !DILocation(line: 215, column: 35, scope: !777)
!1233 = !DILocation(line: 216, column: 32, scope: !777)
!1234 = !DILocation(line: 216, column: 38, scope: !777)
!1235 = !DILocation(line: 217, column: 46, scope: !777)
!1236 = !DILocation(line: 217, column: 45, scope: !777)
!1237 = !DILocation(line: 217, column: 50, scope: !777)
!1238 = !DILocation(line: 217, column: 53, scope: !777)
!1239 = !DILocation(line: 217, column: 52, scope: !777)
!1240 = !DILocation(line: 215, column: 3, scope: !777)
!1241 = !DILocalVariable(name: "i", scope: !1242, file: !5, line: 244, type: !32)
!1242 = distinct !DILexicalBlock(scope: !777, file: !5, line: 244, column: 3)
!1243 = !DILocation(line: 244, column: 12, scope: !1242)
!1244 = !DILocation(line: 244, column: 8, scope: !1242)
!1245 = !DILocation(line: 244, column: 19, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1242, file: !5, line: 244, column: 3)
!1247 = !DILocation(line: 244, column: 24, scope: !1246)
!1248 = !DILocation(line: 244, column: 21, scope: !1246)
!1249 = !DILocation(line: 244, column: 3, scope: !1242)
!1250 = !DILocation(line: 245, column: 20, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1246, file: !5, line: 244, column: 37)
!1252 = !DILocation(line: 245, column: 24, scope: !1251)
!1253 = !DILocation(line: 245, column: 28, scope: !1251)
!1254 = !DILocation(line: 245, column: 32, scope: !1251)
!1255 = !DILocation(line: 245, column: 38, scope: !1251)
!1256 = !DILocation(line: 245, column: 5, scope: !1251)
!1257 = !DILocation(line: 246, column: 13, scope: !1251)
!1258 = !DILocation(line: 246, column: 11, scope: !1251)
!1259 = !DILocation(line: 246, column: 26, scope: !1251)
!1260 = !DILocation(line: 246, column: 24, scope: !1251)
!1261 = !DILocation(line: 246, column: 39, scope: !1251)
!1262 = !DILocation(line: 246, column: 37, scope: !1251)
!1263 = !DILocation(line: 247, column: 3, scope: !1251)
!1264 = !DILocation(line: 244, column: 32, scope: !1246)
!1265 = !DILocation(line: 244, column: 3, scope: !1246)
!1266 = distinct !{!1266, !1249, !1267}
!1267 = !DILocation(line: 247, column: 3, scope: !1242)
!1268 = !DILocation(line: 269, column: 7, scope: !777)
!1269 = !DILocation(line: 271, column: 9, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !777, file: !5, line: 271, column: 3)
!1271 = !DILocation(line: 271, column: 8, scope: !1270)
!1272 = !DILocation(line: 271, column: 13, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1270, file: !5, line: 271, column: 3)
!1274 = !DILocation(line: 271, column: 15, scope: !1273)
!1275 = !DILocation(line: 271, column: 14, scope: !1273)
!1276 = !DILocation(line: 271, column: 3, scope: !1270)
!1277 = !DILocation(line: 272, column: 11, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1279, file: !5, line: 272, column: 5)
!1279 = distinct !DILexicalBlock(scope: !1273, file: !5, line: 271, column: 24)
!1280 = !DILocation(line: 272, column: 10, scope: !1278)
!1281 = !DILocation(line: 272, column: 15, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1278, file: !5, line: 272, column: 5)
!1283 = !DILocation(line: 272, column: 17, scope: !1282)
!1284 = !DILocation(line: 272, column: 16, scope: !1282)
!1285 = !DILocation(line: 272, column: 5, scope: !1278)
!1286 = !DILocation(line: 273, column: 13, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1288, file: !5, line: 273, column: 7)
!1288 = distinct !DILexicalBlock(scope: !1282, file: !5, line: 272, column: 26)
!1289 = !DILocation(line: 273, column: 12, scope: !1287)
!1290 = !DILocation(line: 273, column: 17, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1287, file: !5, line: 273, column: 7)
!1292 = !DILocation(line: 273, column: 19, scope: !1291)
!1293 = !DILocation(line: 273, column: 18, scope: !1291)
!1294 = !DILocation(line: 273, column: 7, scope: !1287)
!1295 = !DILocation(line: 274, column: 15, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1291, file: !5, line: 273, column: 28)
!1297 = !DILocation(line: 274, column: 19, scope: !1296)
!1298 = !DILocation(line: 274, column: 21, scope: !1296)
!1299 = !DILocation(line: 274, column: 20, scope: !1296)
!1300 = !DILocation(line: 274, column: 17, scope: !1296)
!1301 = !DILocation(line: 274, column: 26, scope: !1296)
!1302 = !DILocation(line: 274, column: 28, scope: !1296)
!1303 = !DILocation(line: 274, column: 27, scope: !1296)
!1304 = !DILocation(line: 274, column: 31, scope: !1296)
!1305 = !DILocation(line: 274, column: 30, scope: !1296)
!1306 = !DILocation(line: 274, column: 24, scope: !1296)
!1307 = !DILocation(line: 274, column: 13, scope: !1296)
!1308 = !DILocation(line: 275, column: 17, scope: !1296)
!1309 = !DILocation(line: 275, column: 22, scope: !1296)
!1310 = !DILocation(line: 275, column: 27, scope: !1296)
!1311 = !DILocation(line: 275, column: 32, scope: !1296)
!1312 = !DILocation(line: 275, column: 26, scope: !1296)
!1313 = !DILocation(line: 275, column: 39, scope: !1296)
!1314 = !DILocation(line: 275, column: 44, scope: !1296)
!1315 = !DILocation(line: 275, column: 49, scope: !1296)
!1316 = !DILocation(line: 275, column: 54, scope: !1296)
!1317 = !DILocation(line: 275, column: 48, scope: !1296)
!1318 = !DILocation(line: 275, column: 37, scope: !1296)
!1319 = !DILocation(line: 275, column: 13, scope: !1296)
!1320 = !DILocation(line: 276, column: 7, scope: !1296)
!1321 = !DILocation(line: 273, column: 24, scope: !1291)
!1322 = !DILocation(line: 273, column: 7, scope: !1291)
!1323 = distinct !{!1323, !1294, !1324}
!1324 = !DILocation(line: 276, column: 7, scope: !1287)
!1325 = !DILocation(line: 277, column: 5, scope: !1288)
!1326 = !DILocation(line: 272, column: 22, scope: !1282)
!1327 = !DILocation(line: 272, column: 5, scope: !1282)
!1328 = distinct !{!1328, !1285, !1329}
!1329 = !DILocation(line: 277, column: 5, scope: !1278)
!1330 = !DILocation(line: 278, column: 3, scope: !1279)
!1331 = !DILocation(line: 271, column: 20, scope: !1273)
!1332 = !DILocation(line: 271, column: 3, scope: !1273)
!1333 = distinct !{!1333, !1276, !1334}
!1334 = !DILocation(line: 278, column: 3, scope: !1270)
!1335 = !DILocation(line: 280, column: 38, scope: !777)
!1336 = !DILocation(line: 280, column: 51, scope: !777)
!1337 = !DILocation(line: 280, column: 54, scope: !777)
!1338 = !DILocation(line: 280, column: 53, scope: !777)
!1339 = !DILocation(line: 280, column: 57, scope: !777)
!1340 = !DILocation(line: 280, column: 56, scope: !777)
!1341 = !DILocation(line: 280, column: 50, scope: !777)
!1342 = !DILocation(line: 280, column: 41, scope: !777)
!1343 = !DILocation(line: 280, column: 33, scope: !777)
!1344 = !DILocation(line: 280, column: 3, scope: !777)
!1345 = !DILocation(line: 283, column: 3, scope: !777)
!1346 = !DILocation(line: 283, column: 57, scope: !777)
!1347 = !DILocation(line: 283, column: 50, scope: !777)
!1348 = !DILocation(line: 284, column: 12, scope: !777)
!1349 = !DILocation(line: 284, column: 3, scope: !777)
!1350 = !DILocation(line: 285, column: 3, scope: !777)
!1351 = !DILocation(line: 285, column: 57, scope: !777)
!1352 = !DILocation(line: 285, column: 50, scope: !777)
!1353 = !DILocation(line: 286, column: 12, scope: !777)
!1354 = !DILocation(line: 286, column: 3, scope: !777)
!1355 = !DILocation(line: 287, column: 3, scope: !777)
!1356 = !DILocation(line: 287, column: 35, scope: !777)
!1357 = !DILocation(line: 287, column: 28, scope: !777)
!1358 = !DILocation(line: 288, column: 8, scope: !777)
!1359 = !DILocation(line: 288, column: 3, scope: !777)
!1360 = !DILocation(line: 289, column: 3, scope: !777)
!1361 = !DILocation(line: 289, column: 35, scope: !777)
!1362 = !DILocation(line: 289, column: 28, scope: !777)
!1363 = !DILocation(line: 290, column: 8, scope: !777)
!1364 = !DILocation(line: 290, column: 3, scope: !777)
!1365 = !DILocation(line: 291, column: 3, scope: !777)
!1366 = !DILocation(line: 291, column: 35, scope: !777)
!1367 = !DILocation(line: 291, column: 28, scope: !777)
!1368 = !DILocation(line: 292, column: 8, scope: !777)
!1369 = !DILocation(line: 292, column: 3, scope: !777)
!1370 = !DILocation(line: 296, column: 1, scope: !777)
!1371 = distinct !DISubprogram(name: "printHelp", linkageName: "_Z9printHelpv", scope: !5, file: !5, line: 302, type: !287, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !615)
!1372 = !DILocation(line: 304, column: 3, scope: !1371)
!1373 = !DILocation(line: 305, column: 3, scope: !1371)
!1374 = !DILocation(line: 306, column: 3, scope: !1371)
!1375 = !DILocation(line: 307, column: 3, scope: !1371)
!1376 = !DILocation(line: 308, column: 3, scope: !1371)
!1377 = !DILocation(line: 310, column: 3, scope: !1371)
!1378 = !DILocation(line: 311, column: 3, scope: !1371)
!1379 = !DILocation(line: 312, column: 3, scope: !1371)
!1380 = !DILocation(line: 313, column: 3, scope: !1371)
!1381 = !DILocation(line: 314, column: 3, scope: !1371)
!1382 = !DILocation(line: 315, column: 3, scope: !1371)
!1383 = !DILocation(line: 316, column: 3, scope: !1371)
!1384 = !DILocation(line: 317, column: 1, scope: !1371)
!1385 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1164, file: !1163, line: 421, type: !1170, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !1169, retainedNodes: !615)
!1386 = !DILocalVariable(name: "this", arg: 1, scope: !1385, type: !1387, flags: DIFlagArtificial | DIFlagObjectPointer)
!1387 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1164, size: 64)
!1388 = !DILocation(line: 0, scope: !1385)
!1389 = !DILocalVariable(name: "vx", arg: 2, scope: !1385, file: !1163, line: 421, type: !9)
!1390 = !DILocation(line: 421, column: 43, scope: !1385)
!1391 = !DILocalVariable(name: "vy", arg: 3, scope: !1385, file: !1163, line: 421, type: !9)
!1392 = !DILocation(line: 421, column: 64, scope: !1385)
!1393 = !DILocalVariable(name: "vz", arg: 4, scope: !1385, file: !1163, line: 421, type: !9)
!1394 = !DILocation(line: 421, column: 85, scope: !1385)
!1395 = !DILocation(line: 421, column: 95, scope: !1385)
!1396 = !DILocation(line: 421, column: 97, scope: !1385)
!1397 = !DILocation(line: 421, column: 102, scope: !1385)
!1398 = !DILocation(line: 421, column: 104, scope: !1385)
!1399 = !DILocation(line: 421, column: 109, scope: !1385)
!1400 = !DILocation(line: 421, column: 111, scope: !1385)
!1401 = !DILocation(line: 421, column: 116, scope: !1385)
!1402 = distinct !DISubprogram(name: "sqrt", linkageName: "_ZSt4sqrtf", scope: !27, file: !223, line: 463, type: !35, scopeLine: 464, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !615)
!1403 = !DILocalVariable(name: "__x", arg: 1, scope: !1402, file: !223, line: 463, type: !22)
!1404 = !DILocation(line: 463, column: 14, scope: !1402)
!1405 = !DILocation(line: 464, column: 28, scope: !1402)
!1406 = !DILocation(line: 464, column: 12, scope: !1402)
!1407 = !DILocation(line: 464, column: 5, scope: !1402)
