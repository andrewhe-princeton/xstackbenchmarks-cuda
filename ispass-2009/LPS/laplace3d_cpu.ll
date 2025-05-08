; ModuleID = 'laplace3d_cpu.bc'
source_filename = "llvm-link-cudafe"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZSt4sqrtf = comdat any

@_ZZ13GPU_laplace3diiiiPfS_E2u1 = internal addrspace(3) global [612 x float] undef, align 4, !dbg !0
@.str.2 = private unnamed_addr constant [47 x i8] c"Illegal argument - nx must be greater than 99\0A\00", align 1
@.str.4 = private unnamed_addr constant [47 x i8] c"Illegal argument - ny must be greater than 99\0A\00", align 1
@.str.6 = private unnamed_addr constant [47 x i8] c"Illegal argument - nz must be greater than 99\0A\00", align 1
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

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.mul24.i(i32, i32) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z14Gold_laplace3diiiPfS_(i32 %NX, i32 %NY, i32 %NZ, float* %u1, float* %u2) #2 !dbg !676 {
entry:
  call void @llvm.dbg.value(metadata i32 %NX, metadata !679, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.value(metadata i32 %NY, metadata !681, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.value(metadata i32 %NZ, metadata !682, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.value(metadata float* %u1, metadata !683, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.value(metadata float* %u2, metadata !684, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.value(metadata float 0x3FC5555560000000, metadata !685, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.value(metadata i32 0, metadata !686, metadata !DIExpression()), !dbg !680
  %0 = sext i32 %NX to i64, !dbg !687
  %1 = sext i32 %NX to i64, !dbg !687
  %2 = sext i32 %NX to i64, !dbg !687
  %3 = sext i32 %NY to i64, !dbg !687
  %4 = sext i32 %NX to i64, !dbg !687
  %5 = sext i32 %NZ to i64, !dbg !687
  %6 = sext i32 %NX to i64, !dbg !687
  %7 = sext i32 %NY to i64, !dbg !687
  br label %for.cond, !dbg !687

for.cond:                                         ; preds = %for.inc55, %entry
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc55 ], [ 0, %entry ], !dbg !689
  call void @llvm.dbg.value(metadata i64 %indvars.iv12, metadata !686, metadata !DIExpression()), !dbg !680
  %cmp = icmp slt i64 %indvars.iv12, %5, !dbg !690
  br i1 %cmp, label %for.body, label %for.end57, !dbg !692

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !693, metadata !DIExpression()), !dbg !680
  br label %for.cond1, !dbg !694

for.cond1:                                        ; preds = %for.inc52, %for.body
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc52 ], [ 0, %for.body ], !dbg !697
  call void @llvm.dbg.value(metadata i64 %indvars.iv9, metadata !693, metadata !DIExpression()), !dbg !680
  %cmp2 = icmp slt i64 %indvars.iv9, %3, !dbg !698
  br i1 %cmp2, label %for.body3, label %for.end54, !dbg !700

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.value(metadata i32 0, metadata !701, metadata !DIExpression()), !dbg !680
  br label %for.cond4, !dbg !702

for.cond4:                                        ; preds = %for.inc, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body3 ], !dbg !705
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !701, metadata !DIExpression()), !dbg !680
  %cmp5 = icmp slt i64 %indvars.iv, %0, !dbg !706
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !708

for.body6:                                        ; preds = %for.cond4
  %8 = mul nsw i64 %indvars.iv9, %4, !dbg !709
  %9 = add nsw i64 %indvars.iv, %8, !dbg !711
  %10 = mul nsw i64 %indvars.iv12, %6, !dbg !712
  %11 = mul nsw i64 %10, %7, !dbg !713
  %12 = add nsw i64 %9, %11, !dbg !714
  %cmp10 = icmp eq i64 %indvars.iv, 0, !dbg !715
  br i1 %cmp10, label %if.then, label %lor.lhs.false, !dbg !717

lor.lhs.false:                                    ; preds = %for.body6
  %sub = sub nsw i32 %NX, 1, !dbg !718
  %13 = zext i32 %sub to i64, !dbg !719
  %cmp11 = icmp eq i64 %indvars.iv, %13, !dbg !719
  br i1 %cmp11, label %if.then, label %lor.lhs.false12, !dbg !720

lor.lhs.false12:                                  ; preds = %lor.lhs.false
  %cmp13 = icmp eq i64 %indvars.iv9, 0, !dbg !721
  br i1 %cmp13, label %if.then, label %lor.lhs.false14, !dbg !722

lor.lhs.false14:                                  ; preds = %lor.lhs.false12
  %sub15 = sub nsw i32 %NY, 1, !dbg !723
  %14 = zext i32 %sub15 to i64, !dbg !724
  %cmp16 = icmp eq i64 %indvars.iv9, %14, !dbg !724
  br i1 %cmp16, label %if.then, label %lor.lhs.false17, !dbg !725

lor.lhs.false17:                                  ; preds = %lor.lhs.false14
  %cmp18 = icmp eq i64 %indvars.iv12, 0, !dbg !726
  br i1 %cmp18, label %if.then, label %lor.lhs.false19, !dbg !727

lor.lhs.false19:                                  ; preds = %lor.lhs.false17
  %sub20 = sub nsw i32 %NZ, 1, !dbg !728
  %15 = zext i32 %sub20 to i64, !dbg !729
  %cmp21 = icmp eq i64 %indvars.iv12, %15, !dbg !729
  br i1 %cmp21, label %if.then, label %if.else, !dbg !730

if.then:                                          ; preds = %lor.lhs.false19, %lor.lhs.false17, %lor.lhs.false14, %lor.lhs.false12, %lor.lhs.false, %for.body6
  %arrayidx = getelementptr inbounds float, float* %u1, i64 %12, !dbg !731
  %16 = load float, float* %arrayidx, align 4, !dbg !731
  %arrayidx23 = getelementptr inbounds float, float* %u2, i64 %12, !dbg !733
  store float %16, float* %arrayidx23, align 4, !dbg !734
  br label %if.end, !dbg !735

if.else:                                          ; preds = %lor.lhs.false19
  %17 = sub nsw i64 %12, 1, !dbg !736
  %arrayidx26 = getelementptr inbounds float, float* %u1, i64 %17, !dbg !738
  %18 = load float, float* %arrayidx26, align 4, !dbg !738
  %19 = add nsw i64 %12, 1, !dbg !739
  %arrayidx29 = getelementptr inbounds float, float* %u1, i64 %19, !dbg !740
  %20 = load float, float* %arrayidx29, align 4, !dbg !740
  %add30 = fadd contract float %18, %20, !dbg !741
  %21 = sub nsw i64 %12, %2, !dbg !742
  %arrayidx33 = getelementptr inbounds float, float* %u1, i64 %21, !dbg !743
  %22 = load float, float* %arrayidx33, align 4, !dbg !743
  %add34 = fadd contract float %add30, %22, !dbg !744
  %23 = add nsw i64 %12, %1, !dbg !745
  %arrayidx37 = getelementptr inbounds float, float* %u1, i64 %23, !dbg !746
  %24 = load float, float* %arrayidx37, align 4, !dbg !746
  %add38 = fadd contract float %add34, %24, !dbg !747
  %mul39 = mul nsw i32 %NX, %NY, !dbg !748
  %25 = sext i32 %mul39 to i64, !dbg !749
  %26 = sub nsw i64 %12, %25, !dbg !749
  %arrayidx42 = getelementptr inbounds float, float* %u1, i64 %26, !dbg !750
  %27 = load float, float* %arrayidx42, align 4, !dbg !750
  %add43 = fadd contract float %add38, %27, !dbg !751
  %mul44 = mul nsw i32 %NX, %NY, !dbg !752
  %28 = sext i32 %mul44 to i64, !dbg !753
  %29 = add nsw i64 %12, %28, !dbg !753
  %arrayidx47 = getelementptr inbounds float, float* %u1, i64 %29, !dbg !754
  %30 = load float, float* %arrayidx47, align 4, !dbg !754
  %add48 = fadd contract float %add43, %30, !dbg !755
  %mul49 = fmul contract float %add48, 0x3FC5555560000000, !dbg !756
  %arrayidx51 = getelementptr inbounds float, float* %u2, i64 %12, !dbg !757
  store float %mul49, float* %arrayidx51, align 4, !dbg !758
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !759

for.inc:                                          ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !760
  call void @llvm.dbg.value(metadata i32 undef, metadata !701, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !680
  br label %for.cond4, !dbg !761, !llvm.loop !762

for.end:                                          ; preds = %for.cond4
  br label %for.inc52, !dbg !764

for.inc52:                                        ; preds = %for.end
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !765
  call void @llvm.dbg.value(metadata i32 undef, metadata !693, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !680
  br label %for.cond1, !dbg !766, !llvm.loop !767

for.end54:                                        ; preds = %for.cond1
  br label %for.inc55, !dbg !769

for.inc55:                                        ; preds = %for.end54
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !770
  call void @llvm.dbg.value(metadata i32 undef, metadata !686, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !680
  br label %for.cond, !dbg !771, !llvm.loop !772

for.end57:                                        ; preds = %for.cond
  ret void, !dbg !774
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #3 !dbg !775 {
entry:
  %NX = alloca i32, align 4
  %NY = alloca i32, align 4
  %NZ = alloca i32, align 4
  %REPEAT = alloca i32, align 4
  %d_u1 = alloca float*, align 8
  %d_u2 = alloca float*, align 8
  %deviceCount = alloca i32, align 4
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %dimGrid = alloca %struct.dim3, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp142 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp142.coerce = alloca { i64, i32 }, align 4
  call void @llvm.dbg.value(metadata i32 %argc, metadata !778, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata i8** %argv, metadata !780, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.declare(metadata i32* %NX, metadata !781, metadata !DIExpression()), !dbg !782
  call void @llvm.dbg.declare(metadata i32* %NY, metadata !783, metadata !DIExpression()), !dbg !784
  call void @llvm.dbg.declare(metadata i32* %NZ, metadata !785, metadata !DIExpression()), !dbg !786
  call void @llvm.dbg.declare(metadata i32* %REPEAT, metadata !787, metadata !DIExpression()), !dbg !788
  call void @llvm.dbg.declare(metadata float** %d_u1, metadata !789, metadata !DIExpression()), !dbg !790
  call void @llvm.dbg.declare(metadata float** %d_u2, metadata !791, metadata !DIExpression()), !dbg !792
  br i1 true, label %if.then, label %if.end, !dbg !793

if.then:                                          ; preds = %entry
  call void @_Z9printHelpv(), !dbg !794
  br label %return, !dbg !797

if.end:                                           ; preds = %entry
  %tobool = icmp ne i32* %NX, null, !dbg !798
  br i1 %tobool, label %if.then1, label %if.else, !dbg !800

if.then1:                                         ; preds = %if.end
  %0 = load i32, i32* %NX, align 4, !dbg !801
  %cmp = icmp sle i32 %0, 99, !dbg !804
  br i1 %cmp, label %if.then2, label %if.end3, !dbg !805

if.then2:                                         ; preds = %if.then1
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.2, i64 0, i64 0)), !dbg !806
  br label %return, !dbg !808

if.end3:                                          ; preds = %if.then1
  br label %if.end4, !dbg !809

if.else:                                          ; preds = %if.end
  store i32 100, i32* %NX, align 4, !dbg !810
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.end3
  %tobool5 = icmp ne i32* %NY, null, !dbg !811
  br i1 %tobool5, label %if.then6, label %if.else11, !dbg !813

if.then6:                                         ; preds = %if.end4
  %1 = load i32, i32* %NY, align 4, !dbg !814
  %cmp7 = icmp sle i32 %1, 99, !dbg !817
  br i1 %cmp7, label %if.then8, label %if.end10, !dbg !818

if.then8:                                         ; preds = %if.then6
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.4, i64 0, i64 0)), !dbg !819
  br label %return, !dbg !821

if.end10:                                         ; preds = %if.then6
  br label %if.end12, !dbg !822

if.else11:                                        ; preds = %if.end4
  store i32 100, i32* %NY, align 4, !dbg !823
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.end10
  %tobool13 = icmp ne i32* %NZ, null, !dbg !824
  br i1 %tobool13, label %if.then14, label %if.else19, !dbg !826

if.then14:                                        ; preds = %if.end12
  %2 = load i32, i32* %NZ, align 4, !dbg !827
  %cmp15 = icmp sle i32 %2, 99, !dbg !830
  br i1 %cmp15, label %if.then16, label %if.end18, !dbg !831

if.then16:                                        ; preds = %if.then14
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.6, i64 0, i64 0)), !dbg !832
  br label %return, !dbg !834

if.end18:                                         ; preds = %if.then14
  br label %if.end20, !dbg !835

if.else19:                                        ; preds = %if.end12
  store i32 100, i32* %NZ, align 4, !dbg !836
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.end18
  %tobool21 = icmp ne i32* %REPEAT, null, !dbg !837
  br i1 %tobool21, label %if.then22, label %if.else27, !dbg !839

if.then22:                                        ; preds = %if.end20
  %3 = load i32, i32* %REPEAT, align 4, !dbg !840
  %cmp23 = icmp sle i32 %3, 0, !dbg !843
  br i1 %cmp23, label %if.then24, label %if.end26, !dbg !844

if.then24:                                        ; preds = %if.then22
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.8, i64 0, i64 0)), !dbg !845
  br label %return, !dbg !847

if.end26:                                         ; preds = %if.then22
  br label %if.end28, !dbg !848

if.else27:                                        ; preds = %if.end20
  store i32 1, i32* %REPEAT, align 4, !dbg !849
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %if.end26
  %4 = load i32, i32* %NX, align 4, !dbg !850
  %5 = load i32, i32* %NY, align 4, !dbg !851
  %6 = load i32, i32* %NZ, align 4, !dbg !852
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i64 0, i64 0), i32 %4, i32 %5, i32 %6), !dbg !853
  call void @llvm.dbg.declare(metadata i32* %deviceCount, metadata !854, metadata !DIExpression()), !dbg !855
  %call30 = call i32 @cudaGetDeviceCount(i32* %deviceCount), !dbg !856
  %7 = load i32, i32* %deviceCount, align 4, !dbg !857
  %cmp31 = icmp eq i32 %7, 0, !dbg !859
  br i1 %cmp31, label %if.then32, label %if.end34, !dbg !860

if.then32:                                        ; preds = %if.end28
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !861
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0)), !dbg !863
  call void @exit(i32 1) #10, !dbg !864
  unreachable, !dbg !864

if.end34:                                         ; preds = %if.end28
  call void @llvm.dbg.value(metadata i32 0, metadata !865, metadata !DIExpression()), !dbg !779
  br label %for.cond, !dbg !866

for.cond:                                         ; preds = %for.inc, %if.end34
  %dev.0 = phi i32 [ 0, %if.end34 ], [ %inc, %for.inc ], !dbg !868
  call void @llvm.dbg.value(metadata i32 %dev.0, metadata !865, metadata !DIExpression()), !dbg !779
  %9 = load i32, i32* %deviceCount, align 4, !dbg !869
  %cmp35 = icmp slt i32 %dev.0, %9, !dbg !871
  br i1 %cmp35, label %for.body, label %for.end.loopexit, !dbg !872

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.cudaDeviceProp* %deviceProp, metadata !873, metadata !DIExpression()), !dbg !948
  %call36 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 %dev.0), !dbg !949
  %major = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 11, !dbg !950
  %10 = load i32, i32* %major, align 8, !dbg !950
  %cmp37 = icmp sge i32 %10, 1, !dbg !952
  br i1 %cmp37, label %if.then38, label %if.end39, !dbg !953

if.then38:                                        ; preds = %for.body
  %dev.0.lcssa5 = phi i32 [ %dev.0, %for.body ], !dbg !868
  call void @llvm.dbg.value(metadata i32 %dev.0.lcssa5, metadata !865, metadata !DIExpression()), !dbg !779
  br label %for.end, !dbg !954

if.end39:                                         ; preds = %for.body
  br label %for.inc, !dbg !955

for.inc:                                          ; preds = %if.end39
  %inc = add nuw nsw i32 %dev.0, 1, !dbg !956
  call void @llvm.dbg.value(metadata i32 %inc, metadata !865, metadata !DIExpression()), !dbg !779
  br label %for.cond, !dbg !957, !llvm.loop !958

for.end.loopexit:                                 ; preds = %for.cond
  %dev.0.lcssa = phi i32 [ %dev.0, %for.cond ], !dbg !868
  call void @llvm.dbg.value(metadata i32 %dev.0.lcssa, metadata !865, metadata !DIExpression()), !dbg !779
  br label %for.end, !dbg !960

for.end:                                          ; preds = %for.end.loopexit, %if.then38
  %dev.06 = phi i32 [ %dev.0.lcssa, %for.end.loopexit ], [ %dev.0.lcssa5, %if.then38 ]
  %11 = load i32, i32* %deviceCount, align 4, !dbg !960
  %cmp40 = icmp eq i32 %dev.06, %11, !dbg !962
  br i1 %cmp40, label %if.then41, label %if.else43, !dbg !963

if.then41:                                        ; preds = %for.end
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !964
  %call42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.11, i64 0, i64 0)), !dbg !966
  call void @exit(i32 1) #10, !dbg !967
  unreachable, !dbg !967

if.else43:                                        ; preds = %for.end
  %call44 = call i32 @cudaSetDevice(i32 %dev.06), !dbg !968
  br label %if.end45

if.end45:                                         ; preds = %if.else43
  %13 = load i32, i32* %NX, align 4, !dbg !969
  %conv = sext i32 %13 to i64, !dbg !969
  %mul = mul i64 4, %conv, !dbg !970
  %14 = load i32, i32* %NY, align 4, !dbg !971
  %conv46 = sext i32 %14 to i64, !dbg !971
  %mul47 = mul i64 %mul, %conv46, !dbg !972
  %15 = load i32, i32* %NZ, align 4, !dbg !973
  %conv48 = sext i32 %15 to i64, !dbg !973
  %mul49 = mul i64 %mul47, %conv48, !dbg !974, !tulip.target.datasize !975
  %call50 = call noalias i8* @malloc(i64 %mul49) #11, !dbg !976, !tulip.target.mapdata.to !977
  call void @llvm.dbg.value(metadata float* %40, metadata !978, metadata !DIExpression()), !dbg !779
  %16 = load i32, i32* %NX, align 4, !dbg !979
  %conv51 = sext i32 %16 to i64, !dbg !979
  %mul52 = mul i64 4, %conv51, !dbg !980
  %17 = load i32, i32* %NY, align 4, !dbg !981
  %conv53 = sext i32 %17 to i64, !dbg !981
  %mul54 = mul i64 %mul52, %conv53, !dbg !982
  %18 = load i32, i32* %NZ, align 4, !dbg !983
  %conv55 = sext i32 %18 to i64, !dbg !983
  %mul56 = mul i64 %mul54, %conv55, !dbg !984, !tulip.target.datasize !985
  %call57 = call noalias i8* @malloc(i64 %mul56) #11, !dbg !986, !tulip.target.mapdata.from !987
  %19 = bitcast i8* %call57 to float*, !dbg !988
  call void @llvm.dbg.value(metadata float* %19, metadata !989, metadata !DIExpression()), !dbg !779
  %20 = load i32, i32* %NX, align 4, !dbg !990
  %conv58 = sext i32 %20 to i64, !dbg !990
  %mul59 = mul i64 4, %conv58, !dbg !991
  %21 = load i32, i32* %NY, align 4, !dbg !992
  %conv60 = sext i32 %21 to i64, !dbg !992
  %mul61 = mul i64 %mul59, %conv60, !dbg !993
  %22 = load i32, i32* %NZ, align 4, !dbg !994
  %conv62 = sext i32 %22 to i64, !dbg !994
  %mul63 = mul i64 %mul61, %conv62, !dbg !995
  %call64 = call noalias i8* @malloc(i64 %mul63) #11, !dbg !996
  call void @llvm.dbg.value(metadata float* %41, metadata !997, metadata !DIExpression()), !dbg !779
  %23 = bitcast float** %d_u1 to i8**, !dbg !998
  %24 = load i32, i32* %NX, align 4, !dbg !999
  %conv65 = sext i32 %24 to i64, !dbg !999
  %mul66 = mul i64 4, %conv65, !dbg !1000
  %25 = load i32, i32* %NY, align 4, !dbg !1001
  %conv67 = sext i32 %25 to i64, !dbg !1001
  %mul68 = mul i64 %mul66, %conv67, !dbg !1002
  %26 = load i32, i32* %NZ, align 4, !dbg !1003
  %conv69 = sext i32 %26 to i64, !dbg !1003
  %mul70 = mul i64 %mul68, %conv69, !dbg !1004
  %call71 = call i32 @cudaMalloc(i8** %23, i64 %mul70), !dbg !1005
  %27 = bitcast float** %d_u2 to i8**, !dbg !1006
  %28 = load i32, i32* %NX, align 4, !dbg !1007
  %conv72 = sext i32 %28 to i64, !dbg !1007
  %mul73 = mul i64 4, %conv72, !dbg !1008
  %29 = load i32, i32* %NY, align 4, !dbg !1009
  %conv74 = sext i32 %29 to i64, !dbg !1009
  %mul75 = mul i64 %mul73, %conv74, !dbg !1010
  %30 = load i32, i32* %NZ, align 4, !dbg !1011
  %conv76 = sext i32 %30 to i64, !dbg !1011
  %mul77 = mul i64 %mul75, %conv76, !dbg !1012
  %call78 = call i32 @cudaMalloc(i8** %27, i64 %mul77), !dbg !1013
  %div = udiv i64 undef, 4, !dbg !1014
  call void @llvm.dbg.value(metadata i32 %conv79, metadata !1015, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata i32 0, metadata !1016, metadata !DIExpression()), !dbg !779
  br label %for.cond80, !dbg !1017

for.cond80:                                       ; preds = %for.inc116, %if.end45
  %k.0 = phi i32 [ 0, %if.end45 ], [ %inc117, %for.inc116 ], !dbg !1019
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !1016, metadata !DIExpression()), !dbg !779
  %31 = load i32, i32* %NZ, align 4, !dbg !1020
  %cmp81 = icmp slt i32 %k.0, %31, !dbg !1022
  br i1 %cmp81, label %for.body82, label %for.end118, !dbg !1023

for.body82:                                       ; preds = %for.cond80
  call void @llvm.dbg.value(metadata i32 0, metadata !1024, metadata !DIExpression()), !dbg !779
  br label %for.cond83, !dbg !1025

for.cond83:                                       ; preds = %for.inc113, %for.body82
  %j.0 = phi i32 [ 0, %for.body82 ], [ %inc114, %for.inc113 ], !dbg !1028
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !1024, metadata !DIExpression()), !dbg !779
  %32 = load i32, i32* %NY, align 4, !dbg !1029
  %cmp84 = icmp slt i32 %j.0, %32, !dbg !1031
  br i1 %cmp84, label %for.body85, label %for.end115, !dbg !1032

for.body85:                                       ; preds = %for.cond83
  call void @llvm.dbg.value(metadata i32 0, metadata !1033, metadata !DIExpression()), !dbg !779
  br label %for.cond86, !dbg !1034

for.cond86:                                       ; preds = %for.inc110, %for.body85
  %i.0 = phi i32 [ 0, %for.body85 ], [ %inc111, %for.inc110 ], !dbg !1037
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !1033, metadata !DIExpression()), !dbg !779
  %33 = load i32, i32* %NX, align 4, !dbg !1038
  %cmp87 = icmp slt i32 %i.0, %33, !dbg !1040
  br i1 %cmp87, label %for.body88, label %for.end112, !dbg !1041

for.body88:                                       ; preds = %for.cond86
  %34 = load i32, i32* %NX, align 4, !dbg !1042
  %mul89 = mul nsw i32 %j.0, %34, !dbg !1044
  %add = add nsw i32 %i.0, %mul89, !dbg !1045
  %35 = load i32, i32* %NX, align 4, !dbg !1046
  %mul90 = mul nsw i32 %k.0, %35, !dbg !1047
  %36 = load i32, i32* %NY, align 4, !dbg !1048
  %mul91 = mul nsw i32 %mul90, %36, !dbg !1049
  %add92 = add nsw i32 %add, %mul91, !dbg !1050
  call void @llvm.dbg.value(metadata i32 %add92, metadata !1051, metadata !DIExpression()), !dbg !779
  %cmp93 = icmp eq i32 %i.0, 0, !dbg !1052
  br i1 %cmp93, label %if.then105, label %lor.lhs.false, !dbg !1054

lor.lhs.false:                                    ; preds = %for.body88
  %37 = load i32, i32* %NX, align 4, !dbg !1055
  %sub = sub nsw i32 %37, 1, !dbg !1056
  %cmp94 = icmp eq i32 %i.0, %sub, !dbg !1057
  br i1 %cmp94, label %if.then105, label %lor.lhs.false95, !dbg !1058

lor.lhs.false95:                                  ; preds = %lor.lhs.false
  %cmp96 = icmp eq i32 %j.0, 0, !dbg !1059
  br i1 %cmp96, label %if.then105, label %lor.lhs.false97, !dbg !1060

lor.lhs.false97:                                  ; preds = %lor.lhs.false95
  %38 = load i32, i32* %NY, align 4, !dbg !1061
  %sub98 = sub nsw i32 %38, 1, !dbg !1062
  %cmp99 = icmp eq i32 %j.0, %sub98, !dbg !1063
  br i1 %cmp99, label %if.then105, label %lor.lhs.false100, !dbg !1064

lor.lhs.false100:                                 ; preds = %lor.lhs.false97
  %cmp101 = icmp eq i32 %k.0, 0, !dbg !1065
  br i1 %cmp101, label %if.then105, label %lor.lhs.false102, !dbg !1066

lor.lhs.false102:                                 ; preds = %lor.lhs.false100
  %39 = load i32, i32* %NZ, align 4, !dbg !1067
  %sub103 = sub nsw i32 %39, 1, !dbg !1068
  %cmp104 = icmp eq i32 %k.0, %sub103, !dbg !1069
  br i1 %cmp104, label %if.then105, label %if.else106, !dbg !1070

if.then105:                                       ; preds = %lor.lhs.false102, %lor.lhs.false100, %lor.lhs.false97, %lor.lhs.false95, %lor.lhs.false, %for.body88
  %idxprom = sext i32 %add92 to i64, !dbg !1071
  %arrayidx = getelementptr inbounds float, float* %19, i64 %idxprom, !dbg !1071
  store float 1.000000e+00, float* %arrayidx, align 4, !dbg !1072
  br label %if.end109, !dbg !1071

if.else106:                                       ; preds = %lor.lhs.false102
  %idxprom107 = sext i32 %add92 to i64, !dbg !1073
  %arrayidx108 = getelementptr inbounds float, float* %19, i64 %idxprom107, !dbg !1073
  store float 0.000000e+00, float* %arrayidx108, align 4, !dbg !1074
  br label %if.end109

if.end109:                                        ; preds = %if.else106, %if.then105
  br label %for.inc110, !dbg !1075

for.inc110:                                       ; preds = %if.end109
  %inc111 = add nuw nsw i32 %i.0, 1, !dbg !1076
  call void @llvm.dbg.value(metadata i32 %inc111, metadata !1033, metadata !DIExpression()), !dbg !779
  br label %for.cond86, !dbg !1077, !llvm.loop !1078

for.end112:                                       ; preds = %for.cond86
  br label %for.inc113, !dbg !1080

for.inc113:                                       ; preds = %for.end112
  %inc114 = add nuw nsw i32 %j.0, 1, !dbg !1081
  call void @llvm.dbg.value(metadata i32 %inc114, metadata !1024, metadata !DIExpression()), !dbg !779
  br label %for.cond83, !dbg !1082, !llvm.loop !1083

for.end115:                                       ; preds = %for.cond83
  br label %for.inc116, !dbg !1085

for.inc116:                                       ; preds = %for.end115
  %inc117 = add nuw nsw i32 %k.0, 1, !dbg !1086
  call void @llvm.dbg.value(metadata i32 %inc117, metadata !1016, metadata !DIExpression()), !dbg !779
  br label %for.cond80, !dbg !1087, !llvm.loop !1088

for.end118:                                       ; preds = %for.cond80
  %40 = bitcast i8* %call50 to float*, !dbg !1090
  %41 = bitcast i8* %call64 to float*, !dbg !1091
  %conv79 = trunc i64 %div to i32, !dbg !1092
  %42 = bitcast float* %19 to i8*, !dbg !1093
  %43 = bitcast float* %19 to i8*, !dbg !1094
  %44 = load i32, i32* %NX, align 4, !dbg !1095
  %conv119 = sext i32 %44 to i64, !dbg !1095
  %mul120 = mul i64 4, %conv119, !dbg !1096
  %45 = load i32, i32* %NY, align 4, !dbg !1097
  %conv121 = sext i32 %45 to i64, !dbg !1097
  %mul122 = mul i64 %mul120, %conv121, !dbg !1098
  %46 = load i32, i32* %NZ, align 4, !dbg !1099
  %conv123 = sext i32 %46 to i64, !dbg !1099
  %mul124 = mul i64 %mul122, %conv123, !dbg !1100
  %call125 = call i32 @cudaMemcpy(i8* %42, i8* %43, i64 %mul124, i32 1), !dbg !1101, !tulip.target.start.of.map !1102
  %call126 = call i32 @cudaThreadSynchronize(), !dbg !1103
  %47 = load i32, i32* %NX, align 4, !dbg !1104
  %sub127 = sub nsw i32 %47, 1, !dbg !1105
  %div128 = sdiv i32 %sub127, 32, !dbg !1106
  %add129 = add nsw i32 1, %div128, !dbg !1107
  call void @llvm.dbg.value(metadata i32 %add129, metadata !1108, metadata !DIExpression()), !dbg !779
  %48 = load i32, i32* %NY, align 4, !dbg !1109
  %sub130 = sub nsw i32 %48, 1, !dbg !1110
  %div131 = sdiv i32 %sub130, 4, !dbg !1111
  %add132 = add nsw i32 1, %div131, !dbg !1112
  call void @llvm.dbg.value(metadata i32 %add132, metadata !1113, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !1114, metadata !DIExpression()), !dbg !1138
  %dim3gep.0 = getelementptr %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 0
  store i32 %add129, i32* %dim3gep.0
  %dim3gep.1 = getelementptr %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 1
  store i32 %add132, i32* %dim3gep.1
  %dim3gep.2 = getelementptr %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 2
  store i32 1, i32* %dim3gep.2
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !1139, metadata !DIExpression()), !dbg !1140
  %dim3gep.01 = getelementptr %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 0
  store i32 32, i32* %dim3gep.01
  %dim3gep.12 = getelementptr %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 1
  store i32 4, i32* %dim3gep.12
  %dim3gep.23 = getelementptr %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 2
  store i32 1, i32* %dim3gep.23
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 0, !dbg !1141
  %49 = load i32, i32* %x, align 4, !dbg !1141
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 1, !dbg !1142
  %50 = load i32, i32* %y, align 4, !dbg !1142
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %dimGrid, i32 0, i32 2, !dbg !1143
  %51 = load i32, i32* %z, align 4, !dbg !1143
  %call133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i64 0, i64 0), i32 %49, i32 %50, i32 %51), !dbg !1144
  %x134 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 0, !dbg !1145
  %52 = load i32, i32* %x134, align 4, !dbg !1145
  %y135 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 1, !dbg !1146
  %53 = load i32, i32* %y135, align 4, !dbg !1146
  %z136 = getelementptr inbounds %struct.dim3, %struct.dim3* %dimBlock, i32 0, i32 2, !dbg !1147
  %54 = load i32, i32* %z136, align 4, !dbg !1147
  %call137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i64 0, i64 0), i32 %52, i32 %53, i32 %54), !dbg !1148
  %call138 = call i32 @cudaThreadSynchronize(), !dbg !1149
  call void @llvm.dbg.value(metadata i32 1, metadata !1033, metadata !DIExpression()), !dbg !779
  br label %for.cond139, !dbg !1150

for.cond139:                                      ; preds = %for.inc146, %for.end118
  %i.1 = phi i32 [ 1, %for.end118 ], [ %inc147, %for.inc146 ], !dbg !1152
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !1033, metadata !DIExpression()), !dbg !779
  %55 = load i32, i32* %REPEAT, align 4, !dbg !1153
  %cmp140 = icmp sle i32 %i.1, %55, !dbg !1155
  br i1 %cmp140, label %for.body141, label %for.end148, !dbg !1156

for.body141:                                      ; preds = %for.cond139
  %56 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1157
  %57 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !1157
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %56, i8* align 4 %57, i64 12, i1 false), !dbg !1157
  %58 = bitcast %struct.dim3* %agg.tmp142 to i8*, !dbg !1159
  %59 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !1159
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %58, i8* align 4 %59, i64 12, i1 false), !dbg !1159
  %60 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1160
  %61 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %60, i8* align 4 %61, i64 12, i1 false), !dbg !1160
  %62 = bitcast { i64, i32 }* %agg.tmp142.coerce to i8*, !dbg !1160
  %63 = bitcast %struct.dim3* %agg.tmp142 to i8*, !dbg !1160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %62, i8* align 4 %63, i64 12, i1 false), !dbg !1160
  br label %header.0

header.0:                                         ; preds = %latch.0, %for.body141
  %indvar.0 = phi i32 [ 0, %for.body141 ], [ %indvar.next.0, %latch.0 ]
  %exitcond9 = icmp ne i32 %indvar.0, %add129
  br i1 %exitcond9, label %header.1.preheader, label %kcall.end, !tulip.doall.loop.grid.collapse !1102

header.1.preheader:                               ; preds = %header.0
  br label %header.1

header.1:                                         ; preds = %header.1.preheader, %latch.1
  %indvar.1 = phi i32 [ %indvar.next.1, %latch.1 ], [ 0, %header.1.preheader ]
  %exitcond8 = icmp ne i32 %indvar.1, %add132
  br i1 %exitcond8, label %header.2.preheader, label %latch.0

header.2.preheader:                               ; preds = %header.1
  br label %header.2

header.2:                                         ; preds = %header.2.preheader, %latch.2
  %indvar.2 = phi i32 [ %indvar.next.2, %latch.2 ], [ 0, %header.2.preheader ]
  %exitcond7 = icmp ne i32 %indvar.2, 32
  br i1 %exitcond7, label %header.3.preheader, label %latch.1, !tulip.doall.loop.block.collapse !1102

header.3.preheader:                               ; preds = %header.2
  br label %header.3

header.3:                                         ; preds = %header.3.preheader, %latch.3
  %indvar.3 = phi i32 [ %indvar.next.3, %latch.3 ], [ 0, %header.3.preheader ]
  %exitcond = icmp ne i32 %indvar.3, 4
  br i1 %exitcond, label %kcall.configok, label %latch.2

latch.3:                                          ; preds = %kcall.configok
  %indvar.next.3 = add nuw nsw i32 %indvar.3, 1
  br label %header.3

latch.2:                                          ; preds = %header.3
  %indvar.next.2 = add nuw nsw i32 %indvar.2, 1
  br label %header.2

latch.1:                                          ; preds = %header.2
  %indvar.next.1 = add i32 %indvar.1, 1
  br label %header.1

latch.0:                                          ; preds = %header.1
  %indvar.next.0 = add i32 %indvar.0, 1
  br label %header.0

kcall.configok:                                   ; preds = %header.3
  %64 = load i32, i32* %NX, align 4, !dbg !1161
  %65 = load i32, i32* %NY, align 4, !dbg !1162
  %66 = load i32, i32* %NZ, align 4, !dbg !1163
  %67 = load float*, float** %d_u2, align 8, !dbg !1164
  call void @_Z13GPU_laplace3diiiiPfS_.1(i32 %64, i32 %65, i32 %66, i32 %conv79, float* %40, float* %67, i32 %add129, i32 %add132, i32 1, i32 32, i32 4, i32 1, i32 %indvar.0, i32 %indvar.1, i32 0, i32 %indvar.2, i32 %indvar.3, i32 0)
  br label %latch.3

kcall.end:                                        ; preds = %header.0
  call void @llvm.dbg.value(metadata float* %40, metadata !1165, metadata !DIExpression()), !dbg !779
  %68 = load float*, float** %d_u2, align 8, !dbg !1166
  store float* %68, float** %d_u1, align 8, !dbg !1167
  store float* %40, float** %d_u2, align 8, !dbg !1168
  %call145 = call i32 @cudaThreadSynchronize(), !dbg !1169
  br label %for.inc146, !dbg !1170

for.inc146:                                       ; preds = %kcall.end
  %inc147 = add nuw nsw i32 %i.1, 1, !dbg !1171
  call void @llvm.dbg.value(metadata i32 %inc147, metadata !1033, metadata !DIExpression()), !dbg !779
  br label %for.cond139, !dbg !1172, !llvm.loop !1173

for.end148:                                       ; preds = %for.cond139
  %69 = bitcast float* %19 to i8*, !dbg !1175
  %70 = bitcast float* %40 to i8*, !dbg !1176
  %71 = load i32, i32* %NX, align 4, !dbg !1177
  %conv149 = sext i32 %71 to i64, !dbg !1177
  %mul150 = mul i64 4, %conv149, !dbg !1178
  %72 = load i32, i32* %NY, align 4, !dbg !1179
  %conv151 = sext i32 %72 to i64, !dbg !1179
  %mul152 = mul i64 %mul150, %conv151, !dbg !1180
  %73 = load i32, i32* %NZ, align 4, !dbg !1181
  %conv153 = sext i32 %73 to i64, !dbg !1181
  %mul154 = mul i64 %mul152, %conv153, !dbg !1182
  %call155 = call i32 @cudaMemcpy(i8* %69, i8* %70, i64 %mul154, i32 2), !dbg !1183, !tulip.target.end.of.map !1102
  call void @llvm.dbg.value(metadata i32 1, metadata !1184, metadata !DIExpression()), !dbg !1186
  br label %for.cond157, !dbg !1187

for.cond157:                                      ; preds = %for.inc160, %for.end148
  %h_u3.0 = phi float* [ %41, %for.end148 ], [ %19, %for.inc160 ], !dbg !779
  %i156.0 = phi i32 [ 1, %for.end148 ], [ %inc161, %for.inc160 ], !dbg !1186
  call void @llvm.dbg.value(metadata i32 %i156.0, metadata !1184, metadata !DIExpression()), !dbg !1186
  call void @llvm.dbg.value(metadata float* %h_u3.0, metadata !997, metadata !DIExpression()), !dbg !779
  %74 = load i32, i32* %REPEAT, align 4, !dbg !1188
  %cmp158 = icmp sle i32 %i156.0, %74, !dbg !1190
  br i1 %cmp158, label %for.body159, label %for.end162, !dbg !1191

for.body159:                                      ; preds = %for.cond157
  %75 = load i32, i32* %NX, align 4, !dbg !1192
  %76 = load i32, i32* %NY, align 4, !dbg !1194
  %77 = load i32, i32* %NZ, align 4, !dbg !1195
  call void @_Z14Gold_laplace3diiiPfS_(i32 %75, i32 %76, i32 %77, float* %19, float* %h_u3.0), !dbg !1196
  call void @llvm.dbg.value(metadata float* %19, metadata !1197, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata float* %h_u3.0, metadata !978, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata float* %19, metadata !997, metadata !DIExpression()), !dbg !779
  br label %for.inc160, !dbg !1198

for.inc160:                                       ; preds = %for.body159
  %inc161 = add nuw nsw i32 %i156.0, 1, !dbg !1199
  call void @llvm.dbg.value(metadata i32 %inc161, metadata !1184, metadata !DIExpression()), !dbg !1186
  br label %for.cond157, !dbg !1200, !llvm.loop !1201

for.end162:                                       ; preds = %for.cond157
  %h_u3.0.lcssa = phi float* [ %h_u3.0, %for.cond157 ], !dbg !779
  call void @llvm.dbg.value(metadata float* %h_u3.0.lcssa, metadata !997, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !1203, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata i32 0, metadata !1016, metadata !DIExpression()), !dbg !779
  br label %for.cond163, !dbg !1204

for.cond163:                                      ; preds = %for.inc195, %for.end162
  %k.1 = phi i32 [ 0, %for.end162 ], [ %inc196, %for.inc195 ], !dbg !1206
  %err.0 = phi float [ 0.000000e+00, %for.end162 ], [ %err.1.lcssa, %for.inc195 ], !dbg !1207
  call void @llvm.dbg.value(metadata float %err.0, metadata !1203, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata i32 %k.1, metadata !1016, metadata !DIExpression()), !dbg !779
  %78 = load i32, i32* %NZ, align 4, !dbg !1208
  %cmp164 = icmp slt i32 %k.1, %78, !dbg !1210
  br i1 %cmp164, label %for.body165, label %for.end197, !dbg !1211

for.body165:                                      ; preds = %for.cond163
  call void @llvm.dbg.value(metadata i32 0, metadata !1024, metadata !DIExpression()), !dbg !779
  br label %for.cond166, !dbg !1212

for.cond166:                                      ; preds = %for.inc192, %for.body165
  %j.1 = phi i32 [ 0, %for.body165 ], [ %inc193, %for.inc192 ], !dbg !1215
  %err.1 = phi float [ %err.0, %for.body165 ], [ %err.2.lcssa, %for.inc192 ], !dbg !1207
  call void @llvm.dbg.value(metadata float %err.1, metadata !1203, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !1024, metadata !DIExpression()), !dbg !779
  %79 = load i32, i32* %NY, align 4, !dbg !1216
  %cmp167 = icmp slt i32 %j.1, %79, !dbg !1218
  br i1 %cmp167, label %for.body168, label %for.end194, !dbg !1219

for.body168:                                      ; preds = %for.cond166
  call void @llvm.dbg.value(metadata i32 0, metadata !1033, metadata !DIExpression()), !dbg !779
  br label %for.cond169, !dbg !1220

for.cond169:                                      ; preds = %for.inc189, %for.body168
  %i.2 = phi i32 [ 0, %for.body168 ], [ %inc190, %for.inc189 ], !dbg !1223
  %err.2 = phi float [ %err.1, %for.body168 ], [ %add188, %for.inc189 ], !dbg !779
  call void @llvm.dbg.value(metadata float %err.2, metadata !1203, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !1033, metadata !DIExpression()), !dbg !779
  %80 = load i32, i32* %NX, align 4, !dbg !1224
  %cmp170 = icmp slt i32 %i.2, %80, !dbg !1226
  br i1 %cmp170, label %for.body171, label %for.end191, !dbg !1227

for.body171:                                      ; preds = %for.cond169
  %81 = load i32, i32* %NX, align 4, !dbg !1228
  %mul172 = mul nsw i32 %j.1, %81, !dbg !1230
  %add173 = add nsw i32 %i.2, %mul172, !dbg !1231
  %82 = load i32, i32* %NX, align 4, !dbg !1232
  %mul174 = mul nsw i32 %k.1, %82, !dbg !1233
  %83 = load i32, i32* %NY, align 4, !dbg !1234
  %mul175 = mul nsw i32 %mul174, %83, !dbg !1235
  %add176 = add nsw i32 %add173, %mul175, !dbg !1236
  call void @llvm.dbg.value(metadata i32 %add176, metadata !1051, metadata !DIExpression()), !dbg !779
  %idxprom177 = sext i32 %add176 to i64, !dbg !1237
  %arrayidx178 = getelementptr inbounds float, float* %19, i64 %idxprom177, !dbg !1237
  %84 = load float, float* %arrayidx178, align 4, !dbg !1237
  %idxprom179 = sext i32 %add176 to i64, !dbg !1238
  %arrayidx180 = getelementptr inbounds float, float* %19, i64 %idxprom179, !dbg !1238
  %85 = load float, float* %arrayidx180, align 4, !dbg !1238
  %sub181 = fsub contract float %84, %85, !dbg !1239
  %idxprom182 = sext i32 %add176 to i64, !dbg !1240
  %arrayidx183 = getelementptr inbounds float, float* %19, i64 %idxprom182, !dbg !1240
  %86 = load float, float* %arrayidx183, align 4, !dbg !1240
  %idxprom184 = sext i32 %add176 to i64, !dbg !1241
  %arrayidx185 = getelementptr inbounds float, float* %19, i64 %idxprom184, !dbg !1241
  %87 = load float, float* %arrayidx185, align 4, !dbg !1241
  %sub186 = fsub contract float %86, %87, !dbg !1242
  %mul187 = fmul contract float %sub181, %sub186, !dbg !1243
  %add188 = fadd contract float %err.2, %mul187, !dbg !1244
  call void @llvm.dbg.value(metadata float %add188, metadata !1203, metadata !DIExpression()), !dbg !779
  br label %for.inc189, !dbg !1245

for.inc189:                                       ; preds = %for.body171
  %inc190 = add nuw nsw i32 %i.2, 1, !dbg !1246
  call void @llvm.dbg.value(metadata i32 %inc190, metadata !1033, metadata !DIExpression()), !dbg !779
  br label %for.cond169, !dbg !1247, !llvm.loop !1248

for.end191:                                       ; preds = %for.cond169
  %err.2.lcssa = phi float [ %err.2, %for.cond169 ], !dbg !779
  call void @llvm.dbg.value(metadata float %err.2.lcssa, metadata !1203, metadata !DIExpression()), !dbg !779
  br label %for.inc192, !dbg !1250

for.inc192:                                       ; preds = %for.end191
  %inc193 = add nuw nsw i32 %j.1, 1, !dbg !1251
  call void @llvm.dbg.value(metadata i32 %inc193, metadata !1024, metadata !DIExpression()), !dbg !779
  br label %for.cond166, !dbg !1252, !llvm.loop !1253

for.end194:                                       ; preds = %for.cond166
  %err.1.lcssa = phi float [ %err.1, %for.cond166 ], !dbg !1207
  call void @llvm.dbg.value(metadata float %err.1.lcssa, metadata !1203, metadata !DIExpression()), !dbg !779
  br label %for.inc195, !dbg !1255

for.inc195:                                       ; preds = %for.end194
  %inc196 = add nuw nsw i32 %k.1, 1, !dbg !1256
  call void @llvm.dbg.value(metadata i32 %inc196, metadata !1016, metadata !DIExpression()), !dbg !779
  br label %for.cond163, !dbg !1257, !llvm.loop !1258

for.end197:                                       ; preds = %for.cond163
  %err.0.lcssa = phi float [ %err.0, %for.cond163 ], !dbg !1207
  call void @llvm.dbg.value(metadata float %err.0.lcssa, metadata !1203, metadata !DIExpression()), !dbg !779
  %88 = load i32, i32* %NX, align 4, !dbg !1260
  %89 = load i32, i32* %NY, align 4, !dbg !1261
  %mul198 = mul nsw i32 %88, %89, !dbg !1262
  %90 = load i32, i32* %NZ, align 4, !dbg !1263
  %mul199 = mul nsw i32 %mul198, %90, !dbg !1264
  %conv200 = sitofp i32 %mul199 to float, !dbg !1265
  %div201 = fdiv float %err.0.lcssa, %conv200, !dbg !1266
  %call202 = call float @_ZSt4sqrtf(float %div201), !dbg !1267
  %conv203 = fpext float %call202 to double, !dbg !1267
  %call204 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.14, i64 0, i64 0), double %conv203), !dbg !1268
  %call205 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i64 0, i64 0)), !dbg !1269
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1270
  %call206 = call i32 @fflush(%struct._IO_FILE* %91), !dbg !1271
  %call208 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.16, i64 0, i64 0)), !dbg !1272
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1273
  %call209 = call i32 @fflush(%struct._IO_FILE* %92), !dbg !1274
  %call211 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.17, i64 0, i64 0)), !dbg !1275
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1276
  %call212 = call i32 @fflush(%struct._IO_FILE* %93), !dbg !1277
  %94 = bitcast float* %19 to i8*, !dbg !1278
  call void @free(i8* %94) #11, !dbg !1279
  %call213 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i64 0, i64 0)), !dbg !1280
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1281
  %call214 = call i32 @fflush(%struct._IO_FILE* %95), !dbg !1282
  %96 = bitcast float* %19 to i8*, !dbg !1283
  call void @free(i8* %96) #11, !dbg !1284
  %call215 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i64 0, i64 0)), !dbg !1285
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1286
  %call216 = call i32 @fflush(%struct._IO_FILE* %97), !dbg !1287
  %98 = bitcast float* %h_u3.0.lcssa to i8*, !dbg !1288
  call void @free(i8* %98) #11, !dbg !1289
  br label %return, !dbg !1290

return:                                           ; preds = %for.end197, %if.then24, %if.then16, %if.then8, %if.then2, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ -1, %if.then2 ], [ -1, %if.then8 ], [ -1, %if.then16 ], [ -1, %if.then24 ], [ 0, %for.end197 ]
  ret i32 %retval.0, !dbg !1290
}

; Function Attrs: noinline uwtable
define dso_local void @_Z9printHelpv() #4 !dbg !1291 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.20, i64 0, i64 0)), !dbg !1292
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.21, i64 0, i64 0)), !dbg !1293
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0)), !dbg !1294
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.23, i64 0, i64 0)), !dbg !1295
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.24, i64 0, i64 0)), !dbg !1296
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0)), !dbg !1297
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i64 0, i64 0)), !dbg !1298
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.26, i64 0, i64 0)), !dbg !1299
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.27, i64 0, i64 0)), !dbg !1300
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.28, i64 0, i64 0)), !dbg !1301
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.29, i64 0, i64 0)), !dbg !1302
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.30, i64 0, i64 0)), !dbg !1303
  ret void, !dbg !1304
}

declare dso_local i32 @printf(i8*, ...) #5

declare dso_local i32 @cudaGetDeviceCount(i32*) #5

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #5

declare dso_local i32 @cudaSetDevice(i32) #5

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #7

declare dso_local i32 @cudaMalloc(i8**, i64) #5

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #5

declare dso_local i32 @cudaThreadSynchronize() #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #8

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #5

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local float @_ZSt4sqrtf(float %__x) #2 comdat !dbg !1305 {
entry:
  call void @llvm.dbg.value(metadata float %__x, metadata !1306, metadata !DIExpression()), !dbg !1307
  %call = call float @sqrtf(float %__x) #11, !dbg !1308
  ret float %call, !dbg !1309
}

declare dso_local i32 @fflush(%struct._IO_FILE*) #5

declare dso_local i32 @cudaFree(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #7

; Function Attrs: nounwind
declare dso_local float @sqrtf(float) #7

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z13GPU_laplace3diiiiPfS_.1(i32 %NX, i32 %NY, i32 %NZ, i32 %pitch, float* %d_u1, float* %d_u2, i32 %gridDim.x, i32 %gridDim.y, i32 %gridDim.z, i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, i32 %blockIdx.x, i32 %blockIdx.y, i32 %blockIdx.z, i32 %threadIdx.x, i32 %threadIdx.y, i32 %threadIdx.z) #9 {
entry:
  %sharedMem0 = alloca [612 x float]
  call void @llvm.dbg.value(metadata i32 %NX, metadata !1310, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %NY, metadata !1312, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %NZ, metadata !1313, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %pitch, metadata !1314, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata float* %d_u1, metadata !1315, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata float* %d_u2, metadata !1316, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata float 0x3FC5555560000000, metadata !1317, metadata !DIExpression()), !dbg !1311
  %sub = sub nsw i32 %NX, 1, !dbg !1318
  call void @llvm.dbg.value(metadata i32 %sub, metadata !1319, metadata !DIExpression()), !dbg !1311
  %sub1 = sub nsw i32 %NY, 1, !dbg !1320
  call void @llvm.dbg.value(metadata i32 %sub1, metadata !1321, metadata !DIExpression()), !dbg !1311
  %sub2 = sub nsw i32 %NZ, 1, !dbg !1322
  call void @llvm.dbg.value(metadata i32 %sub2, metadata !1323, metadata !DIExpression()), !dbg !1311
  %mul = mul i32 %threadIdx.y, 32, !dbg !1324
  %add = add i32 %threadIdx.x, %mul, !dbg !1325
  call void @llvm.dbg.value(metadata i32 %add, metadata !1326, metadata !DIExpression()), !dbg !1311
  %cmp = icmp slt i32 %add, 76, !dbg !1327
  %conv = zext i1 %cmp to i32, !dbg !1328
  call void @llvm.dbg.value(metadata i32 %conv, metadata !1329, metadata !DIExpression()), !dbg !1311
  %tobool = icmp ne i32 %conv, 0, !dbg !1330
  br i1 %tobool, label %if.then, label %if.end34, !dbg !1332

if.then:                                          ; preds = %entry
  %cmp5 = icmp ult i32 %threadIdx.y, 2, !dbg !1333
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1336

if.then6:                                         ; preds = %if.then
  call void @llvm.dbg.value(metadata i32 %threadIdx.x, metadata !1337, metadata !DIExpression()), !dbg !1311
  %mul9 = mul i32 %threadIdx.y, 5, !dbg !1338
  %sub10 = sub i32 %mul9, 1, !dbg !1340
  call void @llvm.dbg.value(metadata i32 %sub10, metadata !1341, metadata !DIExpression()), !dbg !1311
  br label %if.end, !dbg !1342

if.else:                                          ; preds = %if.then
  %rem = srem i32 %add, 2, !dbg !1343
  %mul11 = mul nsw i32 %rem, 33, !dbg !1345
  %sub12 = sub nsw i32 %mul11, 1, !dbg !1346
  call void @llvm.dbg.value(metadata i32 %sub12, metadata !1337, metadata !DIExpression()), !dbg !1311
  %div = sdiv i32 %add, 2, !dbg !1347
  %sub13 = sub nsw i32 %div, 32, !dbg !1348
  %sub14 = sub nsw i32 %sub13, 1, !dbg !1349
  call void @llvm.dbg.value(metadata i32 %sub14, metadata !1341, metadata !DIExpression()), !dbg !1311
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  %i.0 = phi i32 [ %threadIdx.x, %if.then6 ], [ %sub12, %if.else ], !dbg !1350
  %j.0 = phi i32 [ %sub10, %if.then6 ], [ %sub14, %if.else ], !dbg !1350
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !1341, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !1337, metadata !DIExpression()), !dbg !1311
  %add15 = add nsw i32 %i.0, 1, !dbg !1351
  %add16 = add nsw i32 %j.0, 1, !dbg !1351
  call void @llvm.dbg.value(metadata i32 %add16, metadata !1352, metadata !DIExpression()), !dbg !1356
  call void @llvm.dbg.value(metadata i32 34, metadata !1358, metadata !DIExpression()), !dbg !1356
  %0 = call i32 @llvm.nvvm.mul24.i(i32 %add16, i32 34) #11, !dbg !1359
  %add18 = add nsw i32 %add15, %0, !dbg !1351
  %add19 = add nsw i32 %add18, 204, !dbg !1360
  call void @llvm.dbg.value(metadata i32 %add19, metadata !1361, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %blockIdx.x, metadata !1352, metadata !DIExpression()), !dbg !1362
  call void @llvm.dbg.value(metadata i32 32, metadata !1358, metadata !DIExpression()), !dbg !1362
  %1 = call i32 @llvm.nvvm.mul24.i(i32 %blockIdx.x, i32 32) #11, !dbg !1364
  %add22 = add nsw i32 %i.0, %1, !dbg !1365
  call void @llvm.dbg.value(metadata i32 %add22, metadata !1337, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %blockIdx.y, metadata !1352, metadata !DIExpression()), !dbg !1366
  call void @llvm.dbg.value(metadata i32 4, metadata !1358, metadata !DIExpression()), !dbg !1366
  %2 = call i32 @llvm.nvvm.mul24.i(i32 %blockIdx.y, i32 4) #11, !dbg !1368
  %add25 = add nsw i32 %j.0, %2, !dbg !1369
  call void @llvm.dbg.value(metadata i32 %add25, metadata !1341, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %add25, metadata !1352, metadata !DIExpression()), !dbg !1370
  call void @llvm.dbg.value(metadata i32 %pitch, metadata !1358, metadata !DIExpression()), !dbg !1370
  %3 = call i32 @llvm.nvvm.mul24.i(i32 %add25, i32 %pitch) #11, !dbg !1372
  %add27 = add nsw i32 %add22, %3, !dbg !1373
  call void @llvm.dbg.value(metadata i32 %add27, metadata !1374, metadata !DIExpression()), !dbg !1311
  %cmp28 = icmp sge i32 %add22, 0, !dbg !1375
  br i1 %cmp28, label %land.lhs.true, label %land.end, !dbg !1376

land.lhs.true:                                    ; preds = %if.end
  %cmp29 = icmp slt i32 %add22, %NX, !dbg !1377
  br i1 %cmp29, label %land.lhs.true30, label %land.end, !dbg !1378

land.lhs.true30:                                  ; preds = %land.lhs.true
  %cmp31 = icmp sge i32 %add25, 0, !dbg !1379
  br i1 %cmp31, label %land.rhs, label %land.end, !dbg !1380

land.rhs:                                         ; preds = %land.lhs.true30
  %cmp32 = icmp slt i32 %add25, %NY, !dbg !1381
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true30, %land.lhs.true, %if.end
  %4 = phi i1 [ false, %land.lhs.true30 ], [ false, %land.lhs.true ], [ false, %if.end ], [ %cmp32, %land.rhs ], !dbg !1382
  %conv33 = zext i1 %4 to i32, !dbg !1383
  call void @llvm.dbg.value(metadata i32 %conv33, metadata !1329, metadata !DIExpression()), !dbg !1311
  br label %if.end34, !dbg !1384

if.end34:                                         ; preds = %land.end, %entry
  %indg_h.0 = phi i32 [ %add27, %land.end ], [ undef, %entry ]
  %ind_h.0 = phi i32 [ %add19, %land.end ], [ undef, %entry ]
  %halo.0 = phi i32 [ %conv33, %land.end ], [ %conv, %entry ], !dbg !1311
  call void @llvm.dbg.value(metadata i32 %halo.0, metadata !1329, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %ind_h.0, metadata !1361, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %indg_h.0, metadata !1374, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %threadIdx.x, metadata !1337, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %threadIdx.y, metadata !1341, metadata !DIExpression()), !dbg !1311
  %add37 = add nsw i32 %threadIdx.x, 1, !dbg !1385
  %add38 = add nsw i32 %threadIdx.y, 1, !dbg !1385
  call void @llvm.dbg.value(metadata i32 %add38, metadata !1352, metadata !DIExpression()), !dbg !1386
  call void @llvm.dbg.value(metadata i32 34, metadata !1358, metadata !DIExpression()), !dbg !1386
  %5 = call i32 @llvm.nvvm.mul24.i(i32 %add38, i32 34) #11, !dbg !1388
  %add40 = add nsw i32 %add37, %5, !dbg !1385
  %add41 = add nsw i32 %add40, 204, !dbg !1389
  call void @llvm.dbg.value(metadata i32 %add41, metadata !1390, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %blockIdx.x, metadata !1352, metadata !DIExpression()), !dbg !1391
  call void @llvm.dbg.value(metadata i32 32, metadata !1358, metadata !DIExpression()), !dbg !1391
  %6 = call i32 @llvm.nvvm.mul24.i(i32 %blockIdx.x, i32 32) #11, !dbg !1393
  %add44 = add nsw i32 %threadIdx.x, %6, !dbg !1394
  call void @llvm.dbg.value(metadata i32 %add44, metadata !1337, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %blockIdx.y, metadata !1352, metadata !DIExpression()), !dbg !1395
  call void @llvm.dbg.value(metadata i32 4, metadata !1358, metadata !DIExpression()), !dbg !1395
  %7 = call i32 @llvm.nvvm.mul24.i(i32 %blockIdx.y, i32 4) #11, !dbg !1397
  %add47 = add nsw i32 %threadIdx.y, %7, !dbg !1398
  call void @llvm.dbg.value(metadata i32 %add47, metadata !1341, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %add47, metadata !1352, metadata !DIExpression()), !dbg !1399
  call void @llvm.dbg.value(metadata i32 %pitch, metadata !1358, metadata !DIExpression()), !dbg !1399
  %8 = call i32 @llvm.nvvm.mul24.i(i32 %add47, i32 %pitch) #11, !dbg !1401
  %add49 = add nsw i32 %add44, %8, !dbg !1402
  call void @llvm.dbg.value(metadata i32 %add49, metadata !1403, metadata !DIExpression()), !dbg !1311
  %cmp50 = icmp slt i32 %add44, %NX, !dbg !1404
  br i1 %cmp50, label %land.rhs51, label %land.end53, !dbg !1405

land.rhs51:                                       ; preds = %if.end34
  %cmp52 = icmp slt i32 %add47, %NY, !dbg !1406
  br label %land.end53

land.end53:                                       ; preds = %land.rhs51, %if.end34
  %9 = phi i1 [ false, %if.end34 ], [ %cmp52, %land.rhs51 ], !dbg !1311
  %conv54 = zext i1 %9 to i32, !dbg !1407
  call void @llvm.dbg.value(metadata i32 %conv54, metadata !1408, metadata !DIExpression()), !dbg !1311
  %tobool55 = icmp ne i32 %conv54, 0, !dbg !1409
  br i1 %tobool55, label %if.then56, label %if.end60, !dbg !1411

if.then56:                                        ; preds = %land.end53
  %idxprom = sext i32 %add49 to i64, !dbg !1412
  %arrayidx = getelementptr inbounds float, float* %d_u1, i64 %idxprom, !dbg !1412
  %10 = load float, float* %arrayidx, align 4, !dbg !1412
  %add57 = add nsw i32 %add41, 204, !dbg !1413
  %idxprom58 = sext i32 %add57 to i64, !dbg !1414
  %arrayidx59 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom58, !dbg !1414
  store float %10, float* %arrayidx59, align 4, !dbg !1415
  br label %if.end60, !dbg !1414

if.end60:                                         ; preds = %if.then56, %land.end53
  %tobool61 = icmp ne i32 %halo.0, 0, !dbg !1416
  br i1 %tobool61, label %if.then62, label %if.end68, !dbg !1418

if.then62:                                        ; preds = %if.end60
  %idxprom63 = sext i32 %indg_h.0 to i64, !dbg !1419
  %arrayidx64 = getelementptr inbounds float, float* %d_u1, i64 %idxprom63, !dbg !1419
  %11 = load float, float* %arrayidx64, align 4, !dbg !1419
  %add65 = add nsw i32 %ind_h.0, 204, !dbg !1420
  %idxprom66 = sext i32 %add65 to i64, !dbg !1421
  %arrayidx67 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom66, !dbg !1421
  store float %11, float* %arrayidx67, align 4, !dbg !1422
  br label %if.end68, !dbg !1421

if.end68:                                         ; preds = %if.then62, %if.end60
  call void @llvm.dbg.value(metadata i32 0, metadata !1326, metadata !DIExpression()), !dbg !1311
  br label %for.cond, !dbg !1423

for.cond:                                         ; preds = %for.inc, %if.end68
  %indg.0 = phi i32 [ %add49, %if.end68 ], [ %indg.1, %for.inc ], !dbg !1311
  %indg_h.1 = phi i32 [ %indg_h.0, %if.end68 ], [ %indg_h.2, %for.inc ], !dbg !1311
  %indg0.0 = phi i32 [ undef, %if.end68 ], [ %indg0.1, %for.inc ]
  %k.0 = phi i32 [ 0, %if.end68 ], [ %inc, %for.inc ], !dbg !1425
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !1326, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %indg0.0, metadata !1426, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %indg_h.1, metadata !1374, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %indg.0, metadata !1403, metadata !DIExpression()), !dbg !1311
  %cmp69 = icmp slt i32 %k.0, %NZ, !dbg !1427
  br i1 %cmp69, label %for.body, label %for.end, !dbg !1429

for.body:                                         ; preds = %for.cond
  %tobool70 = icmp ne i32 %conv54, 0, !dbg !1430
  br i1 %tobool70, label %if.then71, label %if.end92, !dbg !1433

if.then71:                                        ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 %indg.0, metadata !1426, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %NY, metadata !1352, metadata !DIExpression()), !dbg !1434
  call void @llvm.dbg.value(metadata i32 %pitch, metadata !1358, metadata !DIExpression()), !dbg !1434
  %12 = call i32 @llvm.nvvm.mul24.i(i32 %NY, i32 %pitch) #11, !dbg !1437
  %add73 = add nsw i32 %indg.0, %12, !dbg !1438
  call void @llvm.dbg.value(metadata i32 %add73, metadata !1403, metadata !DIExpression()), !dbg !1311
  %idxprom74 = sext i32 %add41 to i64, !dbg !1439
  %arrayidx75 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom74, !dbg !1439
  %13 = load float, float* %arrayidx75, align 4, !dbg !1439
  %sub76 = sub nsw i32 %add41, 204, !dbg !1440
  %idxprom77 = sext i32 %sub76 to i64, !dbg !1441
  %arrayidx78 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom77, !dbg !1441
  store float %13, float* %arrayidx78, align 4, !dbg !1442
  %add79 = add nsw i32 %add41, 204, !dbg !1443
  %idxprom80 = sext i32 %add79 to i64, !dbg !1444
  %arrayidx81 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom80, !dbg !1444
  %14 = load float, float* %arrayidx81, align 4, !dbg !1444
  %idxprom82 = sext i32 %add41 to i64, !dbg !1445
  %arrayidx83 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom82, !dbg !1445
  store float %14, float* %arrayidx83, align 4, !dbg !1446
  %cmp84 = icmp slt i32 %k.0, %sub2, !dbg !1447
  br i1 %cmp84, label %if.then85, label %if.end91, !dbg !1449

if.then85:                                        ; preds = %if.then71
  %idxprom86 = sext i32 %add73 to i64, !dbg !1450
  %arrayidx87 = getelementptr inbounds float, float* %d_u1, i64 %idxprom86, !dbg !1450
  %15 = load float, float* %arrayidx87, align 4, !dbg !1450
  %add88 = add nsw i32 %add41, 204, !dbg !1451
  %idxprom89 = sext i32 %add88 to i64, !dbg !1452
  %arrayidx90 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom89, !dbg !1452
  store float %15, float* %arrayidx90, align 4, !dbg !1453
  br label %if.end91, !dbg !1452

if.end91:                                         ; preds = %if.then85, %if.then71
  br label %if.end92, !dbg !1454

if.end92:                                         ; preds = %if.end91, %for.body
  %indg.1 = phi i32 [ %add73, %if.end91 ], [ %indg.0, %for.body ], !dbg !1311
  %indg0.1 = phi i32 [ %indg.0, %if.end91 ], [ %indg0.0, %for.body ]
  call void @llvm.dbg.value(metadata i32 %indg0.1, metadata !1426, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i32 %indg.1, metadata !1403, metadata !DIExpression()), !dbg !1311
  %tobool93 = icmp ne i32 %halo.0, 0, !dbg !1455
  br i1 %tobool93, label %if.then94, label %if.end115, !dbg !1457

if.then94:                                        ; preds = %if.end92
  call void @llvm.dbg.value(metadata i32 %NY, metadata !1352, metadata !DIExpression()), !dbg !1458
  call void @llvm.dbg.value(metadata i32 %pitch, metadata !1358, metadata !DIExpression()), !dbg !1458
  %16 = call i32 @llvm.nvvm.mul24.i(i32 %NY, i32 %pitch) #11, !dbg !1461
  %add96 = add nsw i32 %indg_h.1, %16, !dbg !1462
  call void @llvm.dbg.value(metadata i32 %add96, metadata !1374, metadata !DIExpression()), !dbg !1311
  %idxprom97 = sext i32 %ind_h.0 to i64, !dbg !1463
  %arrayidx98 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom97, !dbg !1463
  %17 = load float, float* %arrayidx98, align 4, !dbg !1463
  %sub99 = sub nsw i32 %ind_h.0, 204, !dbg !1464
  %idxprom100 = sext i32 %sub99 to i64, !dbg !1465
  %arrayidx101 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom100, !dbg !1465
  store float %17, float* %arrayidx101, align 4, !dbg !1466
  %add102 = add nsw i32 %ind_h.0, 204, !dbg !1467
  %idxprom103 = sext i32 %add102 to i64, !dbg !1468
  %arrayidx104 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom103, !dbg !1468
  %18 = load float, float* %arrayidx104, align 4, !dbg !1468
  %idxprom105 = sext i32 %ind_h.0 to i64, !dbg !1469
  %arrayidx106 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom105, !dbg !1469
  store float %18, float* %arrayidx106, align 4, !dbg !1470
  %cmp107 = icmp slt i32 %k.0, %sub2, !dbg !1471
  br i1 %cmp107, label %if.then108, label %if.end114, !dbg !1473

if.then108:                                       ; preds = %if.then94
  %idxprom109 = sext i32 %add96 to i64, !dbg !1474
  %arrayidx110 = getelementptr inbounds float, float* %d_u1, i64 %idxprom109, !dbg !1474
  %19 = load float, float* %arrayidx110, align 4, !dbg !1474
  %add111 = add nsw i32 %ind_h.0, 204, !dbg !1475
  %idxprom112 = sext i32 %add111 to i64, !dbg !1476
  %arrayidx113 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom112, !dbg !1476
  store float %19, float* %arrayidx113, align 4, !dbg !1477
  br label %if.end114, !dbg !1476

if.end114:                                        ; preds = %if.then108, %if.then94
  br label %if.end115, !dbg !1478

if.end115:                                        ; preds = %if.end114, %if.end92
  %indg_h.2 = phi i32 [ %add96, %if.end114 ], [ %indg_h.1, %if.end92 ], !dbg !1311
  call void @llvm.dbg.value(metadata i32 %indg_h.2, metadata !1374, metadata !DIExpression()), !dbg !1311
  %tobool116 = icmp ne i32 %conv54, 0, !dbg !1479
  br i1 %tobool116, label %if.then117, label %if.end159, !dbg !1481

if.then117:                                       ; preds = %if.end115
  %cmp118 = icmp eq i32 %add44, 0, !dbg !1482
  br i1 %cmp118, label %if.then128, label %lor.lhs.false, !dbg !1485

lor.lhs.false:                                    ; preds = %if.then117
  %cmp119 = icmp eq i32 %add44, %sub, !dbg !1486
  br i1 %cmp119, label %if.then128, label %lor.lhs.false120, !dbg !1487

lor.lhs.false120:                                 ; preds = %lor.lhs.false
  %cmp121 = icmp eq i32 %add47, 0, !dbg !1488
  br i1 %cmp121, label %if.then128, label %lor.lhs.false122, !dbg !1489

lor.lhs.false122:                                 ; preds = %lor.lhs.false120
  %cmp123 = icmp eq i32 %add47, %sub1, !dbg !1490
  br i1 %cmp123, label %if.then128, label %lor.lhs.false124, !dbg !1491

lor.lhs.false124:                                 ; preds = %lor.lhs.false122
  %cmp125 = icmp eq i32 %k.0, 0, !dbg !1492
  br i1 %cmp125, label %if.then128, label %lor.lhs.false126, !dbg !1493

lor.lhs.false126:                                 ; preds = %lor.lhs.false124
  %cmp127 = icmp eq i32 %k.0, %sub2, !dbg !1494
  br i1 %cmp127, label %if.then128, label %if.else131, !dbg !1495

if.then128:                                       ; preds = %lor.lhs.false126, %lor.lhs.false124, %lor.lhs.false122, %lor.lhs.false120, %lor.lhs.false, %if.then117
  %idxprom129 = sext i32 %add41 to i64, !dbg !1496
  %arrayidx130 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom129, !dbg !1496
  %20 = load float, float* %arrayidx130, align 4, !dbg !1496
  call void @llvm.dbg.value(metadata float %20, metadata !1498, metadata !DIExpression()), !dbg !1311
  br label %if.end156, !dbg !1499

if.else131:                                       ; preds = %lor.lhs.false126
  %sub132 = sub nsw i32 %add41, 1, !dbg !1500
  %idxprom133 = sext i32 %sub132 to i64, !dbg !1502
  %arrayidx134 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom133, !dbg !1502
  %21 = load float, float* %arrayidx134, align 4, !dbg !1502
  %add135 = add nsw i32 %add41, 1, !dbg !1503
  %idxprom136 = sext i32 %add135 to i64, !dbg !1504
  %arrayidx137 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom136, !dbg !1504
  %22 = load float, float* %arrayidx137, align 4, !dbg !1504
  %add138 = fadd contract float %21, %22, !dbg !1505
  %sub139 = sub nsw i32 %add41, 34, !dbg !1506
  %idxprom140 = sext i32 %sub139 to i64, !dbg !1507
  %arrayidx141 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom140, !dbg !1507
  %23 = load float, float* %arrayidx141, align 4, !dbg !1507
  %add142 = fadd contract float %add138, %23, !dbg !1508
  %add143 = add nsw i32 %add41, 34, !dbg !1509
  %idxprom144 = sext i32 %add143 to i64, !dbg !1510
  %arrayidx145 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom144, !dbg !1510
  %24 = load float, float* %arrayidx145, align 4, !dbg !1510
  %add146 = fadd contract float %add142, %24, !dbg !1511
  %sub147 = sub nsw i32 %add41, 204, !dbg !1512
  %idxprom148 = sext i32 %sub147 to i64, !dbg !1513
  %arrayidx149 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom148, !dbg !1513
  %25 = load float, float* %arrayidx149, align 4, !dbg !1513
  %add150 = fadd contract float %add146, %25, !dbg !1514
  %add151 = add nsw i32 %add41, 204, !dbg !1515
  %idxprom152 = sext i32 %add151 to i64, !dbg !1516
  %arrayidx153 = getelementptr inbounds [612 x float], [612 x float]* %sharedMem0, i64 0, i64 %idxprom152, !dbg !1516
  %26 = load float, float* %arrayidx153, align 4, !dbg !1516
  %add154 = fadd contract float %add150, %26, !dbg !1517
  %mul155 = fmul contract float %add154, 0x3FC5555560000000, !dbg !1518
  call void @llvm.dbg.value(metadata float %mul155, metadata !1498, metadata !DIExpression()), !dbg !1311
  br label %if.end156

if.end156:                                        ; preds = %if.else131, %if.then128
  %u2.0 = phi float [ %20, %if.then128 ], [ %mul155, %if.else131 ], !dbg !1519
  call void @llvm.dbg.value(metadata float %u2.0, metadata !1498, metadata !DIExpression()), !dbg !1311
  %idxprom157 = sext i32 %indg0.1 to i64, !dbg !1520
  %arrayidx158 = getelementptr inbounds float, float* %d_u2, i64 %idxprom157, !dbg !1520
  store float %u2.0, float* %arrayidx158, align 4, !dbg !1521
  br label %if.end159, !dbg !1522

if.end159:                                        ; preds = %if.end156, %if.end115
  br label %for.inc, !dbg !1523

for.inc:                                          ; preds = %if.end159
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1524
  call void @llvm.dbg.value(metadata i32 %inc, metadata !1326, metadata !DIExpression()), !dbg !1311
  br label %for.cond, !dbg !1525, !llvm.loop !1526

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1528
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #0

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { nounwind readnone }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind }
attributes #9 = { convergent noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!9, !605}
!nvvm.annotations = !{!664, !665, !666, !665, !667, !667, !667, !667, !668, !668, !667}
!llvm.ident = !{!669, !669}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!670}
!llvm.module.flags = !{!671, !672, !673, !674, !675}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression(DW_OP_constu, 8, DW_OP_swap, DW_OP_xderef))
!1 = distinct !DIGlobalVariable(name: "u1", scope: !2, file: !3, line: 44, type: !602, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "GPU_laplace3d", linkageName: "_Z13GPU_laplace3diiiiPfS_", scope: !3, file: !3, line: 26, type: !4, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !11)
!3 = !DIFile(filename: "./laplace3d_kernel.cu", directory: "/u/ah7226/xstack-benchmark/ispass-2009/LPS")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6, !6, !6, !6, !7, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!9 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !10, producer: "clang version 9.0.0 (https://github.com/yebinchon/llvm-project a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !11, globals: !12, imports: !13, nameTableKind: None)
!10 = !DIFile(filename: "laplace3d.cu", directory: "/u/ah7226/xstack-benchmark/ispass-2009/LPS")
!11 = !{}
!12 = !{!0}
!13 = !{!14, !20, !24, !26, !28, !30, !32, !36, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !68, !70, !72, !74, !78, !83, !85, !87, !92, !96, !98, !100, !102, !104, !106, !108, !110, !112, !117, !121, !123, !128, !132, !134, !136, !138, !140, !142, !146, !148, !150, !154, !162, !166, !168, !170, !172, !174, !178, !180, !182, !186, !188, !190, !192, !194, !196, !198, !200, !202, !204, !208, !214, !216, !218, !222, !224, !226, !228, !230, !232, !234, !236, !240, !244, !246, !248, !253, !255, !257, !259, !261, !263, !265, !269, !275, !279, !284, !286, !290, !294, !308, !312, !316, !320, !324, !329, !331, !335, !339, !343, !351, !355, !359, !363, !367, !372, !378, !382, !386, !388, !396, !400, !407, !409, !411, !415, !419, !423, !428, !432, !437, !438, !439, !440, !442, !443, !444, !445, !446, !447, !448, !450, !451, !452, !453, !454, !458, !459, !460, !461, !462, !463, !464, !465, !466, !467, !468, !469, !470, !471, !472, !473, !474, !475, !476, !477, !478, !479, !480, !481, !482, !486, !488, !490, !492, !494, !496, !498, !500, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !595, !597}
!14 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !16, file: !17, line: 223)
!15 = !DINamespace(name: "std", scope: null)
!16 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !17, file: !17, line: 53, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!17 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/__clang_cuda_math_forward_declares.h", directory: "")
!18 = !DISubroutineType(types: !19)
!19 = !{!6, !6}
!20 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !21, file: !17, line: 224)
!21 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !17, file: !17, line: 55, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!22 = !DISubroutineType(types: !23)
!23 = !{!8, !8}
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !25, file: !17, line: 225)
!25 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !17, file: !17, line: 57, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!26 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !27, file: !17, line: 226)
!27 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !17, file: !17, line: 59, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!28 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !29, file: !17, line: 227)
!29 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !17, file: !17, line: 61, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !31, file: !17, line: 228)
!31 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !17, file: !17, line: 65, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !33, file: !17, line: 229)
!33 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !17, file: !17, line: 63, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!34 = !DISubroutineType(types: !35)
!35 = !{!8, !8, !8}
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !37, file: !17, line: 230)
!37 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !17, file: !17, line: 67, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !39, file: !17, line: 231)
!39 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !17, file: !17, line: 69, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !41, file: !17, line: 232)
!41 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !17, file: !17, line: 71, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !43, file: !17, line: 233)
!43 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !17, file: !17, line: 73, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !45, file: !17, line: 234)
!45 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !17, file: !17, line: 75, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !47, file: !17, line: 235)
!47 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !17, file: !17, line: 77, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !49, file: !17, line: 236)
!49 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !17, file: !17, line: 81, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !51, file: !17, line: 237)
!51 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !17, file: !17, line: 79, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !53, file: !17, line: 238)
!53 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !17, file: !17, line: 85, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !55, file: !17, line: 239)
!55 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !17, file: !17, line: 83, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !57, file: !17, line: 240)
!57 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !17, file: !17, line: 87, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !59, file: !17, line: 241)
!59 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !17, file: !17, line: 89, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !61, file: !17, line: 242)
!61 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !17, file: !17, line: 91, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !63, file: !17, line: 243)
!63 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !17, file: !17, line: 93, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !65, file: !17, line: 244)
!65 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !17, file: !17, line: 95, type: !66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!66 = !DISubroutineType(types: !67)
!67 = !{!8, !8, !8, !8}
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !69, file: !17, line: 245)
!69 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !17, file: !17, line: 97, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !71, file: !17, line: 246)
!71 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !17, file: !17, line: 99, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !73, file: !17, line: 247)
!73 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !17, file: !17, line: 101, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !75, file: !17, line: 248)
!75 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !17, file: !17, line: 103, type: !76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!76 = !DISubroutineType(types: !77)
!77 = !{!6, !8}
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !79, file: !17, line: 249)
!79 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !17, file: !17, line: 105, type: !80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!80 = !DISubroutineType(types: !81)
!81 = !{!8, !8, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !84, file: !17, line: 250)
!84 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !17, file: !17, line: 107, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !86, file: !17, line: 251)
!86 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !17, file: !17, line: 109, type: !76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !88, file: !17, line: 252)
!88 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !17, file: !17, line: 114, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !8}
!91 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !93, file: !17, line: 253)
!93 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !17, file: !17, line: 118, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!94 = !DISubroutineType(types: !95)
!95 = !{!91, !8, !8}
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !97, file: !17, line: 254)
!97 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !17, file: !17, line: 117, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !99, file: !17, line: 255)
!99 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !17, file: !17, line: 123, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !101, file: !17, line: 256)
!101 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !17, file: !17, line: 127, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !103, file: !17, line: 257)
!103 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !17, file: !17, line: 126, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !105, file: !17, line: 258)
!105 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !17, file: !17, line: 129, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !107, file: !17, line: 259)
!107 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !17, file: !17, line: 134, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !109, file: !17, line: 260)
!109 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !17, file: !17, line: 136, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !111, file: !17, line: 261)
!111 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !17, file: !17, line: 138, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !113, file: !17, line: 262)
!113 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !17, file: !17, line: 139, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!114 = !DISubroutineType(types: !115)
!115 = !{!116, !116}
!116 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !118, file: !17, line: 263)
!118 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !17, file: !17, line: 141, type: !119, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!119 = !DISubroutineType(types: !120)
!120 = !{!8, !8, !6}
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !122, file: !17, line: 264)
!122 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !17, file: !17, line: 143, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !124, file: !17, line: 265)
!124 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !17, file: !17, line: 144, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!125 = !DISubroutineType(types: !126)
!126 = !{!127, !127}
!127 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !129, file: !17, line: 266)
!129 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !17, file: !17, line: 146, type: !130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!130 = !DISubroutineType(types: !131)
!131 = !{!127, !8}
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !133, file: !17, line: 267)
!133 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !17, file: !17, line: 159, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !135, file: !17, line: 268)
!135 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !17, file: !17, line: 148, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !137, file: !17, line: 269)
!137 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !17, file: !17, line: 150, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !139, file: !17, line: 270)
!139 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !17, file: !17, line: 152, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !141, file: !17, line: 271)
!141 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !17, file: !17, line: 154, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !143, file: !17, line: 272)
!143 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !17, file: !17, line: 161, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!144 = !DISubroutineType(types: !145)
!145 = !{!116, !8}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !147, file: !17, line: 273)
!147 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !17, file: !17, line: 163, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !149, file: !17, line: 274)
!149 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !17, file: !17, line: 164, type: !130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !151, file: !17, line: 275)
!151 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !17, file: !17, line: 166, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!152 = !DISubroutineType(types: !153)
!153 = !{!8, !8, !7}
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !155, file: !17, line: 276)
!155 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !17, file: !17, line: 167, type: !156, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!156 = !DISubroutineType(types: !157)
!157 = !{!158, !159}
!158 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !161)
!161 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !163, file: !17, line: 277)
!163 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !17, file: !17, line: 168, type: !164, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!164 = !DISubroutineType(types: !165)
!165 = !{!8, !159}
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !167, file: !17, line: 278)
!167 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !17, file: !17, line: 170, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !169, file: !17, line: 279)
!169 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !17, file: !17, line: 172, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !171, file: !17, line: 280)
!171 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !17, file: !17, line: 176, type: !119, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !173, file: !17, line: 281)
!173 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !17, file: !17, line: 178, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !175, file: !17, line: 282)
!175 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !17, file: !17, line: 180, type: !176, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!176 = !DISubroutineType(types: !177)
!177 = !{!8, !8, !8, !82}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !179, file: !17, line: 283)
!179 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !17, file: !17, line: 182, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !181, file: !17, line: 284)
!181 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !17, file: !17, line: 184, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !183, file: !17, line: 285)
!183 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !17, file: !17, line: 186, type: !184, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!184 = !DISubroutineType(types: !185)
!185 = !{!8, !8, !116}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !187, file: !17, line: 286)
!187 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !17, file: !17, line: 188, type: !119, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !189, file: !17, line: 287)
!189 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !17, file: !17, line: 190, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !191, file: !17, line: 288)
!191 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !17, file: !17, line: 192, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !193, file: !17, line: 289)
!193 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !17, file: !17, line: 194, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !195, file: !17, line: 290)
!195 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !17, file: !17, line: 196, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !197, file: !17, line: 291)
!197 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !17, file: !17, line: 198, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !199, file: !17, line: 292)
!199 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !17, file: !17, line: 200, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !201, file: !17, line: 293)
!201 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !17, file: !17, line: 202, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !203, file: !17, line: 294)
!203 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !17, file: !17, line: 204, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !205, file: !207, line: 52)
!205 = !DISubprogram(name: "abs", scope: !206, file: !206, line: 840, type: !18, flags: DIFlagPrototyped, spFlags: 0)
!206 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!207 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !209, file: !213, line: 83)
!209 = !DISubprogram(name: "acos", scope: !210, file: !210, line: 53, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!210 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!211 = !DISubroutineType(types: !212)
!212 = !{!158, !158}
!213 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cmath", directory: "")
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !215, file: !213, line: 102)
!215 = !DISubprogram(name: "asin", scope: !210, file: !210, line: 55, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !217, file: !213, line: 121)
!217 = !DISubprogram(name: "atan", scope: !210, file: !210, line: 57, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !219, file: !213, line: 140)
!219 = !DISubprogram(name: "atan2", scope: !210, file: !210, line: 59, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DISubroutineType(types: !221)
!221 = !{!158, !158, !158}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !223, file: !213, line: 161)
!223 = !DISubprogram(name: "ceil", scope: !210, file: !210, line: 159, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !225, file: !213, line: 180)
!225 = !DISubprogram(name: "cos", scope: !210, file: !210, line: 62, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !227, file: !213, line: 199)
!227 = !DISubprogram(name: "cosh", scope: !210, file: !210, line: 71, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !229, file: !213, line: 218)
!229 = !DISubprogram(name: "exp", scope: !210, file: !210, line: 95, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !231, file: !213, line: 237)
!231 = !DISubprogram(name: "fabs", scope: !210, file: !210, line: 162, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !233, file: !213, line: 256)
!233 = !DISubprogram(name: "floor", scope: !210, file: !210, line: 165, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !235, file: !213, line: 275)
!235 = !DISubprogram(name: "fmod", scope: !210, file: !210, line: 168, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !237, file: !213, line: 296)
!237 = !DISubprogram(name: "frexp", scope: !210, file: !210, line: 98, type: !238, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DISubroutineType(types: !239)
!239 = !{!158, !158, !82}
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !241, file: !213, line: 315)
!241 = !DISubprogram(name: "ldexp", scope: !210, file: !210, line: 101, type: !242, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DISubroutineType(types: !243)
!243 = !{!158, !158, !6}
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !245, file: !213, line: 334)
!245 = !DISubprogram(name: "log", scope: !210, file: !210, line: 104, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !247, file: !213, line: 353)
!247 = !DISubprogram(name: "log10", scope: !210, file: !210, line: 107, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !249, file: !213, line: 372)
!249 = !DISubprogram(name: "modf", scope: !210, file: !210, line: 110, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!250 = !DISubroutineType(types: !251)
!251 = !{!158, !158, !252}
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !254, file: !213, line: 384)
!254 = !DISubprogram(name: "pow", scope: !210, file: !210, line: 140, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !256, file: !213, line: 421)
!256 = !DISubprogram(name: "sin", scope: !210, file: !210, line: 64, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !258, file: !213, line: 440)
!258 = !DISubprogram(name: "sinh", scope: !210, file: !210, line: 73, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !260, file: !213, line: 459)
!260 = !DISubprogram(name: "sqrt", scope: !210, file: !210, line: 143, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !262, file: !213, line: 478)
!262 = !DISubprogram(name: "tan", scope: !210, file: !210, line: 66, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !264, file: !213, line: 497)
!264 = !DISubprogram(name: "tanh", scope: !210, file: !210, line: 75, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !266, file: !268, line: 127)
!266 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !206, line: 62, baseType: !267)
!267 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !206, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!268 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cstdlib", directory: "")
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !270, file: !268, line: 128)
!270 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !206, line: 70, baseType: !271)
!271 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !206, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !272, identifier: "_ZTS6ldiv_t")
!272 = !{!273, !274}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !271, file: !206, line: 68, baseType: !116, size: 64)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !271, file: !206, line: 69, baseType: !116, size: 64, offset: 64)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !276, file: !268, line: 130)
!276 = !DISubprogram(name: "abort", scope: !206, file: !206, line: 591, type: !277, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!277 = !DISubroutineType(types: !278)
!278 = !{null}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !280, file: !268, line: 134)
!280 = !DISubprogram(name: "atexit", scope: !206, file: !206, line: 595, type: !281, flags: DIFlagPrototyped, spFlags: 0)
!281 = !DISubroutineType(types: !282)
!282 = !{!6, !283}
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !285, file: !268, line: 140)
!285 = !DISubprogram(name: "atof", scope: !206, file: !206, line: 101, type: !156, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !287, file: !268, line: 141)
!287 = !DISubprogram(name: "atoi", scope: !206, file: !206, line: 104, type: !288, flags: DIFlagPrototyped, spFlags: 0)
!288 = !DISubroutineType(types: !289)
!289 = !{!6, !159}
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !291, file: !268, line: 142)
!291 = !DISubprogram(name: "atol", scope: !206, file: !206, line: 107, type: !292, flags: DIFlagPrototyped, spFlags: 0)
!292 = !DISubroutineType(types: !293)
!293 = !{!116, !159}
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !295, file: !268, line: 143)
!295 = !DISubprogram(name: "bsearch", scope: !206, file: !206, line: 820, type: !296, flags: DIFlagPrototyped, spFlags: 0)
!296 = !DISubroutineType(types: !297)
!297 = !{!298, !299, !299, !301, !301, !304}
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !300, size: 64)
!300 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !302, line: 46, baseType: !303)
!302 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/stddef.h", directory: "")
!303 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !206, line: 808, baseType: !305)
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !306, size: 64)
!306 = !DISubroutineType(types: !307)
!307 = !{!6, !299, !299}
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !309, file: !268, line: 144)
!309 = !DISubprogram(name: "calloc", scope: !206, file: !206, line: 542, type: !310, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DISubroutineType(types: !311)
!311 = !{!298, !301, !301}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !313, file: !268, line: 145)
!313 = !DISubprogram(name: "div", scope: !206, file: !206, line: 852, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!314 = !DISubroutineType(types: !315)
!315 = !{!266, !6, !6}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !317, file: !268, line: 146)
!317 = !DISubprogram(name: "exit", scope: !206, file: !206, line: 617, type: !318, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!318 = !DISubroutineType(types: !319)
!319 = !{null, !6}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !321, file: !268, line: 147)
!321 = !DISubprogram(name: "free", scope: !206, file: !206, line: 565, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !298}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !325, file: !268, line: 148)
!325 = !DISubprogram(name: "getenv", scope: !206, file: !206, line: 634, type: !326, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DISubroutineType(types: !327)
!327 = !{!328, !159}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !330, file: !268, line: 149)
!330 = !DISubprogram(name: "labs", scope: !206, file: !206, line: 841, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !332, file: !268, line: 150)
!332 = !DISubprogram(name: "ldiv", scope: !206, file: !206, line: 854, type: !333, flags: DIFlagPrototyped, spFlags: 0)
!333 = !DISubroutineType(types: !334)
!334 = !{!270, !116, !116}
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !336, file: !268, line: 151)
!336 = !DISubprogram(name: "malloc", scope: !206, file: !206, line: 539, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!337 = !DISubroutineType(types: !338)
!338 = !{!298, !301}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !340, file: !268, line: 153)
!340 = !DISubprogram(name: "mblen", scope: !206, file: !206, line: 922, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DISubroutineType(types: !342)
!342 = !{!6, !159, !301}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !344, file: !268, line: 154)
!344 = !DISubprogram(name: "mbstowcs", scope: !206, file: !206, line: 933, type: !345, flags: DIFlagPrototyped, spFlags: 0)
!345 = !DISubroutineType(types: !346)
!346 = !{!301, !347, !350, !301}
!347 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !348)
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 64)
!349 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!350 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !159)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !352, file: !268, line: 155)
!352 = !DISubprogram(name: "mbtowc", scope: !206, file: !206, line: 925, type: !353, flags: DIFlagPrototyped, spFlags: 0)
!353 = !DISubroutineType(types: !354)
!354 = !{!6, !347, !350, !301}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !356, file: !268, line: 157)
!356 = !DISubprogram(name: "qsort", scope: !206, file: !206, line: 830, type: !357, flags: DIFlagPrototyped, spFlags: 0)
!357 = !DISubroutineType(types: !358)
!358 = !{null, !298, !301, !301, !304}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !360, file: !268, line: 163)
!360 = !DISubprogram(name: "rand", scope: !206, file: !206, line: 453, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!361 = !DISubroutineType(types: !362)
!362 = !{!6}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !364, file: !268, line: 164)
!364 = !DISubprogram(name: "realloc", scope: !206, file: !206, line: 550, type: !365, flags: DIFlagPrototyped, spFlags: 0)
!365 = !DISubroutineType(types: !366)
!366 = !{!298, !298, !301}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !368, file: !268, line: 165)
!368 = !DISubprogram(name: "srand", scope: !206, file: !206, line: 455, type: !369, flags: DIFlagPrototyped, spFlags: 0)
!369 = !DISubroutineType(types: !370)
!370 = !{null, !371}
!371 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !373, file: !268, line: 166)
!373 = !DISubprogram(name: "strtod", scope: !206, file: !206, line: 117, type: !374, flags: DIFlagPrototyped, spFlags: 0)
!374 = !DISubroutineType(types: !375)
!375 = !{!158, !350, !376}
!376 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !377)
!377 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 64)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !379, file: !268, line: 167)
!379 = !DISubprogram(name: "strtol", scope: !206, file: !206, line: 176, type: !380, flags: DIFlagPrototyped, spFlags: 0)
!380 = !DISubroutineType(types: !381)
!381 = !{!116, !350, !376, !6}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !383, file: !268, line: 168)
!383 = !DISubprogram(name: "strtoul", scope: !206, file: !206, line: 180, type: !384, flags: DIFlagPrototyped, spFlags: 0)
!384 = !DISubroutineType(types: !385)
!385 = !{!303, !350, !376, !6}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !387, file: !268, line: 169)
!387 = !DISubprogram(name: "system", scope: !206, file: !206, line: 784, type: !288, flags: DIFlagPrototyped, spFlags: 0)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !389, file: !268, line: 171)
!389 = !DISubprogram(name: "wcstombs", scope: !206, file: !206, line: 936, type: !390, flags: DIFlagPrototyped, spFlags: 0)
!390 = !DISubroutineType(types: !391)
!391 = !{!301, !392, !393, !301}
!392 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !328)
!393 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !394)
!394 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !395, size: 64)
!395 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !349)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !397, file: !268, line: 172)
!397 = !DISubprogram(name: "wctomb", scope: !206, file: !206, line: 929, type: !398, flags: DIFlagPrototyped, spFlags: 0)
!398 = !DISubroutineType(types: !399)
!399 = !{!6, !328, !349}
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !402, file: !268, line: 200)
!401 = !DINamespace(name: "__gnu_cxx", scope: null)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !206, line: 80, baseType: !403)
!403 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !206, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !404, identifier: "_ZTS7lldiv_t")
!404 = !{!405, !406}
!405 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !403, file: !206, line: 78, baseType: !127, size: 64)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !403, file: !206, line: 79, baseType: !127, size: 64, offset: 64)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !408, file: !268, line: 206)
!408 = !DISubprogram(name: "_Exit", scope: !206, file: !206, line: 629, type: !318, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !410, file: !268, line: 210)
!410 = !DISubprogram(name: "llabs", scope: !206, file: !206, line: 844, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !412, file: !268, line: 216)
!412 = !DISubprogram(name: "lldiv", scope: !206, file: !206, line: 858, type: !413, flags: DIFlagPrototyped, spFlags: 0)
!413 = !DISubroutineType(types: !414)
!414 = !{!402, !127, !127}
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !416, file: !268, line: 227)
!416 = !DISubprogram(name: "atoll", scope: !206, file: !206, line: 112, type: !417, flags: DIFlagPrototyped, spFlags: 0)
!417 = !DISubroutineType(types: !418)
!418 = !{!127, !159}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !420, file: !268, line: 228)
!420 = !DISubprogram(name: "strtoll", scope: !206, file: !206, line: 200, type: !421, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DISubroutineType(types: !422)
!422 = !{!127, !350, !376, !6}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !424, file: !268, line: 229)
!424 = !DISubprogram(name: "strtoull", scope: !206, file: !206, line: 205, type: !425, flags: DIFlagPrototyped, spFlags: 0)
!425 = !DISubroutineType(types: !426)
!426 = !{!427, !350, !376, !6}
!427 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !429, file: !268, line: 231)
!429 = !DISubprogram(name: "strtof", scope: !206, file: !206, line: 123, type: !430, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DISubroutineType(types: !431)
!431 = !{!8, !350, !376}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !433, file: !268, line: 232)
!433 = !DISubprogram(name: "strtold", scope: !206, file: !206, line: 126, type: !434, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DISubroutineType(types: !435)
!435 = !{!436, !350, !376}
!436 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !402, file: !268, line: 240)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !408, file: !268, line: 242)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !410, file: !268, line: 244)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !441, file: !268, line: 245)
!441 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !401, file: !268, line: 213, type: !413, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !412, file: !268, line: 246)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !416, file: !268, line: 248)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !429, file: !268, line: 249)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !420, file: !268, line: 250)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !424, file: !268, line: 251)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !433, file: !268, line: 252)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !276, file: !449, line: 38)
!449 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/stdlib.h", directory: "")
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !280, file: !449, line: 39)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !317, file: !449, line: 40)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !266, file: !449, line: 51)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !270, file: !449, line: 52)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !455, file: !449, line: 54)
!455 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !15, file: !207, line: 79, type: !456, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DISubroutineType(types: !457)
!457 = !{!436, !436}
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !285, file: !449, line: 55)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !287, file: !449, line: 56)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !291, file: !449, line: 57)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !295, file: !449, line: 58)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !309, file: !449, line: 59)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !441, file: !449, line: 60)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !321, file: !449, line: 61)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !325, file: !449, line: 62)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !330, file: !449, line: 63)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !332, file: !449, line: 64)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !336, file: !449, line: 65)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !340, file: !449, line: 67)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !344, file: !449, line: 68)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !352, file: !449, line: 69)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !356, file: !449, line: 71)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !360, file: !449, line: 72)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !364, file: !449, line: 73)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !368, file: !449, line: 74)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !373, file: !449, line: 75)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !379, file: !449, line: 76)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !383, file: !449, line: 77)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !387, file: !449, line: 78)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !389, file: !449, line: 80)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !397, file: !449, line: 81)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !483, file: !485, line: 414)
!483 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !484, file: !484, line: 1126, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!484 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "")
!485 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/__clang_cuda_cmath.h", directory: "")
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !487, file: !485, line: 415)
!487 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !484, file: !484, line: 1154, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !489, file: !485, line: 416)
!489 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !484, file: !484, line: 1121, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !491, file: !485, line: 417)
!491 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !484, file: !484, line: 1159, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !493, file: !485, line: 418)
!493 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !484, file: !484, line: 1111, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !495, file: !485, line: 419)
!495 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !484, file: !484, line: 1116, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !497, file: !485, line: 420)
!497 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !484, file: !484, line: 1164, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !499, file: !485, line: 421)
!499 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !484, file: !484, line: 1199, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !501, file: !485, line: 422)
!501 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !502, file: !502, line: 647, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!502 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "")
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !504, file: !485, line: 423)
!504 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !484, file: !484, line: 973, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !506, file: !485, line: 424)
!506 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !484, file: !484, line: 1027, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !508, file: !485, line: 425)
!508 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !484, file: !484, line: 1096, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !510, file: !485, line: 426)
!510 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !484, file: !484, line: 1259, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !512, file: !485, line: 427)
!512 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !484, file: !484, line: 1249, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !514, file: !485, line: 428)
!514 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !502, file: !502, line: 637, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !516, file: !485, line: 429)
!516 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !484, file: !484, line: 1078, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !518, file: !485, line: 430)
!518 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !484, file: !484, line: 1169, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !520, file: !485, line: 431)
!520 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !502, file: !502, line: 582, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !522, file: !485, line: 432)
!522 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !484, file: !484, line: 1385, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !524, file: !485, line: 433)
!524 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !502, file: !502, line: 572, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !526, file: !485, line: 434)
!526 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !484, file: !484, line: 1337, type: !66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !528, file: !485, line: 435)
!528 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !502, file: !502, line: 602, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !530, file: !485, line: 436)
!530 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !502, file: !502, line: 597, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !532, file: !485, line: 437)
!532 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !484, file: !484, line: 1322, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !534, file: !485, line: 438)
!534 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !484, file: !484, line: 1312, type: !80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !536, file: !485, line: 439)
!536 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !484, file: !484, line: 1174, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !538, file: !485, line: 440)
!538 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !484, file: !484, line: 1390, type: !76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !540, file: !485, line: 441)
!540 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !484, file: !484, line: 1289, type: !119, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !542, file: !485, line: 442)
!542 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !484, file: !484, line: 1284, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !544, file: !485, line: 443)
!544 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !484, file: !484, line: 933, type: !130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !546, file: !485, line: 444)
!546 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !484, file: !484, line: 1371, type: !130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !548, file: !485, line: 445)
!548 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !484, file: !484, line: 1140, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !550, file: !485, line: 446)
!550 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !484, file: !484, line: 1149, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !552, file: !485, line: 447)
!552 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !484, file: !484, line: 1069, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !554, file: !485, line: 448)
!554 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !484, file: !484, line: 1395, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !556, file: !485, line: 449)
!556 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !484, file: !484, line: 1131, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !558, file: !485, line: 450)
!558 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !484, file: !484, line: 924, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !560, file: !485, line: 451)
!560 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !484, file: !484, line: 1376, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !562, file: !485, line: 452)
!562 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !484, file: !484, line: 1317, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !564, file: !485, line: 453)
!564 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !484, file: !484, line: 938, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !566, file: !485, line: 454)
!566 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !484, file: !484, line: 1002, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !568, file: !485, line: 455)
!568 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !484, file: !484, line: 1352, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !570, file: !485, line: 456)
!570 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !484, file: !484, line: 1327, type: !34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !572, file: !485, line: 457)
!572 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !484, file: !484, line: 1332, type: !176, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !574, file: !485, line: 458)
!574 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !484, file: !484, line: 919, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !576, file: !485, line: 459)
!576 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !484, file: !484, line: 1366, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !578, file: !485, line: 462)
!578 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !484, file: !484, line: 1299, type: !184, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !580, file: !485, line: 464)
!580 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !484, file: !484, line: 1294, type: !119, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !582, file: !485, line: 465)
!582 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !484, file: !484, line: 1018, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !584, file: !485, line: 466)
!584 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !484, file: !484, line: 1101, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !586, file: !485, line: 467)
!586 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !502, file: !502, line: 887, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !588, file: !485, line: 468)
!588 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !484, file: !484, line: 1060, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !590, file: !485, line: 469)
!590 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !484, file: !484, line: 1106, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !592, file: !485, line: 470)
!592 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !484, file: !484, line: 1361, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !594, file: !485, line: 471)
!594 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !502, file: !502, line: 642, type: !22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !455, file: !596, line: 38)
!596 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/math.h", directory: "")
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !9, entity: !598, file: !596, line: 54)
!598 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !15, file: !213, line: 380, type: !599, flags: DIFlagPrototyped, spFlags: 0)
!599 = !DISubroutineType(types: !600)
!600 = !{!436, !436, !601}
!601 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !436, size: 64)
!602 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 19584, elements: !603)
!603 = !{!604}
!604 = !DISubrange(count: 612)
!605 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !10, producer: "clang version 9.0.0 (https://github.com/yebinchon/llvm-project a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !606, retainedTypes: !615, imports: !618, nameTableKind: None)
!606 = !{!607}
!607 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !608, line: 796, baseType: !371, size: 32, elements: !609, identifier: "_ZTS14cudaMemcpyKind")
!608 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "")
!609 = !{!610, !611, !612, !613, !614}
!610 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!611 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!612 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!613 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!614 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!615 = !{!616, !7, !617, !8}
!616 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!617 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !298, size: 64)
!618 = !{!14, !20, !24, !26, !28, !30, !32, !36, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !68, !70, !72, !74, !78, !83, !85, !87, !92, !96, !98, !100, !102, !104, !106, !108, !110, !112, !117, !121, !123, !128, !132, !134, !136, !138, !140, !142, !146, !148, !150, !154, !162, !166, !168, !170, !172, !174, !178, !180, !182, !186, !188, !190, !192, !194, !196, !198, !200, !202, !204, !208, !214, !216, !218, !222, !224, !226, !228, !230, !232, !234, !236, !240, !244, !246, !248, !253, !255, !257, !259, !261, !263, !265, !269, !275, !279, !284, !286, !290, !294, !308, !312, !316, !320, !324, !329, !331, !335, !339, !343, !351, !355, !359, !363, !367, !372, !378, !382, !386, !388, !396, !400, !407, !409, !411, !415, !419, !423, !428, !619, !437, !438, !439, !440, !442, !443, !444, !445, !446, !624, !625, !626, !627, !628, !629, !630, !634, !635, !636, !637, !638, !639, !640, !641, !642, !643, !644, !645, !646, !647, !648, !649, !650, !651, !652, !653, !654, !655, !656, !657, !482, !486, !488, !490, !492, !494, !496, !498, !500, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !658, !659}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !401, entity: !620, file: !268, line: 232)
!620 = !DISubprogram(name: "strtold", scope: !206, file: !206, line: 126, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!621 = !DISubroutineType(types: !622)
!622 = !{!623, !350, !376}
!623 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !620, file: !268, line: 252)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !276, file: !449, line: 38)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !280, file: !449, line: 39)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !317, file: !449, line: 40)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !266, file: !449, line: 51)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !270, file: !449, line: 52)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !631, file: !449, line: 54)
!631 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !15, file: !207, line: 79, type: !632, flags: DIFlagPrototyped, spFlags: 0)
!632 = !DISubroutineType(types: !633)
!633 = !{!623, !623}
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !285, file: !449, line: 55)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !287, file: !449, line: 56)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !291, file: !449, line: 57)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !295, file: !449, line: 58)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !309, file: !449, line: 59)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !441, file: !449, line: 60)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !321, file: !449, line: 61)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !325, file: !449, line: 62)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !330, file: !449, line: 63)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !332, file: !449, line: 64)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !336, file: !449, line: 65)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !340, file: !449, line: 67)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !344, file: !449, line: 68)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !352, file: !449, line: 69)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !356, file: !449, line: 71)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !360, file: !449, line: 72)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !364, file: !449, line: 73)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !368, file: !449, line: 74)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !373, file: !449, line: 75)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !379, file: !449, line: 76)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !383, file: !449, line: 77)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !387, file: !449, line: 78)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !389, file: !449, line: 80)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !397, file: !449, line: 81)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !631, file: !596, line: 38)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !605, entity: !660, file: !596, line: 54)
!660 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !15, file: !213, line: 380, type: !661, flags: DIFlagPrototyped, spFlags: 0)
!661 = !DISubroutineType(types: !662)
!662 = !{!623, !623, !663}
!663 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !623, size: 64)
!664 = distinct !{null, !"kernel", i32 1}
!665 = !{null, !"align", i32 8}
!666 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!667 = !{null, !"align", i32 16}
!668 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!669 = !{!"clang version 9.0.0 (https://github.com/yebinchon/llvm-project a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!670 = !{i32 1, i32 2}
!671 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!672 = !{i32 2, !"Dwarf Version", i32 2}
!673 = !{i32 2, !"Debug Info Version", i32 3}
!674 = !{i32 1, !"wchar_size", i32 4}
!675 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!676 = distinct !DISubprogram(name: "Gold_laplace3d", linkageName: "_Z14Gold_laplace3diiiPfS_", scope: !10, file: !10, line: 32, type: !677, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !605, retainedNodes: !11)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !6, !6, !6, !7, !7}
!679 = !DILocalVariable(name: "NX", arg: 1, scope: !676, file: !10, line: 32, type: !6)
!680 = !DILocation(line: 0, scope: !676)
!681 = !DILocalVariable(name: "NY", arg: 2, scope: !676, file: !10, line: 32, type: !6)
!682 = !DILocalVariable(name: "NZ", arg: 3, scope: !676, file: !10, line: 32, type: !6)
!683 = !DILocalVariable(name: "u1", arg: 4, scope: !676, file: !10, line: 32, type: !7)
!684 = !DILocalVariable(name: "u2", arg: 5, scope: !676, file: !10, line: 32, type: !7)
!685 = !DILocalVariable(name: "sixth", scope: !676, file: !10, line: 35, type: !8)
!686 = !DILocalVariable(name: "k", scope: !676, file: !10, line: 34, type: !6)
!687 = !DILocation(line: 37, column: 8, scope: !688)
!688 = distinct !DILexicalBlock(scope: !676, file: !10, line: 37, column: 3)
!689 = !DILocation(line: 0, scope: !688)
!690 = !DILocation(line: 37, column: 14, scope: !691)
!691 = distinct !DILexicalBlock(scope: !688, file: !10, line: 37, column: 3)
!692 = !DILocation(line: 37, column: 3, scope: !688)
!693 = !DILocalVariable(name: "j", scope: !676, file: !10, line: 34, type: !6)
!694 = !DILocation(line: 38, column: 10, scope: !695)
!695 = distinct !DILexicalBlock(scope: !696, file: !10, line: 38, column: 5)
!696 = distinct !DILexicalBlock(scope: !691, file: !10, line: 37, column: 24)
!697 = !DILocation(line: 0, scope: !695)
!698 = !DILocation(line: 38, column: 16, scope: !699)
!699 = distinct !DILexicalBlock(scope: !695, file: !10, line: 38, column: 5)
!700 = !DILocation(line: 38, column: 5, scope: !695)
!701 = !DILocalVariable(name: "i", scope: !676, file: !10, line: 34, type: !6)
!702 = !DILocation(line: 39, column: 12, scope: !703)
!703 = distinct !DILexicalBlock(scope: !704, file: !10, line: 39, column: 7)
!704 = distinct !DILexicalBlock(scope: !699, file: !10, line: 38, column: 26)
!705 = !DILocation(line: 0, scope: !703)
!706 = !DILocation(line: 39, column: 18, scope: !707)
!707 = distinct !DILexicalBlock(scope: !703, file: !10, line: 39, column: 7)
!708 = !DILocation(line: 39, column: 7, scope: !703)
!709 = !DILocation(line: 40, column: 13, scope: !710)
!710 = distinct !DILexicalBlock(scope: !707, file: !10, line: 39, column: 28)
!711 = !DILocation(line: 40, column: 10, scope: !710)
!712 = !DILocation(line: 40, column: 20, scope: !710)
!713 = !DILocation(line: 40, column: 23, scope: !710)
!714 = !DILocation(line: 40, column: 17, scope: !710)
!715 = !DILocation(line: 42, column: 14, scope: !716)
!716 = distinct !DILexicalBlock(scope: !710, file: !10, line: 42, column: 13)
!717 = !DILocation(line: 42, column: 18, scope: !716)
!718 = !DILocation(line: 42, column: 26, scope: !716)
!719 = !DILocation(line: 42, column: 22, scope: !716)
!720 = !DILocation(line: 42, column: 29, scope: !716)
!721 = !DILocation(line: 42, column: 33, scope: !716)
!722 = !DILocation(line: 42, column: 37, scope: !716)
!723 = !DILocation(line: 42, column: 45, scope: !716)
!724 = !DILocation(line: 42, column: 41, scope: !716)
!725 = !DILocation(line: 42, column: 47, scope: !716)
!726 = !DILocation(line: 42, column: 51, scope: !716)
!727 = !DILocation(line: 42, column: 55, scope: !716)
!728 = !DILocation(line: 42, column: 63, scope: !716)
!729 = !DILocation(line: 42, column: 59, scope: !716)
!730 = !DILocation(line: 42, column: 13, scope: !710)
!731 = !DILocation(line: 43, column: 21, scope: !732)
!732 = distinct !DILexicalBlock(scope: !716, file: !10, line: 42, column: 67)
!733 = !DILocation(line: 43, column: 11, scope: !732)
!734 = !DILocation(line: 43, column: 19, scope: !732)
!735 = !DILocation(line: 44, column: 9, scope: !732)
!736 = !DILocation(line: 46, column: 29, scope: !737)
!737 = distinct !DILexicalBlock(scope: !716, file: !10, line: 45, column: 14)
!738 = !DILocation(line: 46, column: 23, scope: !737)
!739 = !DILocation(line: 46, column: 45, scope: !737)
!740 = !DILocation(line: 46, column: 39, scope: !737)
!741 = !DILocation(line: 46, column: 37, scope: !737)
!742 = !DILocation(line: 47, column: 29, scope: !737)
!743 = !DILocation(line: 47, column: 23, scope: !737)
!744 = !DILocation(line: 47, column: 21, scope: !737)
!745 = !DILocation(line: 47, column: 45, scope: !737)
!746 = !DILocation(line: 47, column: 39, scope: !737)
!747 = !DILocation(line: 47, column: 37, scope: !737)
!748 = !DILocation(line: 48, column: 32, scope: !737)
!749 = !DILocation(line: 48, column: 29, scope: !737)
!750 = !DILocation(line: 48, column: 23, scope: !737)
!751 = !DILocation(line: 48, column: 21, scope: !737)
!752 = !DILocation(line: 48, column: 48, scope: !737)
!753 = !DILocation(line: 48, column: 45, scope: !737)
!754 = !DILocation(line: 48, column: 39, scope: !737)
!755 = !DILocation(line: 48, column: 37, scope: !737)
!756 = !DILocation(line: 48, column: 55, scope: !737)
!757 = !DILocation(line: 46, column: 11, scope: !737)
!758 = !DILocation(line: 46, column: 19, scope: !737)
!759 = !DILocation(line: 50, column: 7, scope: !710)
!760 = !DILocation(line: 39, column: 24, scope: !707)
!761 = !DILocation(line: 39, column: 7, scope: !707)
!762 = distinct !{!762, !708, !763}
!763 = !DILocation(line: 50, column: 7, scope: !703)
!764 = !DILocation(line: 51, column: 5, scope: !704)
!765 = !DILocation(line: 38, column: 22, scope: !699)
!766 = !DILocation(line: 38, column: 5, scope: !699)
!767 = distinct !{!767, !700, !768}
!768 = !DILocation(line: 51, column: 5, scope: !695)
!769 = !DILocation(line: 52, column: 3, scope: !696)
!770 = !DILocation(line: 37, column: 20, scope: !691)
!771 = !DILocation(line: 37, column: 3, scope: !691)
!772 = distinct !{!772, !692, !773}
!773 = !DILocation(line: 52, column: 3, scope: !688)
!774 = !DILocation(line: 53, column: 1, scope: !676)
!775 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 61, type: !776, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !605, retainedNodes: !11)
!776 = !DISubroutineType(types: !777)
!777 = !{!6, !6, !377}
!778 = !DILocalVariable(name: "argc", arg: 1, scope: !775, file: !10, line: 61, type: !6)
!779 = !DILocation(line: 0, scope: !775)
!780 = !DILocalVariable(name: "argv", arg: 2, scope: !775, file: !10, line: 61, type: !377)
!781 = !DILocalVariable(name: "NX", scope: !775, file: !10, line: 65, type: !6)
!782 = !DILocation(line: 65, column: 10, scope: !775)
!783 = !DILocalVariable(name: "NY", scope: !775, file: !10, line: 65, type: !6)
!784 = !DILocation(line: 65, column: 14, scope: !775)
!785 = !DILocalVariable(name: "NZ", scope: !775, file: !10, line: 65, type: !6)
!786 = !DILocation(line: 65, column: 18, scope: !775)
!787 = !DILocalVariable(name: "REPEAT", scope: !775, file: !10, line: 65, type: !6)
!788 = !DILocation(line: 65, column: 22, scope: !775)
!789 = !DILocalVariable(name: "d_u1", scope: !775, file: !10, line: 73, type: !7)
!790 = !DILocation(line: 73, column: 11, scope: !775)
!791 = !DILocalVariable(name: "d_u2", scope: !775, file: !10, line: 73, type: !7)
!792 = !DILocation(line: 73, column: 18, scope: !775)
!793 = !DILocation(line: 77, column: 7, scope: !775)
!794 = !DILocation(line: 78, column: 5, scope: !795)
!795 = distinct !DILexicalBlock(scope: !796, file: !10, line: 77, column: 41)
!796 = distinct !DILexicalBlock(scope: !775, file: !10, line: 77, column: 7)
!797 = !DILocation(line: 79, column: 5, scope: !795)
!798 = !DILocation(line: 82, column: 7, scope: !799)
!799 = distinct !DILexicalBlock(scope: !775, file: !10, line: 82, column: 7)
!800 = !DILocation(line: 82, column: 7, scope: !775)
!801 = !DILocation(line: 83, column: 9, scope: !802)
!802 = distinct !DILexicalBlock(scope: !803, file: !10, line: 83, column: 9)
!803 = distinct !DILexicalBlock(scope: !799, file: !10, line: 82, column: 48)
!804 = !DILocation(line: 83, column: 12, scope: !802)
!805 = !DILocation(line: 83, column: 9, scope: !803)
!806 = !DILocation(line: 84, column: 7, scope: !807)
!807 = distinct !DILexicalBlock(scope: !802, file: !10, line: 83, column: 20)
!808 = !DILocation(line: 85, column: 7, scope: !807)
!809 = !DILocation(line: 87, column: 3, scope: !803)
!810 = !DILocation(line: 89, column: 8, scope: !799)
!811 = !DILocation(line: 91, column: 7, scope: !812)
!812 = distinct !DILexicalBlock(scope: !775, file: !10, line: 91, column: 7)
!813 = !DILocation(line: 91, column: 7, scope: !775)
!814 = !DILocation(line: 92, column: 9, scope: !815)
!815 = distinct !DILexicalBlock(scope: !816, file: !10, line: 92, column: 9)
!816 = distinct !DILexicalBlock(scope: !812, file: !10, line: 91, column: 45)
!817 = !DILocation(line: 92, column: 12, scope: !815)
!818 = !DILocation(line: 92, column: 9, scope: !816)
!819 = !DILocation(line: 93, column: 7, scope: !820)
!820 = distinct !DILexicalBlock(scope: !815, file: !10, line: 92, column: 20)
!821 = !DILocation(line: 94, column: 7, scope: !820)
!822 = !DILocation(line: 96, column: 3, scope: !816)
!823 = !DILocation(line: 98, column: 8, scope: !812)
!824 = !DILocation(line: 100, column: 8, scope: !825)
!825 = distinct !DILexicalBlock(scope: !775, file: !10, line: 100, column: 8)
!826 = !DILocation(line: 100, column: 8, scope: !775)
!827 = !DILocation(line: 102, column: 9, scope: !828)
!828 = distinct !DILexicalBlock(scope: !829, file: !10, line: 102, column: 9)
!829 = distinct !DILexicalBlock(scope: !825, file: !10, line: 100, column: 46)
!830 = !DILocation(line: 102, column: 12, scope: !828)
!831 = !DILocation(line: 102, column: 9, scope: !829)
!832 = !DILocation(line: 103, column: 7, scope: !833)
!833 = distinct !DILexicalBlock(scope: !828, file: !10, line: 102, column: 20)
!834 = !DILocation(line: 104, column: 7, scope: !833)
!835 = !DILocation(line: 106, column: 3, scope: !829)
!836 = !DILocation(line: 108, column: 8, scope: !825)
!837 = !DILocation(line: 110, column: 8, scope: !838)
!838 = distinct !DILexicalBlock(scope: !775, file: !10, line: 110, column: 8)
!839 = !DILocation(line: 110, column: 8, scope: !775)
!840 = !DILocation(line: 112, column: 9, scope: !841)
!841 = distinct !DILexicalBlock(scope: !842, file: !10, line: 112, column: 9)
!842 = distinct !DILexicalBlock(scope: !838, file: !10, line: 110, column: 54)
!843 = !DILocation(line: 112, column: 16, scope: !841)
!844 = !DILocation(line: 112, column: 9, scope: !842)
!845 = !DILocation(line: 113, column: 7, scope: !846)
!846 = distinct !DILexicalBlock(scope: !841, file: !10, line: 112, column: 23)
!847 = !DILocation(line: 114, column: 7, scope: !846)
!848 = !DILocation(line: 116, column: 3, scope: !842)
!849 = !DILocation(line: 118, column: 12, scope: !838)
!850 = !DILocation(line: 120, column: 47, scope: !775)
!851 = !DILocation(line: 120, column: 51, scope: !775)
!852 = !DILocation(line: 120, column: 55, scope: !775)
!853 = !DILocation(line: 120, column: 3, scope: !775)
!854 = !DILocalVariable(name: "deviceCount", scope: !775, file: !10, line: 123, type: !6)
!855 = !DILocation(line: 123, column: 7, scope: !775)
!856 = !DILocation(line: 124, column: 3, scope: !775)
!857 = !DILocation(line: 125, column: 7, scope: !858)
!858 = distinct !DILexicalBlock(scope: !775, file: !10, line: 125, column: 7)
!859 = !DILocation(line: 125, column: 19, scope: !858)
!860 = !DILocation(line: 125, column: 7, scope: !775)
!861 = !DILocation(line: 126, column: 15, scope: !862)
!862 = distinct !DILexicalBlock(scope: !858, file: !10, line: 125, column: 25)
!863 = !DILocation(line: 126, column: 7, scope: !862)
!864 = !DILocation(line: 127, column: 7, scope: !862)
!865 = !DILocalVariable(name: "dev", scope: !775, file: !10, line: 129, type: !6)
!866 = !DILocation(line: 130, column: 8, scope: !867)
!867 = distinct !DILexicalBlock(scope: !775, file: !10, line: 130, column: 3)
!868 = !DILocation(line: 0, scope: !867)
!869 = !DILocation(line: 130, column: 23, scope: !870)
!870 = distinct !DILexicalBlock(scope: !867, file: !10, line: 130, column: 3)
!871 = !DILocation(line: 130, column: 21, scope: !870)
!872 = !DILocation(line: 130, column: 3, scope: !867)
!873 = !DILocalVariable(name: "deviceProp", scope: !874, file: !10, line: 131, type: !875)
!874 = distinct !DILexicalBlock(scope: !870, file: !10, line: 130, column: 43)
!875 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !608, line: 1257, size: 5056, flags: DIFlagTypePassByValue, elements: !876, identifier: "_ZTS14cudaDeviceProp")
!876 = !{!877, !881, !882, !883, !884, !885, !886, !887, !891, !892, !893, !894, !895, !896, !897, !898, !899, !900, !901, !902, !903, !904, !905, !906, !907, !911, !912, !913, !914, !915, !916, !917, !918, !919, !920, !921, !922, !923, !924, !925, !926, !927, !928, !929, !930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !941, !942, !943, !944, !945, !946, !947}
!877 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !875, file: !608, line: 1259, baseType: !878, size: 2048)
!878 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 2048, elements: !879)
!879 = !{!880}
!880 = !DISubrange(count: 256)
!881 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !875, file: !608, line: 1260, baseType: !301, size: 64, offset: 2048)
!882 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !875, file: !608, line: 1261, baseType: !301, size: 64, offset: 2112)
!883 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !875, file: !608, line: 1262, baseType: !6, size: 32, offset: 2176)
!884 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !875, file: !608, line: 1263, baseType: !6, size: 32, offset: 2208)
!885 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !875, file: !608, line: 1264, baseType: !301, size: 64, offset: 2240)
!886 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !875, file: !608, line: 1265, baseType: !6, size: 32, offset: 2304)
!887 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !875, file: !608, line: 1266, baseType: !888, size: 96, offset: 2336)
!888 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 96, elements: !889)
!889 = !{!890}
!890 = !DISubrange(count: 3)
!891 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !875, file: !608, line: 1267, baseType: !888, size: 96, offset: 2432)
!892 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !875, file: !608, line: 1268, baseType: !6, size: 32, offset: 2528)
!893 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !875, file: !608, line: 1269, baseType: !301, size: 64, offset: 2560)
!894 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !875, file: !608, line: 1270, baseType: !6, size: 32, offset: 2624)
!895 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !875, file: !608, line: 1271, baseType: !6, size: 32, offset: 2656)
!896 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !875, file: !608, line: 1272, baseType: !301, size: 64, offset: 2688)
!897 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !875, file: !608, line: 1273, baseType: !301, size: 64, offset: 2752)
!898 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !875, file: !608, line: 1274, baseType: !6, size: 32, offset: 2816)
!899 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !875, file: !608, line: 1275, baseType: !6, size: 32, offset: 2848)
!900 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !875, file: !608, line: 1276, baseType: !6, size: 32, offset: 2880)
!901 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !875, file: !608, line: 1277, baseType: !6, size: 32, offset: 2912)
!902 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !875, file: !608, line: 1278, baseType: !6, size: 32, offset: 2944)
!903 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !875, file: !608, line: 1279, baseType: !6, size: 32, offset: 2976)
!904 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !875, file: !608, line: 1280, baseType: !6, size: 32, offset: 3008)
!905 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !875, file: !608, line: 1281, baseType: !6, size: 32, offset: 3040)
!906 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !875, file: !608, line: 1282, baseType: !6, size: 32, offset: 3072)
!907 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !875, file: !608, line: 1283, baseType: !908, size: 64, offset: 3104)
!908 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 64, elements: !909)
!909 = !{!910}
!910 = !DISubrange(count: 2)
!911 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !875, file: !608, line: 1284, baseType: !908, size: 64, offset: 3168)
!912 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !875, file: !608, line: 1285, baseType: !888, size: 96, offset: 3232)
!913 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !875, file: !608, line: 1286, baseType: !908, size: 64, offset: 3328)
!914 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !875, file: !608, line: 1287, baseType: !888, size: 96, offset: 3392)
!915 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !875, file: !608, line: 1288, baseType: !888, size: 96, offset: 3488)
!916 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !875, file: !608, line: 1289, baseType: !6, size: 32, offset: 3584)
!917 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !875, file: !608, line: 1290, baseType: !908, size: 64, offset: 3616)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !875, file: !608, line: 1291, baseType: !888, size: 96, offset: 3680)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !875, file: !608, line: 1292, baseType: !908, size: 64, offset: 3776)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !875, file: !608, line: 1293, baseType: !6, size: 32, offset: 3840)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !875, file: !608, line: 1294, baseType: !908, size: 64, offset: 3872)
!922 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !875, file: !608, line: 1295, baseType: !888, size: 96, offset: 3936)
!923 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !875, file: !608, line: 1296, baseType: !908, size: 64, offset: 4032)
!924 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !875, file: !608, line: 1297, baseType: !888, size: 96, offset: 4096)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !875, file: !608, line: 1298, baseType: !6, size: 32, offset: 4192)
!926 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !875, file: !608, line: 1299, baseType: !908, size: 64, offset: 4224)
!927 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !875, file: !608, line: 1300, baseType: !301, size: 64, offset: 4288)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !875, file: !608, line: 1301, baseType: !6, size: 32, offset: 4352)
!929 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !875, file: !608, line: 1302, baseType: !6, size: 32, offset: 4384)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !875, file: !608, line: 1303, baseType: !6, size: 32, offset: 4416)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !875, file: !608, line: 1304, baseType: !6, size: 32, offset: 4448)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !875, file: !608, line: 1305, baseType: !6, size: 32, offset: 4480)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !875, file: !608, line: 1306, baseType: !6, size: 32, offset: 4512)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !875, file: !608, line: 1307, baseType: !6, size: 32, offset: 4544)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !875, file: !608, line: 1308, baseType: !6, size: 32, offset: 4576)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !875, file: !608, line: 1309, baseType: !6, size: 32, offset: 4608)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !875, file: !608, line: 1310, baseType: !6, size: 32, offset: 4640)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !875, file: !608, line: 1311, baseType: !6, size: 32, offset: 4672)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !875, file: !608, line: 1312, baseType: !6, size: 32, offset: 4704)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !875, file: !608, line: 1313, baseType: !6, size: 32, offset: 4736)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !875, file: !608, line: 1314, baseType: !6, size: 32, offset: 4768)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !875, file: !608, line: 1315, baseType: !6, size: 32, offset: 4800)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !875, file: !608, line: 1316, baseType: !301, size: 64, offset: 4864)
!944 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !875, file: !608, line: 1317, baseType: !6, size: 32, offset: 4928)
!945 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !875, file: !608, line: 1318, baseType: !6, size: 32, offset: 4960)
!946 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !875, file: !608, line: 1319, baseType: !6, size: 32, offset: 4992)
!947 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !875, file: !608, line: 1320, baseType: !6, size: 32, offset: 5024)
!948 = !DILocation(line: 131, column: 22, scope: !874)
!949 = !DILocation(line: 132, column: 7, scope: !874)
!950 = !DILocation(line: 133, column: 22, scope: !951)
!951 = distinct !DILexicalBlock(scope: !874, file: !10, line: 133, column: 11)
!952 = !DILocation(line: 133, column: 28, scope: !951)
!953 = !DILocation(line: 133, column: 11, scope: !874)
!954 = !DILocation(line: 134, column: 11, scope: !951)
!955 = !DILocation(line: 135, column: 3, scope: !874)
!956 = !DILocation(line: 130, column: 36, scope: !870)
!957 = !DILocation(line: 130, column: 3, scope: !870)
!958 = distinct !{!958, !872, !959}
!959 = !DILocation(line: 135, column: 3, scope: !867)
!960 = !DILocation(line: 136, column: 14, scope: !961)
!961 = distinct !DILexicalBlock(scope: !775, file: !10, line: 136, column: 7)
!962 = !DILocation(line: 136, column: 11, scope: !961)
!963 = !DILocation(line: 136, column: 7, scope: !775)
!964 = !DILocation(line: 137, column: 15, scope: !965)
!965 = distinct !DILexicalBlock(scope: !961, file: !10, line: 136, column: 27)
!966 = !DILocation(line: 137, column: 7, scope: !965)
!967 = !DILocation(line: 138, column: 7, scope: !965)
!968 = !DILocation(line: 141, column: 7, scope: !961)
!969 = !DILocation(line: 146, column: 40, scope: !775)
!970 = !DILocation(line: 146, column: 39, scope: !775)
!971 = !DILocation(line: 146, column: 43, scope: !775)
!972 = !DILocation(line: 146, column: 42, scope: !775)
!973 = !DILocation(line: 146, column: 46, scope: !775)
!974 = !DILocation(line: 146, column: 45, scope: !775)
!975 = !{!"0"}
!976 = !DILocation(line: 146, column: 19, scope: !775)
!977 = !{!975}
!978 = !DILocalVariable(name: "h_u1", scope: !775, file: !10, line: 67, type: !7)
!979 = !DILocation(line: 147, column: 40, scope: !775)
!980 = !DILocation(line: 147, column: 39, scope: !775)
!981 = !DILocation(line: 147, column: 43, scope: !775)
!982 = !DILocation(line: 147, column: 42, scope: !775)
!983 = !DILocation(line: 147, column: 46, scope: !775)
!984 = !DILocation(line: 147, column: 45, scope: !775)
!985 = !{!"1"}
!986 = !DILocation(line: 147, column: 19, scope: !775)
!987 = !{!985}
!988 = !DILocation(line: 147, column: 10, scope: !775)
!989 = !DILocalVariable(name: "h_u2", scope: !775, file: !10, line: 67, type: !7)
!990 = !DILocation(line: 148, column: 40, scope: !775)
!991 = !DILocation(line: 148, column: 39, scope: !775)
!992 = !DILocation(line: 148, column: 43, scope: !775)
!993 = !DILocation(line: 148, column: 42, scope: !775)
!994 = !DILocation(line: 148, column: 46, scope: !775)
!995 = !DILocation(line: 148, column: 45, scope: !775)
!996 = !DILocation(line: 148, column: 19, scope: !775)
!997 = !DILocalVariable(name: "h_u3", scope: !775, file: !10, line: 67, type: !7)
!998 = !DILocation(line: 149, column: 14, scope: !775)
!999 = !DILocation(line: 149, column: 44, scope: !775)
!1000 = !DILocation(line: 149, column: 43, scope: !775)
!1001 = !DILocation(line: 149, column: 47, scope: !775)
!1002 = !DILocation(line: 149, column: 46, scope: !775)
!1003 = !DILocation(line: 149, column: 50, scope: !775)
!1004 = !DILocation(line: 149, column: 49, scope: !775)
!1005 = !DILocation(line: 149, column: 3, scope: !775)
!1006 = !DILocation(line: 150, column: 14, scope: !775)
!1007 = !DILocation(line: 150, column: 44, scope: !775)
!1008 = !DILocation(line: 150, column: 43, scope: !775)
!1009 = !DILocation(line: 150, column: 47, scope: !775)
!1010 = !DILocation(line: 150, column: 46, scope: !775)
!1011 = !DILocation(line: 150, column: 50, scope: !775)
!1012 = !DILocation(line: 150, column: 49, scope: !775)
!1013 = !DILocation(line: 150, column: 3, scope: !775)
!1014 = !DILocation(line: 153, column: 22, scope: !775)
!1015 = !DILocalVariable(name: "pitch", scope: !775, file: !10, line: 65, type: !6)
!1016 = !DILocalVariable(name: "k", scope: !775, file: !10, line: 65, type: !6)
!1017 = !DILocation(line: 157, column: 8, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !775, file: !10, line: 157, column: 3)
!1019 = !DILocation(line: 0, scope: !1018)
!1020 = !DILocation(line: 157, column: 15, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1018, file: !10, line: 157, column: 3)
!1022 = !DILocation(line: 157, column: 14, scope: !1021)
!1023 = !DILocation(line: 157, column: 3, scope: !1018)
!1024 = !DILocalVariable(name: "j", scope: !775, file: !10, line: 65, type: !6)
!1025 = !DILocation(line: 158, column: 10, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1027, file: !10, line: 158, column: 5)
!1027 = distinct !DILexicalBlock(scope: !1021, file: !10, line: 157, column: 24)
!1028 = !DILocation(line: 0, scope: !1026)
!1029 = !DILocation(line: 158, column: 17, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1026, file: !10, line: 158, column: 5)
!1031 = !DILocation(line: 158, column: 16, scope: !1030)
!1032 = !DILocation(line: 158, column: 5, scope: !1026)
!1033 = !DILocalVariable(name: "i", scope: !775, file: !10, line: 65, type: !6)
!1034 = !DILocation(line: 159, column: 12, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1036, file: !10, line: 159, column: 7)
!1036 = distinct !DILexicalBlock(scope: !1030, file: !10, line: 158, column: 26)
!1037 = !DILocation(line: 0, scope: !1035)
!1038 = !DILocation(line: 159, column: 19, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1035, file: !10, line: 159, column: 7)
!1040 = !DILocation(line: 159, column: 18, scope: !1039)
!1041 = !DILocation(line: 159, column: 7, scope: !1035)
!1042 = !DILocation(line: 160, column: 21, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1039, file: !10, line: 159, column: 28)
!1044 = !DILocation(line: 160, column: 20, scope: !1043)
!1045 = !DILocation(line: 160, column: 17, scope: !1043)
!1046 = !DILocation(line: 160, column: 28, scope: !1043)
!1047 = !DILocation(line: 160, column: 27, scope: !1043)
!1048 = !DILocation(line: 160, column: 31, scope: !1043)
!1049 = !DILocation(line: 160, column: 30, scope: !1043)
!1050 = !DILocation(line: 160, column: 24, scope: !1043)
!1051 = !DILocalVariable(name: "ind", scope: !775, file: !10, line: 65, type: !6)
!1052 = !DILocation(line: 162, column: 14, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1043, file: !10, line: 162, column: 13)
!1054 = !DILocation(line: 162, column: 18, scope: !1053)
!1055 = !DILocation(line: 162, column: 24, scope: !1053)
!1056 = !DILocation(line: 162, column: 26, scope: !1053)
!1057 = !DILocation(line: 162, column: 22, scope: !1053)
!1058 = !DILocation(line: 162, column: 29, scope: !1053)
!1059 = !DILocation(line: 162, column: 33, scope: !1053)
!1060 = !DILocation(line: 162, column: 37, scope: !1053)
!1061 = !DILocation(line: 162, column: 43, scope: !1053)
!1062 = !DILocation(line: 162, column: 45, scope: !1053)
!1063 = !DILocation(line: 162, column: 41, scope: !1053)
!1064 = !DILocation(line: 162, column: 47, scope: !1053)
!1065 = !DILocation(line: 162, column: 51, scope: !1053)
!1066 = !DILocation(line: 162, column: 55, scope: !1053)
!1067 = !DILocation(line: 162, column: 61, scope: !1053)
!1068 = !DILocation(line: 162, column: 63, scope: !1053)
!1069 = !DILocation(line: 162, column: 59, scope: !1053)
!1070 = !DILocation(line: 162, column: 13, scope: !1043)
!1071 = !DILocation(line: 163, column: 11, scope: !1053)
!1072 = !DILocation(line: 163, column: 21, scope: !1053)
!1073 = !DILocation(line: 165, column: 11, scope: !1053)
!1074 = !DILocation(line: 165, column: 21, scope: !1053)
!1075 = !DILocation(line: 166, column: 7, scope: !1043)
!1076 = !DILocation(line: 159, column: 24, scope: !1039)
!1077 = !DILocation(line: 159, column: 7, scope: !1039)
!1078 = distinct !{!1078, !1041, !1079}
!1079 = !DILocation(line: 166, column: 7, scope: !1035)
!1080 = !DILocation(line: 167, column: 5, scope: !1036)
!1081 = !DILocation(line: 158, column: 22, scope: !1030)
!1082 = !DILocation(line: 158, column: 5, scope: !1030)
!1083 = distinct !{!1083, !1032, !1084}
!1084 = !DILocation(line: 167, column: 5, scope: !1026)
!1085 = !DILocation(line: 168, column: 3, scope: !1027)
!1086 = !DILocation(line: 157, column: 20, scope: !1021)
!1087 = !DILocation(line: 157, column: 3, scope: !1021)
!1088 = distinct !{!1088, !1023, !1089}
!1089 = !DILocation(line: 168, column: 3, scope: !1018)
!1090 = !DILocation(line: 146, column: 10, scope: !775)
!1091 = !DILocation(line: 148, column: 10, scope: !775)
!1092 = !DILocation(line: 153, column: 11, scope: !775)
!1093 = !DILocation(line: 173, column: 14, scope: !775)
!1094 = !DILocation(line: 173, column: 20, scope: !775)
!1095 = !DILocation(line: 173, column: 40, scope: !775)
!1096 = !DILocation(line: 173, column: 39, scope: !775)
!1097 = !DILocation(line: 173, column: 45, scope: !775)
!1098 = !DILocation(line: 173, column: 43, scope: !775)
!1099 = !DILocation(line: 173, column: 48, scope: !775)
!1100 = !DILocation(line: 173, column: 47, scope: !775)
!1101 = !DILocation(line: 173, column: 3, scope: !775)
!1102 = !{!""}
!1103 = !DILocation(line: 174, column: 3, scope: !775)
!1104 = !DILocation(line: 181, column: 13, scope: !775)
!1105 = !DILocation(line: 181, column: 15, scope: !775)
!1106 = !DILocation(line: 181, column: 18, scope: !775)
!1107 = !DILocation(line: 181, column: 10, scope: !775)
!1108 = !DILocalVariable(name: "bx", scope: !775, file: !10, line: 65, type: !6)
!1109 = !DILocation(line: 182, column: 13, scope: !775)
!1110 = !DILocation(line: 182, column: 15, scope: !775)
!1111 = !DILocation(line: 182, column: 18, scope: !775)
!1112 = !DILocation(line: 182, column: 10, scope: !775)
!1113 = !DILocalVariable(name: "by", scope: !775, file: !10, line: 65, type: !6)
!1114 = !DILocalVariable(name: "dimGrid", scope: !775, file: !10, line: 184, type: !1115)
!1115 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1116, line: 427, baseType: !1117)
!1116 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!1117 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1116, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1118, identifier: "_ZTS4dim3")
!1118 = !{!1119, !1120, !1121, !1122, !1126, !1135}
!1119 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1117, file: !1116, line: 419, baseType: !371, size: 32)
!1120 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1117, file: !1116, line: 419, baseType: !371, size: 32, offset: 32)
!1121 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1117, file: !1116, line: 419, baseType: !371, size: 32, offset: 64)
!1122 = !DISubprogram(name: "dim3", scope: !1117, file: !1116, line: 421, type: !1123, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{null, !1125, !371, !371, !371}
!1125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1117, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1126 = !DISubprogram(name: "dim3", scope: !1117, file: !1116, line: 422, type: !1127, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DISubroutineType(types: !1128)
!1128 = !{null, !1125, !1129}
!1129 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1116, line: 383, baseType: !1130)
!1130 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1116, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1131, identifier: "_ZTS5uint3")
!1131 = !{!1132, !1133, !1134}
!1132 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1130, file: !1116, line: 192, baseType: !371, size: 32)
!1133 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1130, file: !1116, line: 192, baseType: !371, size: 32, offset: 32)
!1134 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1130, file: !1116, line: 192, baseType: !371, size: 32, offset: 64)
!1135 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1117, file: !1116, line: 423, type: !1136, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!1129, !1125}
!1138 = !DILocation(line: 184, column: 8, scope: !775)
!1139 = !DILocalVariable(name: "dimBlock", scope: !775, file: !10, line: 185, type: !1115)
!1140 = !DILocation(line: 185, column: 8, scope: !775)
!1141 = !DILocation(line: 187, column: 46, scope: !775)
!1142 = !DILocation(line: 187, column: 56, scope: !775)
!1143 = !DILocation(line: 187, column: 66, scope: !775)
!1144 = !DILocation(line: 187, column: 3, scope: !775)
!1145 = !DILocation(line: 188, column: 45, scope: !775)
!1146 = !DILocation(line: 188, column: 56, scope: !775)
!1147 = !DILocation(line: 188, column: 67, scope: !775)
!1148 = !DILocation(line: 188, column: 3, scope: !775)
!1149 = !DILocation(line: 192, column: 3, scope: !775)
!1150 = !DILocation(line: 196, column: 8, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !775, file: !10, line: 196, column: 3)
!1152 = !DILocation(line: 0, scope: !1151)
!1153 = !DILocation(line: 196, column: 20, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1151, file: !10, line: 196, column: 3)
!1155 = !DILocation(line: 196, column: 17, scope: !1154)
!1156 = !DILocation(line: 196, column: 3, scope: !1151)
!1157 = !DILocation(line: 197, column: 21, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1154, file: !10, line: 196, column: 33)
!1159 = !DILocation(line: 197, column: 30, scope: !1158)
!1160 = !DILocation(line: 197, column: 18, scope: !1158)
!1161 = !DILocation(line: 197, column: 42, scope: !1158)
!1162 = !DILocation(line: 197, column: 46, scope: !1158)
!1163 = !DILocation(line: 197, column: 50, scope: !1158)
!1164 = !DILocation(line: 197, column: 67, scope: !1158)
!1165 = !DILocalVariable(name: "d_foo", scope: !775, file: !10, line: 73, type: !7)
!1166 = !DILocation(line: 198, column: 26, scope: !1158)
!1167 = !DILocation(line: 198, column: 24, scope: !1158)
!1168 = !DILocation(line: 198, column: 37, scope: !1158)
!1169 = !DILocation(line: 200, column: 5, scope: !1158)
!1170 = !DILocation(line: 202, column: 3, scope: !1158)
!1171 = !DILocation(line: 196, column: 28, scope: !1154)
!1172 = !DILocation(line: 196, column: 3, scope: !1154)
!1173 = distinct !{!1173, !1156, !1174}
!1174 = !DILocation(line: 202, column: 3, scope: !1151)
!1175 = !DILocation(line: 212, column: 14, scope: !775)
!1176 = !DILocation(line: 212, column: 20, scope: !775)
!1177 = !DILocation(line: 212, column: 40, scope: !775)
!1178 = !DILocation(line: 212, column: 39, scope: !775)
!1179 = !DILocation(line: 212, column: 43, scope: !775)
!1180 = !DILocation(line: 212, column: 42, scope: !775)
!1181 = !DILocation(line: 212, column: 46, scope: !775)
!1182 = !DILocation(line: 212, column: 45, scope: !775)
!1183 = !DILocation(line: 212, column: 3, scope: !775)
!1184 = !DILocalVariable(name: "i", scope: !1185, file: !10, line: 242, type: !6)
!1185 = distinct !DILexicalBlock(scope: !775, file: !10, line: 242, column: 3)
!1186 = !DILocation(line: 0, scope: !1185)
!1187 = !DILocation(line: 242, column: 8, scope: !1185)
!1188 = !DILocation(line: 242, column: 24, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1185, file: !10, line: 242, column: 3)
!1190 = !DILocation(line: 242, column: 21, scope: !1189)
!1191 = !DILocation(line: 242, column: 3, scope: !1185)
!1192 = !DILocation(line: 243, column: 20, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1189, file: !10, line: 242, column: 37)
!1194 = !DILocation(line: 243, column: 24, scope: !1193)
!1195 = !DILocation(line: 243, column: 28, scope: !1193)
!1196 = !DILocation(line: 243, column: 5, scope: !1193)
!1197 = !DILocalVariable(name: "h_foo", scope: !775, file: !10, line: 67, type: !7)
!1198 = !DILocation(line: 245, column: 3, scope: !1193)
!1199 = !DILocation(line: 242, column: 32, scope: !1189)
!1200 = !DILocation(line: 242, column: 3, scope: !1189)
!1201 = distinct !{!1201, !1191, !1202}
!1202 = !DILocation(line: 245, column: 3, scope: !1185)
!1203 = !DILocalVariable(name: "err", scope: !775, file: !10, line: 67, type: !8)
!1204 = !DILocation(line: 269, column: 8, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !775, file: !10, line: 269, column: 3)
!1206 = !DILocation(line: 0, scope: !1205)
!1207 = !DILocation(line: 267, column: 7, scope: !775)
!1208 = !DILocation(line: 269, column: 15, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1205, file: !10, line: 269, column: 3)
!1210 = !DILocation(line: 269, column: 14, scope: !1209)
!1211 = !DILocation(line: 269, column: 3, scope: !1205)
!1212 = !DILocation(line: 270, column: 10, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1214, file: !10, line: 270, column: 5)
!1214 = distinct !DILexicalBlock(scope: !1209, file: !10, line: 269, column: 24)
!1215 = !DILocation(line: 0, scope: !1213)
!1216 = !DILocation(line: 270, column: 17, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1213, file: !10, line: 270, column: 5)
!1218 = !DILocation(line: 270, column: 16, scope: !1217)
!1219 = !DILocation(line: 270, column: 5, scope: !1213)
!1220 = !DILocation(line: 271, column: 12, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1222, file: !10, line: 271, column: 7)
!1222 = distinct !DILexicalBlock(scope: !1217, file: !10, line: 270, column: 26)
!1223 = !DILocation(line: 0, scope: !1221)
!1224 = !DILocation(line: 271, column: 19, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1221, file: !10, line: 271, column: 7)
!1226 = !DILocation(line: 271, column: 18, scope: !1225)
!1227 = !DILocation(line: 271, column: 7, scope: !1221)
!1228 = !DILocation(line: 272, column: 21, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1225, file: !10, line: 271, column: 28)
!1230 = !DILocation(line: 272, column: 20, scope: !1229)
!1231 = !DILocation(line: 272, column: 17, scope: !1229)
!1232 = !DILocation(line: 272, column: 28, scope: !1229)
!1233 = !DILocation(line: 272, column: 27, scope: !1229)
!1234 = !DILocation(line: 272, column: 31, scope: !1229)
!1235 = !DILocation(line: 272, column: 30, scope: !1229)
!1236 = !DILocation(line: 272, column: 24, scope: !1229)
!1237 = !DILocation(line: 273, column: 17, scope: !1229)
!1238 = !DILocation(line: 273, column: 27, scope: !1229)
!1239 = !DILocation(line: 273, column: 26, scope: !1229)
!1240 = !DILocation(line: 273, column: 39, scope: !1229)
!1241 = !DILocation(line: 273, column: 49, scope: !1229)
!1242 = !DILocation(line: 273, column: 48, scope: !1229)
!1243 = !DILocation(line: 273, column: 37, scope: !1229)
!1244 = !DILocation(line: 273, column: 13, scope: !1229)
!1245 = !DILocation(line: 274, column: 7, scope: !1229)
!1246 = !DILocation(line: 271, column: 24, scope: !1225)
!1247 = !DILocation(line: 271, column: 7, scope: !1225)
!1248 = distinct !{!1248, !1227, !1249}
!1249 = !DILocation(line: 274, column: 7, scope: !1221)
!1250 = !DILocation(line: 275, column: 5, scope: !1222)
!1251 = !DILocation(line: 270, column: 22, scope: !1217)
!1252 = !DILocation(line: 270, column: 5, scope: !1217)
!1253 = distinct !{!1253, !1219, !1254}
!1254 = !DILocation(line: 275, column: 5, scope: !1213)
!1255 = !DILocation(line: 276, column: 3, scope: !1214)
!1256 = !DILocation(line: 269, column: 20, scope: !1209)
!1257 = !DILocation(line: 269, column: 3, scope: !1209)
!1258 = distinct !{!1258, !1211, !1259}
!1259 = !DILocation(line: 276, column: 3, scope: !1205)
!1260 = !DILocation(line: 278, column: 51, scope: !775)
!1261 = !DILocation(line: 278, column: 54, scope: !775)
!1262 = !DILocation(line: 278, column: 53, scope: !775)
!1263 = !DILocation(line: 278, column: 57, scope: !775)
!1264 = !DILocation(line: 278, column: 56, scope: !775)
!1265 = !DILocation(line: 278, column: 50, scope: !775)
!1266 = !DILocation(line: 278, column: 41, scope: !775)
!1267 = !DILocation(line: 278, column: 33, scope: !775)
!1268 = !DILocation(line: 278, column: 3, scope: !775)
!1269 = !DILocation(line: 281, column: 3, scope: !775)
!1270 = !DILocation(line: 281, column: 57, scope: !775)
!1271 = !DILocation(line: 281, column: 50, scope: !775)
!1272 = !DILocation(line: 283, column: 3, scope: !775)
!1273 = !DILocation(line: 283, column: 57, scope: !775)
!1274 = !DILocation(line: 283, column: 50, scope: !775)
!1275 = !DILocation(line: 285, column: 3, scope: !775)
!1276 = !DILocation(line: 285, column: 35, scope: !775)
!1277 = !DILocation(line: 285, column: 28, scope: !775)
!1278 = !DILocation(line: 286, column: 8, scope: !775)
!1279 = !DILocation(line: 286, column: 3, scope: !775)
!1280 = !DILocation(line: 287, column: 3, scope: !775)
!1281 = !DILocation(line: 287, column: 35, scope: !775)
!1282 = !DILocation(line: 287, column: 28, scope: !775)
!1283 = !DILocation(line: 288, column: 8, scope: !775)
!1284 = !DILocation(line: 288, column: 3, scope: !775)
!1285 = !DILocation(line: 289, column: 3, scope: !775)
!1286 = !DILocation(line: 289, column: 35, scope: !775)
!1287 = !DILocation(line: 289, column: 28, scope: !775)
!1288 = !DILocation(line: 290, column: 8, scope: !775)
!1289 = !DILocation(line: 290, column: 3, scope: !775)
!1290 = !DILocation(line: 294, column: 1, scope: !775)
!1291 = distinct !DISubprogram(name: "printHelp", linkageName: "_Z9printHelpv", scope: !10, file: !10, line: 300, type: !277, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !605, retainedNodes: !11)
!1292 = !DILocation(line: 302, column: 3, scope: !1291)
!1293 = !DILocation(line: 303, column: 3, scope: !1291)
!1294 = !DILocation(line: 304, column: 3, scope: !1291)
!1295 = !DILocation(line: 305, column: 3, scope: !1291)
!1296 = !DILocation(line: 306, column: 3, scope: !1291)
!1297 = !DILocation(line: 308, column: 3, scope: !1291)
!1298 = !DILocation(line: 309, column: 3, scope: !1291)
!1299 = !DILocation(line: 310, column: 3, scope: !1291)
!1300 = !DILocation(line: 311, column: 3, scope: !1291)
!1301 = !DILocation(line: 312, column: 3, scope: !1291)
!1302 = !DILocation(line: 313, column: 3, scope: !1291)
!1303 = !DILocation(line: 314, column: 3, scope: !1291)
!1304 = !DILocation(line: 315, column: 1, scope: !1291)
!1305 = distinct !DISubprogram(name: "sqrt", linkageName: "_ZSt4sqrtf", scope: !15, file: !213, line: 463, type: !22, scopeLine: 464, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !605, retainedNodes: !11)
!1306 = !DILocalVariable(name: "__x", arg: 1, scope: !1305, file: !213, line: 463, type: !8)
!1307 = !DILocation(line: 0, scope: !1305)
!1308 = !DILocation(line: 464, column: 12, scope: !1305)
!1309 = !DILocation(line: 464, column: 5, scope: !1305)
!1310 = !DILocalVariable(name: "NX", arg: 1, scope: !2, file: !3, line: 26, type: !6)
!1311 = !DILocation(line: 0, scope: !2)
!1312 = !DILocalVariable(name: "NY", arg: 2, scope: !2, file: !3, line: 26, type: !6)
!1313 = !DILocalVariable(name: "NZ", arg: 3, scope: !2, file: !3, line: 26, type: !6)
!1314 = !DILocalVariable(name: "pitch", arg: 4, scope: !2, file: !3, line: 26, type: !6)
!1315 = !DILocalVariable(name: "d_u1", arg: 5, scope: !2, file: !3, line: 27, type: !7)
!1316 = !DILocalVariable(name: "d_u2", arg: 6, scope: !2, file: !3, line: 27, type: !7)
!1317 = !DILocalVariable(name: "sixth", scope: !2, file: !3, line: 31, type: !8)
!1318 = !DILocation(line: 33, column: 16, scope: !2)
!1319 = !DILocalVariable(name: "NXM1", scope: !2, file: !3, line: 33, type: !6)
!1320 = !DILocation(line: 34, column: 16, scope: !2)
!1321 = !DILocalVariable(name: "NYM1", scope: !2, file: !3, line: 34, type: !6)
!1322 = !DILocation(line: 35, column: 16, scope: !2)
!1323 = !DILocalVariable(name: "NZM1", scope: !2, file: !3, line: 35, type: !6)
!1324 = !DILocation(line: 51, column: 35, scope: !2)
!1325 = !DILocation(line: 51, column: 22, scope: !2)
!1326 = !DILocalVariable(name: "k", scope: !2, file: !3, line: 30, type: !6)
!1327 = !DILocation(line: 52, column: 12, scope: !2)
!1328 = !DILocation(line: 52, column: 10, scope: !2)
!1329 = !DILocalVariable(name: "halo", scope: !2, file: !3, line: 30, type: !6)
!1330 = !DILocation(line: 54, column: 7, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !2, file: !3, line: 54, column: 7)
!1332 = !DILocation(line: 54, column: 7, scope: !2)
!1333 = !DILocation(line: 55, column: 20, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1335, file: !3, line: 55, column: 9)
!1335 = distinct !DILexicalBlock(scope: !1331, file: !3, line: 54, column: 13)
!1336 = !DILocation(line: 55, column: 9, scope: !1335)
!1337 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 30, type: !6)
!1338 = !DILocation(line: 57, column: 22, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1334, file: !3, line: 55, column: 24)
!1340 = !DILocation(line: 57, column: 35, scope: !1339)
!1341 = !DILocalVariable(name: "j", scope: !2, file: !3, line: 30, type: !6)
!1342 = !DILocation(line: 58, column: 5, scope: !1339)
!1343 = !DILocation(line: 60, column: 13, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1334, file: !3, line: 59, column: 10)
!1345 = !DILocation(line: 60, column: 16, scope: !1344)
!1346 = !DILocation(line: 60, column: 29, scope: !1344)
!1347 = !DILocation(line: 61, column: 13, scope: !1344)
!1348 = !DILocation(line: 61, column: 16, scope: !1344)
!1349 = !DILocation(line: 61, column: 26, scope: !1344)
!1350 = !DILocation(line: 0, scope: !1334)
!1351 = !DILocation(line: 64, column: 14, scope: !1335)
!1352 = !DILocalVariable(name: "x", arg: 1, scope: !1353, file: !502, line: 512, type: !6)
!1353 = distinct !DISubprogram(name: "__mul24", linkageName: "_ZL7__mul24ii", scope: !502, file: !502, line: 512, type: !1354, scopeLine: 513, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !11)
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!6, !6, !6}
!1356 = !DILocation(line: 0, scope: !1353, inlinedAt: !1357)
!1357 = distinct !DILocation(line: 64, column: 14, scope: !1335)
!1358 = !DILocalVariable(name: "y", arg: 2, scope: !1353, file: !502, line: 512, type: !6)
!1359 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1357)
!1360 = !DILocation(line: 64, column: 34, scope: !1335)
!1361 = !DILocalVariable(name: "ind_h", scope: !2, file: !3, line: 30, type: !6)
!1362 = !DILocation(line: 0, scope: !1353, inlinedAt: !1363)
!1363 = distinct !DILocation(line: 66, column: 14, scope: !1335)
!1364 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1363)
!1365 = !DILocation(line: 66, column: 14, scope: !1335)
!1366 = !DILocation(line: 0, scope: !1353, inlinedAt: !1367)
!1367 = distinct !DILocation(line: 67, column: 14, scope: !1335)
!1368 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1367)
!1369 = !DILocation(line: 67, column: 14, scope: !1335)
!1370 = !DILocation(line: 0, scope: !1353, inlinedAt: !1371)
!1371 = distinct !DILocation(line: 68, column: 14, scope: !1335)
!1372 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1371)
!1373 = !DILocation(line: 68, column: 14, scope: !1335)
!1374 = !DILocalVariable(name: "indg_h", scope: !2, file: !3, line: 29, type: !6)
!1375 = !DILocation(line: 70, column: 17, scope: !1335)
!1376 = !DILocation(line: 70, column: 22, scope: !1335)
!1377 = !DILocation(line: 70, column: 27, scope: !1335)
!1378 = !DILocation(line: 70, column: 32, scope: !1335)
!1379 = !DILocation(line: 70, column: 37, scope: !1335)
!1380 = !DILocation(line: 70, column: 42, scope: !1335)
!1381 = !DILocation(line: 70, column: 47, scope: !1335)
!1382 = !DILocation(line: 0, scope: !1335)
!1383 = !DILocation(line: 70, column: 15, scope: !1335)
!1384 = !DILocation(line: 71, column: 3, scope: !1335)
!1385 = !DILocation(line: 79, column: 10, scope: !2)
!1386 = !DILocation(line: 0, scope: !1353, inlinedAt: !1387)
!1387 = distinct !DILocation(line: 79, column: 10, scope: !2)
!1388 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1387)
!1389 = !DILocation(line: 79, column: 30, scope: !2)
!1390 = !DILocalVariable(name: "ind", scope: !2, file: !3, line: 30, type: !6)
!1391 = !DILocation(line: 0, scope: !1353, inlinedAt: !1392)
!1392 = distinct !DILocation(line: 81, column: 10, scope: !2)
!1393 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1392)
!1394 = !DILocation(line: 81, column: 10, scope: !2)
!1395 = !DILocation(line: 0, scope: !1353, inlinedAt: !1396)
!1396 = distinct !DILocation(line: 82, column: 10, scope: !2)
!1397 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1396)
!1398 = !DILocation(line: 82, column: 10, scope: !2)
!1399 = !DILocation(line: 0, scope: !1353, inlinedAt: !1400)
!1400 = distinct !DILocation(line: 83, column: 10, scope: !2)
!1401 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1400)
!1402 = !DILocation(line: 83, column: 10, scope: !2)
!1403 = !DILocalVariable(name: "indg", scope: !2, file: !3, line: 29, type: !6)
!1404 = !DILocation(line: 85, column: 14, scope: !2)
!1405 = !DILocation(line: 85, column: 19, scope: !2)
!1406 = !DILocation(line: 85, column: 24, scope: !2)
!1407 = !DILocation(line: 85, column: 12, scope: !2)
!1408 = !DILocalVariable(name: "active", scope: !2, file: !3, line: 30, type: !6)
!1409 = !DILocation(line: 91, column: 7, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !2, file: !3, line: 91, column: 7)
!1411 = !DILocation(line: 91, column: 7, scope: !2)
!1412 = !DILocation(line: 91, column: 30, scope: !1410)
!1413 = !DILocation(line: 91, column: 21, scope: !1410)
!1414 = !DILocation(line: 91, column: 15, scope: !1410)
!1415 = !DILocation(line: 91, column: 28, scope: !1410)
!1416 = !DILocation(line: 92, column: 7, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !2, file: !3, line: 92, column: 7)
!1418 = !DILocation(line: 92, column: 7, scope: !2)
!1419 = !DILocation(line: 92, column: 30, scope: !1417)
!1420 = !DILocation(line: 92, column: 21, scope: !1417)
!1421 = !DILocation(line: 92, column: 13, scope: !1417)
!1422 = !DILocation(line: 92, column: 28, scope: !1417)
!1423 = !DILocation(line: 98, column: 8, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !2, file: !3, line: 98, column: 3)
!1425 = !DILocation(line: 0, scope: !1424)
!1426 = !DILocalVariable(name: "indg0", scope: !2, file: !3, line: 29, type: !6)
!1427 = !DILocation(line: 98, column: 14, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1424, file: !3, line: 98, column: 3)
!1429 = !DILocation(line: 98, column: 3, scope: !1424)
!1430 = !DILocation(line: 102, column: 9, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1432, file: !3, line: 102, column: 9)
!1432 = distinct !DILexicalBlock(scope: !1428, file: !3, line: 98, column: 24)
!1433 = !DILocation(line: 102, column: 9, scope: !1432)
!1434 = !DILocation(line: 0, scope: !1353, inlinedAt: !1435)
!1435 = distinct !DILocation(line: 104, column: 15, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1431, file: !3, line: 102, column: 17)
!1437 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1435)
!1438 = !DILocation(line: 104, column: 15, scope: !1436)
!1439 = !DILocation(line: 105, column: 22, scope: !1436)
!1440 = !DILocation(line: 105, column: 13, scope: !1436)
!1441 = !DILocation(line: 105, column: 7, scope: !1436)
!1442 = !DILocation(line: 105, column: 20, scope: !1436)
!1443 = !DILocation(line: 106, column: 28, scope: !1436)
!1444 = !DILocation(line: 106, column: 22, scope: !1436)
!1445 = !DILocation(line: 106, column: 7, scope: !1436)
!1446 = !DILocation(line: 106, column: 20, scope: !1436)
!1447 = !DILocation(line: 107, column: 12, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1436, file: !3, line: 107, column: 11)
!1449 = !DILocation(line: 107, column: 11, scope: !1436)
!1450 = !DILocation(line: 108, column: 24, scope: !1448)
!1451 = !DILocation(line: 108, column: 15, scope: !1448)
!1452 = !DILocation(line: 108, column: 9, scope: !1448)
!1453 = !DILocation(line: 108, column: 22, scope: !1448)
!1454 = !DILocation(line: 109, column: 5, scope: !1436)
!1455 = !DILocation(line: 111, column: 9, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1432, file: !3, line: 111, column: 9)
!1457 = !DILocation(line: 111, column: 9, scope: !1432)
!1458 = !DILocation(line: 0, scope: !1353, inlinedAt: !1459)
!1459 = distinct !DILocation(line: 112, column: 16, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1456, file: !3, line: 111, column: 15)
!1461 = !DILocation(line: 514, column: 10, scope: !1353, inlinedAt: !1459)
!1462 = !DILocation(line: 112, column: 16, scope: !1460)
!1463 = !DILocation(line: 113, column: 24, scope: !1460)
!1464 = !DILocation(line: 113, column: 15, scope: !1460)
!1465 = !DILocation(line: 113, column: 7, scope: !1460)
!1466 = !DILocation(line: 113, column: 22, scope: !1460)
!1467 = !DILocation(line: 114, column: 32, scope: !1460)
!1468 = !DILocation(line: 114, column: 24, scope: !1460)
!1469 = !DILocation(line: 114, column: 7, scope: !1460)
!1470 = !DILocation(line: 114, column: 22, scope: !1460)
!1471 = !DILocation(line: 115, column: 12, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1460, file: !3, line: 115, column: 11)
!1473 = !DILocation(line: 115, column: 11, scope: !1460)
!1474 = !DILocation(line: 116, column: 26, scope: !1472)
!1475 = !DILocation(line: 116, column: 17, scope: !1472)
!1476 = !DILocation(line: 116, column: 9, scope: !1472)
!1477 = !DILocation(line: 116, column: 24, scope: !1472)
!1478 = !DILocation(line: 117, column: 5, scope: !1460)
!1479 = !DILocation(line: 125, column: 9, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1432, file: !3, line: 125, column: 9)
!1481 = !DILocation(line: 125, column: 9, scope: !1432)
!1482 = !DILocation(line: 126, column: 12, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1484, file: !3, line: 126, column: 11)
!1484 = distinct !DILexicalBlock(scope: !1480, file: !3, line: 125, column: 17)
!1485 = !DILocation(line: 126, column: 16, scope: !1483)
!1486 = !DILocation(line: 126, column: 20, scope: !1483)
!1487 = !DILocation(line: 126, column: 27, scope: !1483)
!1488 = !DILocation(line: 126, column: 31, scope: !1483)
!1489 = !DILocation(line: 126, column: 35, scope: !1483)
!1490 = !DILocation(line: 126, column: 39, scope: !1483)
!1491 = !DILocation(line: 126, column: 46, scope: !1483)
!1492 = !DILocation(line: 126, column: 50, scope: !1483)
!1493 = !DILocation(line: 126, column: 54, scope: !1483)
!1494 = !DILocation(line: 126, column: 58, scope: !1483)
!1495 = !DILocation(line: 126, column: 11, scope: !1484)
!1496 = !DILocation(line: 127, column: 14, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1483, file: !3, line: 126, column: 66)
!1498 = !DILocalVariable(name: "u2", scope: !2, file: !3, line: 31, type: !8)
!1499 = !DILocation(line: 128, column: 7, scope: !1497)
!1500 = !DILocation(line: 130, column: 22, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1483, file: !3, line: 129, column: 12)
!1502 = !DILocation(line: 130, column: 16, scope: !1501)
!1503 = !DILocation(line: 130, column: 37, scope: !1501)
!1504 = !DILocation(line: 130, column: 31, scope: !1501)
!1505 = !DILocation(line: 130, column: 29, scope: !1501)
!1506 = !DILocation(line: 131, column: 22, scope: !1501)
!1507 = !DILocation(line: 131, column: 16, scope: !1501)
!1508 = !DILocation(line: 131, column: 14, scope: !1501)
!1509 = !DILocation(line: 131, column: 37, scope: !1501)
!1510 = !DILocation(line: 131, column: 31, scope: !1501)
!1511 = !DILocation(line: 131, column: 29, scope: !1501)
!1512 = !DILocation(line: 132, column: 22, scope: !1501)
!1513 = !DILocation(line: 132, column: 16, scope: !1501)
!1514 = !DILocation(line: 132, column: 14, scope: !1501)
!1515 = !DILocation(line: 132, column: 37, scope: !1501)
!1516 = !DILocation(line: 132, column: 31, scope: !1501)
!1517 = !DILocation(line: 132, column: 29, scope: !1501)
!1518 = !DILocation(line: 132, column: 46, scope: !1501)
!1519 = !DILocation(line: 0, scope: !1483)
!1520 = !DILocation(line: 134, column: 7, scope: !1484)
!1521 = !DILocation(line: 134, column: 19, scope: !1484)
!1522 = !DILocation(line: 135, column: 5, scope: !1484)
!1523 = !DILocation(line: 139, column: 3, scope: !1432)
!1524 = !DILocation(line: 98, column: 20, scope: !1428)
!1525 = !DILocation(line: 98, column: 3, scope: !1428)
!1526 = distinct !{!1526, !1429, !1527}
!1527 = !DILocation(line: 139, column: 3, scope: !1424)
!1528 = !DILocation(line: 140, column: 1, scope: !2)
