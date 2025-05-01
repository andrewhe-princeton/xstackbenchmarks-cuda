; ModuleID = 'gemm.cu'
source_filename = "gemm.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline uwtable
define dso_local void @_Z10kernel_deviiiddPdS_S_(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, double* %C, double* %A, double* %B) #0 !dbg !692 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !700, metadata !DIExpression()), !dbg !701
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !704, metadata !DIExpression()), !dbg !705
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !706, metadata !DIExpression()), !dbg !707
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !708, metadata !DIExpression()), !dbg !709
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !710, metadata !DIExpression()), !dbg !711
  %0 = bitcast i32* %ni.addr to i8*, !dbg !712
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !712
  %2 = icmp eq i32 %1, 0, !dbg !712
  br i1 %2, label %setup.next, label %setup.end, !dbg !712

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nj.addr to i8*, !dbg !712
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !712
  %5 = icmp eq i32 %4, 0, !dbg !712
  br i1 %5, label %setup.next1, label %setup.end, !dbg !712

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %nk.addr to i8*, !dbg !712
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !712
  %8 = icmp eq i32 %7, 0, !dbg !712
  br i1 %8, label %setup.next2, label %setup.end, !dbg !712

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double* %alpha.addr to i8*, !dbg !712
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !712
  %11 = icmp eq i32 %10, 0, !dbg !712
  br i1 %11, label %setup.next3, label %setup.end, !dbg !712

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double* %beta.addr to i8*, !dbg !712
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !712
  %14 = icmp eq i32 %13, 0, !dbg !712
  br i1 %14, label %setup.next4, label %setup.end, !dbg !712

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %C.addr to i8*, !dbg !712
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !712
  %17 = icmp eq i32 %16, 0, !dbg !712
  br i1 %17, label %setup.next5, label %setup.end, !dbg !712

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %A.addr to i8*, !dbg !712
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 40), !dbg !712
  %20 = icmp eq i32 %19, 0, !dbg !712
  br i1 %20, label %setup.next6, label %setup.end, !dbg !712

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast double** %B.addr to i8*, !dbg !712
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 48), !dbg !712
  %23 = icmp eq i32 %22, 0, !dbg !712
  br i1 %23, label %setup.next7, label %setup.end, !dbg !712

setup.next7:                                      ; preds = %setup.next6
  %24 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, double, double, double*, double*, double*)* @_Z10kernel_deviiiddPdS_S_ to i8*)), !dbg !712
  br label %setup.end, !dbg !712

setup.end:                                        ; preds = %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !713
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !714 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dump_code = alloca i32, align 4
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %A = alloca double*, align 8
  %B = alloca double*, align 8
  %C = alloca double*, align 8
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %dev_A = alloca double*, align 8
  %dev_B = alloca double*, align 8
  %dev_C = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !719, metadata !DIExpression()), !dbg !720
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !721, metadata !DIExpression()), !dbg !722
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !723
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !723
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !723
  %call = call i32 @atoi(i8* %1) #8, !dbg !724
  store i32 %call, i32* %dump_code, align 4, !dbg !722
  call void @llvm.dbg.declare(metadata i32* %ni, metadata !725, metadata !DIExpression()), !dbg !726
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !727
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !727
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !727
  %call2 = call i32 @atoi(i8* %3) #8, !dbg !728
  store i32 %call2, i32* %ni, align 4, !dbg !726
  call void @llvm.dbg.declare(metadata i32* %nj, metadata !729, metadata !DIExpression()), !dbg !730
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !731
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 3, !dbg !731
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !731
  %call4 = call i32 @atoi(i8* %5) #8, !dbg !732
  store i32 %call4, i32* %nj, align 4, !dbg !730
  call void @llvm.dbg.declare(metadata i32* %nk, metadata !733, metadata !DIExpression()), !dbg !734
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !735
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i64 4, !dbg !735
  %7 = load i8*, i8** %arrayidx5, align 8, !dbg !735
  %call6 = call i32 @atoi(i8* %7) #8, !dbg !736
  store i32 %call6, i32* %nk, align 4, !dbg !734
  call void @llvm.dbg.declare(metadata double** %A, metadata !737, metadata !DIExpression()), !dbg !738
  %8 = load i32, i32* %ni, align 4, !dbg !739
  %9 = load i32, i32* %nk, align 4, !dbg !740
  %mul = mul nsw i32 %8, %9, !dbg !741
  %conv = sext i32 %mul to i64, !dbg !739
  %mul7 = mul i64 %conv, 8, !dbg !742
  %call8 = call noalias i8* @malloc(i64 %mul7) #9, !dbg !743
  %10 = bitcast i8* %call8 to double*, !dbg !744
  store double* %10, double** %A, align 8, !dbg !738
  call void @llvm.dbg.declare(metadata double** %B, metadata !745, metadata !DIExpression()), !dbg !746
  %11 = load i32, i32* %nk, align 4, !dbg !747
  %12 = load i32, i32* %nj, align 4, !dbg !748
  %mul9 = mul nsw i32 %11, %12, !dbg !749
  %conv10 = sext i32 %mul9 to i64, !dbg !747
  %mul11 = mul i64 %conv10, 8, !dbg !750
  %call12 = call noalias i8* @malloc(i64 %mul11) #9, !dbg !751
  %13 = bitcast i8* %call12 to double*, !dbg !752
  store double* %13, double** %B, align 8, !dbg !746
  call void @llvm.dbg.declare(metadata double** %C, metadata !753, metadata !DIExpression()), !dbg !754
  %14 = load i32, i32* %ni, align 4, !dbg !755
  %15 = load i32, i32* %nj, align 4, !dbg !756
  %mul13 = mul nsw i32 %14, %15, !dbg !757
  %conv14 = sext i32 %mul13 to i64, !dbg !755
  %mul15 = mul i64 %conv14, 8, !dbg !758
  %call16 = call noalias i8* @malloc(i64 %mul15) #9, !dbg !759
  %16 = bitcast i8* %call16 to double*, !dbg !760
  store double* %16, double** %C, align 8, !dbg !754
  call void @llvm.dbg.declare(metadata double* %alpha, metadata !761, metadata !DIExpression()), !dbg !762
  store double 3.241200e+04, double* %alpha, align 8, !dbg !762
  call void @llvm.dbg.declare(metadata double* %beta, metadata !763, metadata !DIExpression()), !dbg !764
  store double 2.123000e+03, double* %beta, align 8, !dbg !764
  %17 = load i32, i32* %ni, align 4, !dbg !765
  %18 = load i32, i32* %nj, align 4, !dbg !766
  %19 = load i32, i32* %nk, align 4, !dbg !767
  %20 = load double*, double** %C, align 8, !dbg !768
  %21 = load double*, double** %A, align 8, !dbg !769
  %22 = load double*, double** %B, align 8, !dbg !770
  call void @_ZL10init_arrayiiiPdS_S_(i32 %17, i32 %18, i32 %19, double* %20, double* %21, double* %22), !dbg !771
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !772, metadata !DIExpression()), !dbg !773
  call void @llvm.dbg.declare(metadata double** %dev_B, metadata !774, metadata !DIExpression()), !dbg !775
  call void @llvm.dbg.declare(metadata double** %dev_C, metadata !776, metadata !DIExpression()), !dbg !777
  %23 = load i32, i32* %ni, align 4, !dbg !778
  %24 = load i32, i32* %nk, align 4, !dbg !779
  %mul17 = mul nsw i32 %23, %24, !dbg !780
  %conv18 = sext i32 %mul17 to i64, !dbg !778
  %mul19 = mul i64 %conv18, 8, !dbg !781
  %call20 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_A, i64 %mul19), !dbg !782
  %25 = load i32, i32* %nk, align 4, !dbg !783
  %26 = load i32, i32* %nj, align 4, !dbg !784
  %mul21 = mul nsw i32 %25, %26, !dbg !785
  %conv22 = sext i32 %mul21 to i64, !dbg !783
  %mul23 = mul i64 %conv22, 8, !dbg !786
  %call24 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_B, i64 %mul23), !dbg !787
  %27 = load i32, i32* %ni, align 4, !dbg !788
  %28 = load i32, i32* %nj, align 4, !dbg !789
  %mul25 = mul nsw i32 %27, %28, !dbg !790
  %conv26 = sext i32 %mul25 to i64, !dbg !788
  %mul27 = mul i64 %conv26, 8, !dbg !791
  %call28 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_C, i64 %mul27), !dbg !792
  %29 = load double*, double** %dev_A, align 8, !dbg !793
  %30 = bitcast double* %29 to i8*, !dbg !793
  %31 = load double*, double** %A, align 8, !dbg !794
  %32 = bitcast double* %31 to i8*, !dbg !794
  %33 = load i32, i32* %ni, align 4, !dbg !795
  %34 = load i32, i32* %nk, align 4, !dbg !796
  %mul29 = mul nsw i32 %33, %34, !dbg !797
  %conv30 = sext i32 %mul29 to i64, !dbg !795
  %mul31 = mul i64 %conv30, 8, !dbg !798
  %call32 = call i32 @cudaMemcpy(i8* %30, i8* %32, i64 %mul31, i32 1), !dbg !799
  %35 = load double*, double** %dev_B, align 8, !dbg !800
  %36 = bitcast double* %35 to i8*, !dbg !800
  %37 = load double*, double** %B, align 8, !dbg !801
  %38 = bitcast double* %37 to i8*, !dbg !801
  %39 = load i32, i32* %nk, align 4, !dbg !802
  %40 = load i32, i32* %nj, align 4, !dbg !803
  %mul33 = mul nsw i32 %39, %40, !dbg !804
  %conv34 = sext i32 %mul33 to i64, !dbg !802
  %mul35 = mul i64 %conv34, 8, !dbg !805
  %call36 = call i32 @cudaMemcpy(i8* %36, i8* %38, i64 %mul35, i32 1), !dbg !806
  %41 = load double*, double** %dev_C, align 8, !dbg !807
  %42 = bitcast double* %41 to i8*, !dbg !807
  %43 = load double*, double** %C, align 8, !dbg !808
  %44 = bitcast double* %43 to i8*, !dbg !808
  %45 = load i32, i32* %ni, align 4, !dbg !809
  %46 = load i32, i32* %nj, align 4, !dbg !810
  %mul37 = mul nsw i32 %45, %46, !dbg !811
  %conv38 = sext i32 %mul37 to i64, !dbg !809
  %mul39 = mul i64 %conv38, 8, !dbg !812
  %call40 = call i32 @cudaMemcpy(i8* %42, i8* %44, i64 %mul39, i32 1), !dbg !813
  %47 = load i32, i32* %ni, align 4, !dbg !814
  %48 = load i32, i32* %nj, align 4, !dbg !815
  %49 = load i32, i32* %nk, align 4, !dbg !816
  %50 = load double, double* %alpha, align 8, !dbg !817
  %51 = load double, double* %beta, align 8, !dbg !818
  %52 = load double*, double** %dev_C, align 8, !dbg !819
  %53 = load double*, double** %dev_A, align 8, !dbg !820
  %54 = load double*, double** %dev_B, align 8, !dbg !821
  call void @_ZL6kerneliiiddPdS_S_(i32 %47, i32 %48, i32 %49, double %50, double %51, double* %52, double* %53, double* %54), !dbg !822
  %55 = load double*, double** %C, align 8, !dbg !823
  %56 = bitcast double* %55 to i8*, !dbg !823
  %57 = load double*, double** %dev_C, align 8, !dbg !824
  %58 = bitcast double* %57 to i8*, !dbg !824
  %59 = load i32, i32* %ni, align 4, !dbg !825
  %60 = load i32, i32* %nj, align 4, !dbg !826
  %mul41 = mul nsw i32 %59, %60, !dbg !827
  %conv42 = sext i32 %mul41 to i64, !dbg !825
  %mul43 = mul i64 %conv42, 8, !dbg !828
  %call44 = call i32 @cudaMemcpy(i8* %56, i8* %58, i64 %mul43, i32 2), !dbg !829
  %61 = load i32, i32* %dump_code, align 4, !dbg !830
  %cmp = icmp eq i32 %61, 1, !dbg !832
  br i1 %cmp, label %if.then, label %if.end, !dbg !833

if.then:                                          ; preds = %entry
  %62 = load i32, i32* %ni, align 4, !dbg !834
  %63 = load i32, i32* %nj, align 4, !dbg !835
  %64 = load double*, double** %C, align 8, !dbg !836
  call void @_ZL11print_arrayiiPd(i32 %62, i32 %63, double* %64), !dbg !837
  br label %if.end, !dbg !837

if.end:                                           ; preds = %if.then, %entry
  %65 = load double*, double** %C, align 8, !dbg !838
  %66 = bitcast double* %65 to i8*, !dbg !838
  call void @free(i8* %66) #9, !dbg !839
  %67 = load double*, double** %A, align 8, !dbg !840
  %68 = bitcast double* %67 to i8*, !dbg !840
  call void @free(i8* %68) #9, !dbg !841
  %69 = load double*, double** %B, align 8, !dbg !842
  %70 = bitcast double* %69 to i8*, !dbg !842
  call void @free(i8* %70) #9, !dbg !843
  ret i32 0, !dbg !844
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiiiPdS_S_(i32 %ni, i32 %nj, i32 %nk, double* %C, double* %A, double* %B) #5 !dbg !845 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %C.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !848, metadata !DIExpression()), !dbg !849
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !850, metadata !DIExpression()), !dbg !851
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !852, metadata !DIExpression()), !dbg !853
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !854, metadata !DIExpression()), !dbg !855
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !856, metadata !DIExpression()), !dbg !857
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !858, metadata !DIExpression()), !dbg !859
  call void @llvm.dbg.declare(metadata i32* %i, metadata !860, metadata !DIExpression()), !dbg !861
  call void @llvm.dbg.declare(metadata i32* %j, metadata !862, metadata !DIExpression()), !dbg !863
  store i32 0, i32* %i, align 4, !dbg !864
  br label %for.cond, !dbg !866

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32, i32* %i, align 4, !dbg !867
  %1 = load i32, i32* %ni.addr, align 4, !dbg !869
  %cmp = icmp slt i32 %0, %1, !dbg !870
  br i1 %cmp, label %for.body, label %for.end9, !dbg !871

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !872
  br label %for.cond1, !dbg !874

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !875
  %3 = load i32, i32* %nj.addr, align 4, !dbg !877
  %cmp2 = icmp slt i32 %2, %3, !dbg !878
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !879

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4, !dbg !880
  %conv = sitofp i32 %4 to double, !dbg !880
  %5 = load i32, i32* %j, align 4, !dbg !881
  %conv4 = sitofp i32 %5 to double, !dbg !881
  %mul = fmul contract double %conv, %conv4, !dbg !882
  %6 = load i32, i32* %ni.addr, align 4, !dbg !883
  %conv5 = sitofp i32 %6 to double, !dbg !883
  %div = fdiv double %mul, %conv5, !dbg !884
  %7 = load double*, double** %C.addr, align 8, !dbg !885
  %8 = load i32, i32* %i, align 4, !dbg !886
  %9 = load i32, i32* %nj.addr, align 4, !dbg !887
  %mul6 = mul nsw i32 %8, %9, !dbg !888
  %10 = load i32, i32* %j, align 4, !dbg !889
  %add = add nsw i32 %mul6, %10, !dbg !890
  %idxprom = sext i32 %add to i64, !dbg !885
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom, !dbg !885
  store double %div, double* %arrayidx, align 8, !dbg !891
  br label %for.inc, !dbg !885

for.inc:                                          ; preds = %for.body3
  %11 = load i32, i32* %j, align 4, !dbg !892
  %inc = add nsw i32 %11, 1, !dbg !892
  store i32 %inc, i32* %j, align 4, !dbg !892
  br label %for.cond1, !dbg !893, !llvm.loop !894

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !895

for.inc7:                                         ; preds = %for.end
  %12 = load i32, i32* %i, align 4, !dbg !896
  %inc8 = add nsw i32 %12, 1, !dbg !896
  store i32 %inc8, i32* %i, align 4, !dbg !896
  br label %for.cond, !dbg !897, !llvm.loop !898

for.end9:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !900
  br label %for.cond10, !dbg !902

for.cond10:                                       ; preds = %for.inc28, %for.end9
  %13 = load i32, i32* %i, align 4, !dbg !903
  %14 = load i32, i32* %ni.addr, align 4, !dbg !905
  %cmp11 = icmp slt i32 %13, %14, !dbg !906
  br i1 %cmp11, label %for.body12, label %for.end30, !dbg !907

for.body12:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4, !dbg !908
  br label %for.cond13, !dbg !910

for.cond13:                                       ; preds = %for.inc25, %for.body12
  %15 = load i32, i32* %j, align 4, !dbg !911
  %16 = load i32, i32* %nk.addr, align 4, !dbg !913
  %cmp14 = icmp slt i32 %15, %16, !dbg !914
  br i1 %cmp14, label %for.body15, label %for.end27, !dbg !915

for.body15:                                       ; preds = %for.cond13
  %17 = load i32, i32* %i, align 4, !dbg !916
  %conv16 = sitofp i32 %17 to double, !dbg !916
  %18 = load i32, i32* %j, align 4, !dbg !917
  %conv17 = sitofp i32 %18 to double, !dbg !917
  %mul18 = fmul contract double %conv16, %conv17, !dbg !918
  %19 = load i32, i32* %ni.addr, align 4, !dbg !919
  %conv19 = sitofp i32 %19 to double, !dbg !919
  %div20 = fdiv double %mul18, %conv19, !dbg !920
  %20 = load double*, double** %A.addr, align 8, !dbg !921
  %21 = load i32, i32* %i, align 4, !dbg !922
  %22 = load i32, i32* %nk.addr, align 4, !dbg !923
  %mul21 = mul nsw i32 %21, %22, !dbg !924
  %23 = load i32, i32* %j, align 4, !dbg !925
  %add22 = add nsw i32 %mul21, %23, !dbg !926
  %idxprom23 = sext i32 %add22 to i64, !dbg !921
  %arrayidx24 = getelementptr inbounds double, double* %20, i64 %idxprom23, !dbg !921
  store double %div20, double* %arrayidx24, align 8, !dbg !927
  br label %for.inc25, !dbg !921

for.inc25:                                        ; preds = %for.body15
  %24 = load i32, i32* %j, align 4, !dbg !928
  %inc26 = add nsw i32 %24, 1, !dbg !928
  store i32 %inc26, i32* %j, align 4, !dbg !928
  br label %for.cond13, !dbg !929, !llvm.loop !930

for.end27:                                        ; preds = %for.cond13
  br label %for.inc28, !dbg !931

for.inc28:                                        ; preds = %for.end27
  %25 = load i32, i32* %i, align 4, !dbg !932
  %inc29 = add nsw i32 %25, 1, !dbg !932
  store i32 %inc29, i32* %i, align 4, !dbg !932
  br label %for.cond10, !dbg !933, !llvm.loop !934

for.end30:                                        ; preds = %for.cond10
  store i32 0, i32* %i, align 4, !dbg !936
  br label %for.cond31, !dbg !938

for.cond31:                                       ; preds = %for.inc49, %for.end30
  %26 = load i32, i32* %i, align 4, !dbg !939
  %27 = load i32, i32* %nk.addr, align 4, !dbg !941
  %cmp32 = icmp slt i32 %26, %27, !dbg !942
  br i1 %cmp32, label %for.body33, label %for.end51, !dbg !943

for.body33:                                       ; preds = %for.cond31
  store i32 0, i32* %j, align 4, !dbg !944
  br label %for.cond34, !dbg !946

for.cond34:                                       ; preds = %for.inc46, %for.body33
  %28 = load i32, i32* %j, align 4, !dbg !947
  %29 = load i32, i32* %nj.addr, align 4, !dbg !949
  %cmp35 = icmp slt i32 %28, %29, !dbg !950
  br i1 %cmp35, label %for.body36, label %for.end48, !dbg !951

for.body36:                                       ; preds = %for.cond34
  %30 = load i32, i32* %i, align 4, !dbg !952
  %conv37 = sitofp i32 %30 to double, !dbg !952
  %31 = load i32, i32* %j, align 4, !dbg !953
  %conv38 = sitofp i32 %31 to double, !dbg !953
  %mul39 = fmul contract double %conv37, %conv38, !dbg !954
  %32 = load i32, i32* %ni.addr, align 4, !dbg !955
  %conv40 = sitofp i32 %32 to double, !dbg !955
  %div41 = fdiv double %mul39, %conv40, !dbg !956
  %33 = load double*, double** %B.addr, align 8, !dbg !957
  %34 = load i32, i32* %i, align 4, !dbg !958
  %35 = load i32, i32* %nj.addr, align 4, !dbg !959
  %mul42 = mul nsw i32 %34, %35, !dbg !960
  %36 = load i32, i32* %j, align 4, !dbg !961
  %add43 = add nsw i32 %mul42, %36, !dbg !962
  %idxprom44 = sext i32 %add43 to i64, !dbg !957
  %arrayidx45 = getelementptr inbounds double, double* %33, i64 %idxprom44, !dbg !957
  store double %div41, double* %arrayidx45, align 8, !dbg !963
  br label %for.inc46, !dbg !957

for.inc46:                                        ; preds = %for.body36
  %37 = load i32, i32* %j, align 4, !dbg !964
  %inc47 = add nsw i32 %37, 1, !dbg !964
  store i32 %inc47, i32* %j, align 4, !dbg !964
  br label %for.cond34, !dbg !965, !llvm.loop !966

for.end48:                                        ; preds = %for.cond34
  br label %for.inc49, !dbg !967

for.inc49:                                        ; preds = %for.end48
  %38 = load i32, i32* %i, align 4, !dbg !968
  %inc50 = add nsw i32 %38, 1, !dbg !968
  store i32 %inc50, i32* %i, align 4, !dbg !968
  br label %for.cond31, !dbg !969, !llvm.loop !970

for.end51:                                        ; preds = %for.cond31
  ret void, !dbg !972
}

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !973 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !981, metadata !DIExpression()), !dbg !982
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !983, metadata !DIExpression()), !dbg !984
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !985
  %1 = bitcast double** %0 to i8*, !dbg !985
  %2 = bitcast i8* %1 to i8**, !dbg !986
  %3 = load i64, i64* %size.addr, align 8, !dbg !987
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !988
  ret i32 %call, !dbg !989
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #6

; Function Attrs: noinline uwtable
define internal void @_ZL6kerneliiiddPdS_S_(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, double* %C, double* %A, double* %B) #0 !dbg !990 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %threadsPerBlock = alloca i32, align 4
  %block = alloca %struct.dim3, align 4
  %grid = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp2 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp2.coerce = alloca { i64, i32 }, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !991, metadata !DIExpression()), !dbg !992
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !993, metadata !DIExpression()), !dbg !994
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !995, metadata !DIExpression()), !dbg !996
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !997, metadata !DIExpression()), !dbg !998
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !999, metadata !DIExpression()), !dbg !1000
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !1001, metadata !DIExpression()), !dbg !1002
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !1003, metadata !DIExpression()), !dbg !1004
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !1005, metadata !DIExpression()), !dbg !1006
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !1007, metadata !DIExpression()), !dbg !1008
  store i32 256, i32* %threadsPerBlock, align 4, !dbg !1008
  call void @llvm.dbg.declare(metadata %struct.dim3* %block, metadata !1009, metadata !DIExpression()), !dbg !1033
  %0 = load i32, i32* %threadsPerBlock, align 4, !dbg !1034
  %div = udiv i32 %0, 32, !dbg !1035
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block, i32 %div, i32 32, i32 1), !dbg !1033
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !1036, metadata !DIExpression()), !dbg !1037
  %1 = load i32, i32* %ni.addr, align 4, !dbg !1038
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0, !dbg !1039
  %2 = load i32, i32* %x, align 4, !dbg !1039
  %call = call i32 @_ZL10num_blocksii(i32 %1, i32 %2), !dbg !1040
  %3 = load i32, i32* %nj.addr, align 4, !dbg !1041
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 1, !dbg !1042
  %4 = load i32, i32* %y, align 4, !dbg !1042
  %call1 = call i32 @_ZL10num_blocksii(i32 %3, i32 %4), !dbg !1043
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 %call, i32 %call1, i32 1), !dbg !1037
  %5 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1044
  %6 = bitcast %struct.dim3* %grid to i8*, !dbg !1044
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %6, i64 12, i1 false), !dbg !1044
  %7 = bitcast %struct.dim3* %agg.tmp2 to i8*, !dbg !1045
  %8 = bitcast %struct.dim3* %block to i8*, !dbg !1045
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 4 %8, i64 12, i1 false), !dbg !1045
  %9 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1046
  %10 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1046
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 4 %10, i64 12, i1 false), !dbg !1046
  %11 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1046
  %12 = load i64, i64* %11, align 4, !dbg !1046
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1046
  %14 = load i32, i32* %13, align 4, !dbg !1046
  %15 = bitcast { i64, i32 }* %agg.tmp2.coerce to i8*, !dbg !1046
  %16 = bitcast %struct.dim3* %agg.tmp2 to i8*, !dbg !1046
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 4 %16, i64 12, i1 false), !dbg !1046
  %17 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp2.coerce, i32 0, i32 0, !dbg !1046
  %18 = load i64, i64* %17, align 4, !dbg !1046
  %19 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp2.coerce, i32 0, i32 1, !dbg !1046
  %20 = load i32, i32* %19, align 4, !dbg !1046
  %call3 = call i32 @cudaConfigureCall(i64 %12, i32 %14, i64 %18, i32 %20, i64 0, %struct.CUstream_st* null), !dbg !1046
  %tobool = icmp ne i32 %call3, 0, !dbg !1046
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !1047

kcall.configok:                                   ; preds = %entry
  %21 = load i32, i32* %ni.addr, align 4, !dbg !1048
  %22 = load i32, i32* %nj.addr, align 4, !dbg !1049
  %23 = load i32, i32* %nk.addr, align 4, !dbg !1050
  %24 = load double, double* %alpha.addr, align 8, !dbg !1051
  %25 = load double, double* %beta.addr, align 8, !dbg !1052
  %26 = load double*, double** %C.addr, align 8, !dbg !1053
  %27 = load double*, double** %A.addr, align 8, !dbg !1054
  %28 = load double*, double** %B.addr, align 8, !dbg !1055
  call void @_Z10kernel_deviiiddPdS_S_(i32 %21, i32 %22, i32 %23, double %24, double %25, double* %26, double* %27, double* %28), !dbg !1047
  br label %kcall.end, !dbg !1047

kcall.end:                                        ; preds = %kcall.configok, %entry
  ret void, !dbg !1056
}

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiiPd(i32 %ni, i32 %nj, double* %C) #0 !dbg !1057 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %C.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !1060, metadata !DIExpression()), !dbg !1061
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !1062, metadata !DIExpression()), !dbg !1063
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !1064, metadata !DIExpression()), !dbg !1065
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1066, metadata !DIExpression()), !dbg !1067
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1068, metadata !DIExpression()), !dbg !1069
  store i32 0, i32* %i, align 4, !dbg !1070
  br label %for.cond, !dbg !1072

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1073
  %1 = load i32, i32* %ni.addr, align 4, !dbg !1075
  %cmp = icmp slt i32 %0, %1, !dbg !1076
  br i1 %cmp, label %for.body, label %for.end10, !dbg !1077

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1078
  br label %for.cond1, !dbg !1080

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1081
  %3 = load i32, i32* %nj.addr, align 4, !dbg !1083
  %cmp2 = icmp slt i32 %2, %3, !dbg !1084
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1085

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1086
  %5 = load double*, double** %C.addr, align 8, !dbg !1088
  %6 = load i32, i32* %i, align 4, !dbg !1089
  %7 = load i32, i32* %nj.addr, align 4, !dbg !1090
  %mul = mul nsw i32 %6, %7, !dbg !1091
  %8 = load i32, i32* %j, align 4, !dbg !1092
  %add = add nsw i32 %mul, %8, !dbg !1093
  %idxprom = sext i32 %add to i64, !dbg !1088
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom, !dbg !1088
  %9 = load double, double* %arrayidx, align 8, !dbg !1088
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %9), !dbg !1094
  %10 = load i32, i32* %i, align 4, !dbg !1095
  %11 = load i32, i32* %ni.addr, align 4, !dbg !1097
  %mul4 = mul nsw i32 %10, %11, !dbg !1098
  %12 = load i32, i32* %j, align 4, !dbg !1099
  %add5 = add nsw i32 %mul4, %12, !dbg !1100
  %rem = srem i32 %add5, 20, !dbg !1101
  %cmp6 = icmp eq i32 %rem, 0, !dbg !1102
  br i1 %cmp6, label %if.then, label %if.end, !dbg !1103

if.then:                                          ; preds = %for.body3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1104
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1105
  br label %if.end, !dbg !1105

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !1106

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %j, align 4, !dbg !1107
  %inc = add nsw i32 %14, 1, !dbg !1107
  store i32 %inc, i32* %j, align 4, !dbg !1107
  br label %for.cond1, !dbg !1108, !llvm.loop !1109

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !1110

for.inc8:                                         ; preds = %for.end
  %15 = load i32, i32* %i, align 4, !dbg !1111
  %inc9 = add nsw i32 %15, 1, !dbg !1111
  store i32 %inc9, i32* %i, align 4, !dbg !1111
  br label %for.cond, !dbg !1112, !llvm.loop !1113

for.end10:                                        ; preds = %for.cond
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1115
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1116
  ret void, !dbg !1117
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !1118 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1119, metadata !DIExpression()), !dbg !1121
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1122, metadata !DIExpression()), !dbg !1123
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1124, metadata !DIExpression()), !dbg !1125
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1126, metadata !DIExpression()), !dbg !1127
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1128
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1129
  store i32 %0, i32* %x, align 4, !dbg !1128
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1130
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1131
  store i32 %1, i32* %y, align 4, !dbg !1130
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1132
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1133
  store i32 %2, i32* %z, align 4, !dbg !1132
  ret void, !dbg !1134
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_ZL10num_blocksii(i32 %num, i32 %factor) #5 !dbg !1135 {
entry:
  %num.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1138, metadata !DIExpression()), !dbg !1139
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1140, metadata !DIExpression()), !dbg !1141
  %0 = load i32, i32* %num.addr, align 4, !dbg !1142
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1143
  %add = add nsw i32 %0, %1, !dbg !1144
  %sub = sub nsw i32 %add, 1, !dbg !1145
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1146
  %div = sdiv i32 %sub, %2, !dbg !1147
  ret i32 %div, !dbg !1148
}

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #6

declare dso_local i32 @cudaMalloc(i8**, i64) #6

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.dbg.cu = !{!4}
!llvm.ident = !{!691}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !5, producer: "clang version 9.0.0 (https://github.com/yebinchon/llvm-project a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !6, retainedTypes: !98, imports: !103, nameTableKind: None)
!5 = !DIFile(filename: "gemm.cu", directory: "/u/ah7226/xstack-benchmark/polybench-cuda/gemm")
!6 = !{!7, !16}
!7 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !8, line: 796, baseType: !9, size: 32, elements: !10, identifier: "_ZTS14cudaMemcpyKind")
!8 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "")
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!11, !12, !13, !14, !15}
!11 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!12 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!13 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!14 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!15 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!16 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !8, line: 150, baseType: !9, size: 32, elements: !17, identifier: "_ZTS9cudaError")
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97}
!18 = !DIEnumerator(name: "cudaSuccess", value: 0, isUnsigned: true)
!19 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1, isUnsigned: true)
!20 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2, isUnsigned: true)
!21 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3, isUnsigned: true)
!22 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4, isUnsigned: true)
!23 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5, isUnsigned: true)
!24 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6, isUnsigned: true)
!25 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7, isUnsigned: true)
!26 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8, isUnsigned: true)
!27 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9, isUnsigned: true)
!28 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10, isUnsigned: true)
!29 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11, isUnsigned: true)
!30 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12, isUnsigned: true)
!31 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13, isUnsigned: true)
!32 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14, isUnsigned: true)
!33 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15, isUnsigned: true)
!34 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16, isUnsigned: true)
!35 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!36 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18, isUnsigned: true)
!37 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19, isUnsigned: true)
!38 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20, isUnsigned: true)
!39 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!40 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22, isUnsigned: true)
!41 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23, isUnsigned: true)
!42 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24, isUnsigned: true)
!43 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25, isUnsigned: true)
!44 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26, isUnsigned: true)
!45 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27, isUnsigned: true)
!46 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28, isUnsigned: true)
!47 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29, isUnsigned: true)
!48 = !DIEnumerator(name: "cudaErrorUnknown", value: 30, isUnsigned: true)
!49 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31, isUnsigned: true)
!50 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32, isUnsigned: true)
!51 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33, isUnsigned: true)
!52 = !DIEnumerator(name: "cudaErrorNotReady", value: 34, isUnsigned: true)
!53 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35, isUnsigned: true)
!54 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36, isUnsigned: true)
!55 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37, isUnsigned: true)
!56 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38, isUnsigned: true)
!57 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39, isUnsigned: true)
!58 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40, isUnsigned: true)
!59 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41, isUnsigned: true)
!60 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42, isUnsigned: true)
!61 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43, isUnsigned: true)
!62 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44, isUnsigned: true)
!63 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45, isUnsigned: true)
!64 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46, isUnsigned: true)
!65 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47, isUnsigned: true)
!66 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48, isUnsigned: true)
!67 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49, isUnsigned: true)
!68 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50, isUnsigned: true)
!69 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51, isUnsigned: true)
!70 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54, isUnsigned: true)
!71 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55, isUnsigned: true)
!72 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56, isUnsigned: true)
!73 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57, isUnsigned: true)
!74 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58, isUnsigned: true)
!75 = !DIEnumerator(name: "cudaErrorAssert", value: 59, isUnsigned: true)
!76 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60, isUnsigned: true)
!77 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61, isUnsigned: true)
!78 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62, isUnsigned: true)
!79 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63, isUnsigned: true)
!80 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64, isUnsigned: true)
!81 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65, isUnsigned: true)
!82 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66, isUnsigned: true)
!83 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67, isUnsigned: true)
!84 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68, isUnsigned: true)
!85 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69, isUnsigned: true)
!86 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70, isUnsigned: true)
!87 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71, isUnsigned: true)
!88 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72, isUnsigned: true)
!89 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73, isUnsigned: true)
!90 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74, isUnsigned: true)
!91 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75, isUnsigned: true)
!92 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76, isUnsigned: true)
!93 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77, isUnsigned: true)
!94 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78, isUnsigned: true)
!95 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79, isUnsigned: true)
!96 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127, isUnsigned: true)
!97 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000, isUnsigned: true)
!98 = !{!99, !101, !100, !102}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!103 = !{!104, !111, !116, !118, !120, !122, !124, !128, !130, !132, !134, !136, !138, !140, !142, !144, !146, !148, !150, !152, !154, !156, !160, !162, !164, !166, !170, !175, !177, !179, !184, !188, !190, !192, !194, !196, !198, !200, !202, !204, !209, !213, !215, !220, !224, !226, !228, !230, !232, !234, !238, !240, !242, !247, !254, !258, !260, !262, !264, !266, !270, !272, !274, !278, !280, !282, !284, !286, !288, !290, !292, !294, !296, !300, !306, !308, !310, !314, !316, !318, !320, !322, !324, !326, !328, !332, !336, !338, !340, !344, !346, !348, !350, !352, !354, !356, !360, !366, !370, !375, !377, !381, !385, !398, !402, !406, !410, !414, !419, !421, !425, !429, !433, !441, !445, !449, !453, !457, !461, !467, !471, !475, !477, !485, !489, !496, !498, !500, !504, !508, !512, !517, !521, !526, !527, !528, !529, !531, !532, !533, !534, !535, !536, !537, !539, !540, !541, !542, !543, !547, !548, !549, !550, !551, !552, !553, !554, !555, !556, !557, !558, !559, !560, !561, !562, !563, !564, !565, !566, !567, !568, !569, !570, !571, !575, !577, !579, !581, !583, !585, !587, !589, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !654, !656, !658, !660, !662, !664, !666, !668, !670, !672, !674, !676, !678, !680, !682, !684, !686}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !106, file: !107, line: 223)
!105 = !DINamespace(name: "std", scope: null)
!106 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !107, file: !107, line: 53, type: !108, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!107 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/__clang_cuda_math_forward_declares.h", directory: "")
!108 = !DISubroutineType(types: !109)
!109 = !{!110, !110}
!110 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !112, file: !107, line: 224)
!112 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !107, file: !107, line: 55, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!113 = !DISubroutineType(types: !114)
!114 = !{!115, !115}
!115 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !117, file: !107, line: 225)
!117 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !107, file: !107, line: 57, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !119, file: !107, line: 226)
!119 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !107, file: !107, line: 59, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !121, file: !107, line: 227)
!121 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !107, file: !107, line: 61, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !123, file: !107, line: 228)
!123 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !107, file: !107, line: 65, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !125, file: !107, line: 229)
!125 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !107, file: !107, line: 63, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!126 = !DISubroutineType(types: !127)
!127 = !{!115, !115, !115}
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !129, file: !107, line: 230)
!129 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !107, file: !107, line: 67, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !131, file: !107, line: 231)
!131 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !107, file: !107, line: 69, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !133, file: !107, line: 232)
!133 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !107, file: !107, line: 71, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !135, file: !107, line: 233)
!135 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !107, file: !107, line: 73, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !137, file: !107, line: 234)
!137 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !107, file: !107, line: 75, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !139, file: !107, line: 235)
!139 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !107, file: !107, line: 77, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !141, file: !107, line: 236)
!141 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !107, file: !107, line: 81, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !143, file: !107, line: 237)
!143 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !107, file: !107, line: 79, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !145, file: !107, line: 238)
!145 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !107, file: !107, line: 85, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !147, file: !107, line: 239)
!147 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !107, file: !107, line: 83, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !149, file: !107, line: 240)
!149 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !107, file: !107, line: 87, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !151, file: !107, line: 241)
!151 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !107, file: !107, line: 89, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !153, file: !107, line: 242)
!153 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !107, file: !107, line: 91, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !155, file: !107, line: 243)
!155 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !107, file: !107, line: 93, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !157, file: !107, line: 244)
!157 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !107, file: !107, line: 95, type: !158, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!158 = !DISubroutineType(types: !159)
!159 = !{!115, !115, !115, !115}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !161, file: !107, line: 245)
!161 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !107, file: !107, line: 97, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !163, file: !107, line: 246)
!163 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !107, file: !107, line: 99, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !165, file: !107, line: 247)
!165 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !107, file: !107, line: 101, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !167, file: !107, line: 248)
!167 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !107, file: !107, line: 103, type: !168, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!168 = !DISubroutineType(types: !169)
!169 = !{!110, !115}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !171, file: !107, line: 249)
!171 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !107, file: !107, line: 105, type: !172, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!172 = !DISubroutineType(types: !173)
!173 = !{!115, !115, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !176, file: !107, line: 250)
!176 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !107, file: !107, line: 107, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !178, file: !107, line: 251)
!178 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !107, file: !107, line: 109, type: !168, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !180, file: !107, line: 252)
!180 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !107, file: !107, line: 114, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!181 = !DISubroutineType(types: !182)
!182 = !{!183, !115}
!183 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !185, file: !107, line: 253)
!185 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !107, file: !107, line: 118, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DISubroutineType(types: !187)
!187 = !{!183, !115, !115}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !189, file: !107, line: 254)
!189 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !107, file: !107, line: 117, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !191, file: !107, line: 255)
!191 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !107, file: !107, line: 123, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !193, file: !107, line: 256)
!193 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !107, file: !107, line: 127, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !195, file: !107, line: 257)
!195 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !107, file: !107, line: 126, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !197, file: !107, line: 258)
!197 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !107, file: !107, line: 129, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !199, file: !107, line: 259)
!199 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !107, file: !107, line: 134, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !201, file: !107, line: 260)
!201 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !107, file: !107, line: 136, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !203, file: !107, line: 261)
!203 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !107, file: !107, line: 138, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !205, file: !107, line: 262)
!205 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !107, file: !107, line: 139, type: !206, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!206 = !DISubroutineType(types: !207)
!207 = !{!208, !208}
!208 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !210, file: !107, line: 263)
!210 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !107, file: !107, line: 141, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!211 = !DISubroutineType(types: !212)
!212 = !{!115, !115, !110}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !214, file: !107, line: 264)
!214 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !107, file: !107, line: 143, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !216, file: !107, line: 265)
!216 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !107, file: !107, line: 144, type: !217, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!217 = !DISubroutineType(types: !218)
!218 = !{!219, !219}
!219 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !221, file: !107, line: 266)
!221 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !107, file: !107, line: 146, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!222 = !DISubroutineType(types: !223)
!223 = !{!219, !115}
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !225, file: !107, line: 267)
!225 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !107, file: !107, line: 159, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !227, file: !107, line: 268)
!227 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !107, file: !107, line: 148, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !229, file: !107, line: 269)
!229 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !107, file: !107, line: 150, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !231, file: !107, line: 270)
!231 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !107, file: !107, line: 152, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !233, file: !107, line: 271)
!233 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !107, file: !107, line: 154, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !235, file: !107, line: 272)
!235 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !107, file: !107, line: 161, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!236 = !DISubroutineType(types: !237)
!237 = !{!208, !115}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !239, file: !107, line: 273)
!239 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !107, file: !107, line: 163, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !241, file: !107, line: 274)
!241 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !107, file: !107, line: 164, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !243, file: !107, line: 275)
!243 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !107, file: !107, line: 166, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!244 = !DISubroutineType(types: !245)
!245 = !{!115, !115, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !248, file: !107, line: 276)
!248 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !107, file: !107, line: 167, type: !249, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!249 = !DISubroutineType(types: !250)
!250 = !{!100, !251}
!251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64)
!252 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !253)
!253 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !255, file: !107, line: 277)
!255 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !107, file: !107, line: 168, type: !256, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!256 = !DISubroutineType(types: !257)
!257 = !{!115, !251}
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !259, file: !107, line: 278)
!259 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !107, file: !107, line: 170, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !261, file: !107, line: 279)
!261 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !107, file: !107, line: 172, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !263, file: !107, line: 280)
!263 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !107, file: !107, line: 176, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !265, file: !107, line: 281)
!265 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !107, file: !107, line: 178, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !267, file: !107, line: 282)
!267 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !107, file: !107, line: 180, type: !268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!268 = !DISubroutineType(types: !269)
!269 = !{!115, !115, !115, !174}
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !271, file: !107, line: 283)
!271 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !107, file: !107, line: 182, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !273, file: !107, line: 284)
!273 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !107, file: !107, line: 184, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !275, file: !107, line: 285)
!275 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !107, file: !107, line: 186, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!276 = !DISubroutineType(types: !277)
!277 = !{!115, !115, !208}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !279, file: !107, line: 286)
!279 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !107, file: !107, line: 188, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !281, file: !107, line: 287)
!281 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !107, file: !107, line: 190, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !283, file: !107, line: 288)
!283 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !107, file: !107, line: 192, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !285, file: !107, line: 289)
!285 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !107, file: !107, line: 194, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !287, file: !107, line: 290)
!287 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !107, file: !107, line: 196, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !289, file: !107, line: 291)
!289 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !107, file: !107, line: 198, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !291, file: !107, line: 292)
!291 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !107, file: !107, line: 200, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !293, file: !107, line: 293)
!293 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !107, file: !107, line: 202, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !295, file: !107, line: 294)
!295 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !107, file: !107, line: 204, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !297, file: !299, line: 52)
!297 = !DISubprogram(name: "abs", scope: !298, file: !298, line: 840, type: !108, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!299 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !301, file: !305, line: 83)
!301 = !DISubprogram(name: "acos", scope: !302, file: !302, line: 53, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!303 = !DISubroutineType(types: !304)
!304 = !{!100, !100}
!305 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cmath", directory: "")
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !307, file: !305, line: 102)
!307 = !DISubprogram(name: "asin", scope: !302, file: !302, line: 55, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !309, file: !305, line: 121)
!309 = !DISubprogram(name: "atan", scope: !302, file: !302, line: 57, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !311, file: !305, line: 140)
!311 = !DISubprogram(name: "atan2", scope: !302, file: !302, line: 59, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DISubroutineType(types: !313)
!313 = !{!100, !100, !100}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !315, file: !305, line: 161)
!315 = !DISubprogram(name: "ceil", scope: !302, file: !302, line: 159, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !317, file: !305, line: 180)
!317 = !DISubprogram(name: "cos", scope: !302, file: !302, line: 62, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !319, file: !305, line: 199)
!319 = !DISubprogram(name: "cosh", scope: !302, file: !302, line: 71, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !321, file: !305, line: 218)
!321 = !DISubprogram(name: "exp", scope: !302, file: !302, line: 95, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !323, file: !305, line: 237)
!323 = !DISubprogram(name: "fabs", scope: !302, file: !302, line: 162, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !325, file: !305, line: 256)
!325 = !DISubprogram(name: "floor", scope: !302, file: !302, line: 165, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !327, file: !305, line: 275)
!327 = !DISubprogram(name: "fmod", scope: !302, file: !302, line: 168, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !329, file: !305, line: 296)
!329 = !DISubprogram(name: "frexp", scope: !302, file: !302, line: 98, type: !330, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DISubroutineType(types: !331)
!331 = !{!100, !100, !174}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !333, file: !305, line: 315)
!333 = !DISubprogram(name: "ldexp", scope: !302, file: !302, line: 101, type: !334, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DISubroutineType(types: !335)
!335 = !{!100, !100, !110}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !337, file: !305, line: 334)
!337 = !DISubprogram(name: "log", scope: !302, file: !302, line: 104, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !339, file: !305, line: 353)
!339 = !DISubprogram(name: "log10", scope: !302, file: !302, line: 107, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !341, file: !305, line: 372)
!341 = !DISubprogram(name: "modf", scope: !302, file: !302, line: 110, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DISubroutineType(types: !343)
!343 = !{!100, !100, !99}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !345, file: !305, line: 384)
!345 = !DISubprogram(name: "pow", scope: !302, file: !302, line: 140, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !347, file: !305, line: 421)
!347 = !DISubprogram(name: "sin", scope: !302, file: !302, line: 64, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !349, file: !305, line: 440)
!349 = !DISubprogram(name: "sinh", scope: !302, file: !302, line: 73, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !351, file: !305, line: 459)
!351 = !DISubprogram(name: "sqrt", scope: !302, file: !302, line: 143, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !353, file: !305, line: 478)
!353 = !DISubprogram(name: "tan", scope: !302, file: !302, line: 66, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !355, file: !305, line: 497)
!355 = !DISubprogram(name: "tanh", scope: !302, file: !302, line: 75, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !357, file: !359, line: 127)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !298, line: 62, baseType: !358)
!358 = !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!359 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cstdlib", directory: "")
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !361, file: !359, line: 128)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !298, line: 70, baseType: !362)
!362 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !363, identifier: "_ZTS6ldiv_t")
!363 = !{!364, !365}
!364 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !362, file: !298, line: 68, baseType: !208, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !362, file: !298, line: 69, baseType: !208, size: 64, offset: 64)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !367, file: !359, line: 130)
!367 = !DISubprogram(name: "abort", scope: !298, file: !298, line: 591, type: !368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!368 = !DISubroutineType(types: !369)
!369 = !{null}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !371, file: !359, line: 134)
!371 = !DISubprogram(name: "atexit", scope: !298, file: !298, line: 595, type: !372, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DISubroutineType(types: !373)
!373 = !{!110, !374}
!374 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 64)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !376, file: !359, line: 140)
!376 = !DISubprogram(name: "atof", scope: !298, file: !298, line: 101, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !378, file: !359, line: 141)
!378 = !DISubprogram(name: "atoi", scope: !298, file: !298, line: 104, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DISubroutineType(types: !380)
!380 = !{!110, !251}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !382, file: !359, line: 142)
!382 = !DISubprogram(name: "atol", scope: !298, file: !298, line: 107, type: !383, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DISubroutineType(types: !384)
!384 = !{!208, !251}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !386, file: !359, line: 143)
!386 = !DISubprogram(name: "bsearch", scope: !298, file: !298, line: 820, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DISubroutineType(types: !388)
!388 = !{!101, !389, !389, !391, !391, !394}
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !390, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !392, line: 46, baseType: !393)
!392 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/stddef.h", directory: "")
!393 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !298, line: 808, baseType: !395)
!395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !396, size: 64)
!396 = !DISubroutineType(types: !397)
!397 = !{!110, !389, !389}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !399, file: !359, line: 144)
!399 = !DISubprogram(name: "calloc", scope: !298, file: !298, line: 542, type: !400, flags: DIFlagPrototyped, spFlags: 0)
!400 = !DISubroutineType(types: !401)
!401 = !{!101, !391, !391}
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !403, file: !359, line: 145)
!403 = !DISubprogram(name: "div", scope: !298, file: !298, line: 852, type: !404, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DISubroutineType(types: !405)
!405 = !{!357, !110, !110}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !407, file: !359, line: 146)
!407 = !DISubprogram(name: "exit", scope: !298, file: !298, line: 617, type: !408, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!408 = !DISubroutineType(types: !409)
!409 = !{null, !110}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !411, file: !359, line: 147)
!411 = !DISubprogram(name: "free", scope: !298, file: !298, line: 565, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{null, !101}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !415, file: !359, line: 148)
!415 = !DISubprogram(name: "getenv", scope: !298, file: !298, line: 634, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DISubroutineType(types: !417)
!417 = !{!418, !251}
!418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !420, file: !359, line: 149)
!420 = !DISubprogram(name: "labs", scope: !298, file: !298, line: 841, type: !206, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !422, file: !359, line: 150)
!422 = !DISubprogram(name: "ldiv", scope: !298, file: !298, line: 854, type: !423, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!361, !208, !208}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !426, file: !359, line: 151)
!426 = !DISubprogram(name: "malloc", scope: !298, file: !298, line: 539, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{!101, !391}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !430, file: !359, line: 153)
!430 = !DISubprogram(name: "mblen", scope: !298, file: !298, line: 922, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{!110, !251, !391}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !434, file: !359, line: 154)
!434 = !DISubprogram(name: "mbstowcs", scope: !298, file: !298, line: 933, type: !435, flags: DIFlagPrototyped, spFlags: 0)
!435 = !DISubroutineType(types: !436)
!436 = !{!391, !437, !440, !391}
!437 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !438)
!438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !439, size: 64)
!439 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!440 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !251)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !442, file: !359, line: 155)
!442 = !DISubprogram(name: "mbtowc", scope: !298, file: !298, line: 925, type: !443, flags: DIFlagPrototyped, spFlags: 0)
!443 = !DISubroutineType(types: !444)
!444 = !{!110, !437, !440, !391}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !446, file: !359, line: 157)
!446 = !DISubprogram(name: "qsort", scope: !298, file: !298, line: 830, type: !447, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DISubroutineType(types: !448)
!448 = !{null, !101, !391, !391, !394}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !450, file: !359, line: 163)
!450 = !DISubprogram(name: "rand", scope: !298, file: !298, line: 453, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DISubroutineType(types: !452)
!452 = !{!110}
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !454, file: !359, line: 164)
!454 = !DISubprogram(name: "realloc", scope: !298, file: !298, line: 550, type: !455, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{!101, !101, !391}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !458, file: !359, line: 165)
!458 = !DISubprogram(name: "srand", scope: !298, file: !298, line: 455, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !9}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !462, file: !359, line: 166)
!462 = !DISubprogram(name: "strtod", scope: !298, file: !298, line: 117, type: !463, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DISubroutineType(types: !464)
!464 = !{!100, !440, !465}
!465 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !466)
!466 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !468, file: !359, line: 167)
!468 = !DISubprogram(name: "strtol", scope: !298, file: !298, line: 176, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!208, !440, !465, !110}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !472, file: !359, line: 168)
!472 = !DISubprogram(name: "strtoul", scope: !298, file: !298, line: 180, type: !473, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DISubroutineType(types: !474)
!474 = !{!393, !440, !465, !110}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !476, file: !359, line: 169)
!476 = !DISubprogram(name: "system", scope: !298, file: !298, line: 784, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !478, file: !359, line: 171)
!478 = !DISubprogram(name: "wcstombs", scope: !298, file: !298, line: 936, type: !479, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DISubroutineType(types: !480)
!480 = !{!391, !481, !482, !391}
!481 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !418)
!482 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !483)
!483 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !484, size: 64)
!484 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !439)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !486, file: !359, line: 172)
!486 = !DISubprogram(name: "wctomb", scope: !298, file: !298, line: 929, type: !487, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{!110, !418, !439}
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !491, file: !359, line: 200)
!490 = !DINamespace(name: "__gnu_cxx", scope: null)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !298, line: 80, baseType: !492)
!492 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !493, identifier: "_ZTS7lldiv_t")
!493 = !{!494, !495}
!494 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !492, file: !298, line: 78, baseType: !219, size: 64)
!495 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !492, file: !298, line: 79, baseType: !219, size: 64, offset: 64)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !497, file: !359, line: 206)
!497 = !DISubprogram(name: "_Exit", scope: !298, file: !298, line: 629, type: !408, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !499, file: !359, line: 210)
!499 = !DISubprogram(name: "llabs", scope: !298, file: !298, line: 844, type: !217, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !501, file: !359, line: 216)
!501 = !DISubprogram(name: "lldiv", scope: !298, file: !298, line: 858, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DISubroutineType(types: !503)
!503 = !{!491, !219, !219}
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !505, file: !359, line: 227)
!505 = !DISubprogram(name: "atoll", scope: !298, file: !298, line: 112, type: !506, flags: DIFlagPrototyped, spFlags: 0)
!506 = !DISubroutineType(types: !507)
!507 = !{!219, !251}
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !509, file: !359, line: 228)
!509 = !DISubprogram(name: "strtoll", scope: !298, file: !298, line: 200, type: !510, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{!219, !440, !465, !110}
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !513, file: !359, line: 229)
!513 = !DISubprogram(name: "strtoull", scope: !298, file: !298, line: 205, type: !514, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DISubroutineType(types: !515)
!515 = !{!516, !440, !465, !110}
!516 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !518, file: !359, line: 231)
!518 = !DISubprogram(name: "strtof", scope: !298, file: !298, line: 123, type: !519, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DISubroutineType(types: !520)
!520 = !{!115, !440, !465}
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !522, file: !359, line: 232)
!522 = !DISubprogram(name: "strtold", scope: !298, file: !298, line: 126, type: !523, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DISubroutineType(types: !524)
!524 = !{!525, !440, !465}
!525 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !491, file: !359, line: 240)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !497, file: !359, line: 242)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !499, file: !359, line: 244)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !530, file: !359, line: 245)
!530 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !490, file: !359, line: 213, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !501, file: !359, line: 246)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !505, file: !359, line: 248)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !518, file: !359, line: 249)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !509, file: !359, line: 250)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !513, file: !359, line: 251)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !522, file: !359, line: 252)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !367, file: !538, line: 38)
!538 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/stdlib.h", directory: "")
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !371, file: !538, line: 39)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !407, file: !538, line: 40)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !357, file: !538, line: 51)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !361, file: !538, line: 52)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !544, file: !538, line: 54)
!544 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !105, file: !299, line: 79, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!545 = !DISubroutineType(types: !546)
!546 = !{!525, !525}
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !376, file: !538, line: 55)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !378, file: !538, line: 56)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !382, file: !538, line: 57)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !386, file: !538, line: 58)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !399, file: !538, line: 59)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !530, file: !538, line: 60)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !411, file: !538, line: 61)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !415, file: !538, line: 62)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !420, file: !538, line: 63)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !422, file: !538, line: 64)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !426, file: !538, line: 65)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !430, file: !538, line: 67)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !434, file: !538, line: 68)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !442, file: !538, line: 69)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !446, file: !538, line: 71)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !450, file: !538, line: 72)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !454, file: !538, line: 73)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !458, file: !538, line: 74)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !462, file: !538, line: 75)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !468, file: !538, line: 76)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !472, file: !538, line: 77)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !476, file: !538, line: 78)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !478, file: !538, line: 80)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !486, file: !538, line: 81)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !572, file: !574, line: 414)
!572 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !573, file: !573, line: 1126, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!573 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "")
!574 = !DIFile(filename: "/scratch/ah7226/install-9-cudafe/lib/clang/9.0.0/include/__clang_cuda_cmath.h", directory: "")
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !576, file: !574, line: 415)
!576 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !573, file: !573, line: 1154, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !578, file: !574, line: 416)
!578 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !573, file: !573, line: 1121, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !580, file: !574, line: 417)
!580 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !573, file: !573, line: 1159, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !582, file: !574, line: 418)
!582 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !573, file: !573, line: 1111, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !584, file: !574, line: 419)
!584 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !573, file: !573, line: 1116, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !586, file: !574, line: 420)
!586 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !573, file: !573, line: 1164, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !588, file: !574, line: 421)
!588 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !573, file: !573, line: 1199, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !590, file: !574, line: 422)
!590 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !591, file: !591, line: 647, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!591 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "")
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !593, file: !574, line: 423)
!593 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !573, file: !573, line: 973, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !595, file: !574, line: 424)
!595 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !573, file: !573, line: 1027, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !597, file: !574, line: 425)
!597 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !573, file: !573, line: 1096, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !599, file: !574, line: 426)
!599 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !573, file: !573, line: 1259, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !601, file: !574, line: 427)
!601 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !573, file: !573, line: 1249, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !603, file: !574, line: 428)
!603 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !591, file: !591, line: 637, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !605, file: !574, line: 429)
!605 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !573, file: !573, line: 1078, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !607, file: !574, line: 430)
!607 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !573, file: !573, line: 1169, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !609, file: !574, line: 431)
!609 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !591, file: !591, line: 582, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !611, file: !574, line: 432)
!611 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !573, file: !573, line: 1385, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !613, file: !574, line: 433)
!613 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !591, file: !591, line: 572, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !615, file: !574, line: 434)
!615 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !573, file: !573, line: 1337, type: !158, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !617, file: !574, line: 435)
!617 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !591, file: !591, line: 602, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !619, file: !574, line: 436)
!619 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !591, file: !591, line: 597, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !621, file: !574, line: 437)
!621 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !573, file: !573, line: 1322, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !623, file: !574, line: 438)
!623 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !573, file: !573, line: 1312, type: !172, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !625, file: !574, line: 439)
!625 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !573, file: !573, line: 1174, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !627, file: !574, line: 440)
!627 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !573, file: !573, line: 1390, type: !168, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !629, file: !574, line: 441)
!629 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !573, file: !573, line: 1289, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !631, file: !574, line: 442)
!631 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !573, file: !573, line: 1284, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !633, file: !574, line: 443)
!633 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !573, file: !573, line: 933, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !635, file: !574, line: 444)
!635 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !573, file: !573, line: 1371, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !637, file: !574, line: 445)
!637 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !573, file: !573, line: 1140, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !639, file: !574, line: 446)
!639 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !573, file: !573, line: 1149, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !641, file: !574, line: 447)
!641 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !573, file: !573, line: 1069, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !643, file: !574, line: 448)
!643 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !573, file: !573, line: 1395, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !645, file: !574, line: 449)
!645 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !573, file: !573, line: 1131, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !647, file: !574, line: 450)
!647 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !573, file: !573, line: 924, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !649, file: !574, line: 451)
!649 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !573, file: !573, line: 1376, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !651, file: !574, line: 452)
!651 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !573, file: !573, line: 1317, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !653, file: !574, line: 453)
!653 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !573, file: !573, line: 938, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !655, file: !574, line: 454)
!655 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !573, file: !573, line: 1002, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !657, file: !574, line: 455)
!657 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !573, file: !573, line: 1352, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !659, file: !574, line: 456)
!659 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !573, file: !573, line: 1327, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !661, file: !574, line: 457)
!661 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !573, file: !573, line: 1332, type: !268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !663, file: !574, line: 458)
!663 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !573, file: !573, line: 919, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !665, file: !574, line: 459)
!665 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !573, file: !573, line: 1366, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !667, file: !574, line: 462)
!667 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !573, file: !573, line: 1299, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !669, file: !574, line: 464)
!669 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !573, file: !573, line: 1294, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !671, file: !574, line: 465)
!671 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !573, file: !573, line: 1018, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !673, file: !574, line: 466)
!673 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !573, file: !573, line: 1101, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !675, file: !574, line: 467)
!675 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !591, file: !591, line: 887, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !677, file: !574, line: 468)
!677 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !573, file: !573, line: 1060, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !679, file: !574, line: 469)
!679 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !573, file: !573, line: 1106, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !681, file: !574, line: 470)
!681 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !573, file: !573, line: 1361, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !683, file: !574, line: 471)
!683 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !591, file: !591, line: 642, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !544, file: !685, line: 38)
!685 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/math.h", directory: "")
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !687, file: !685, line: 54)
!687 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !105, file: !305, line: 380, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!525, !525, !690}
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !525, size: 64)
!691 = !{!"clang version 9.0.0 (https://github.com/yebinchon/llvm-project a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!692 = distinct !DISubprogram(name: "kernel_dev", linkageName: "_Z10kernel_deviiiddPdS_S_", scope: !5, file: !5, line: 14, type: !693, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !110, !110, !100, !100, !99, !99, !99}
!695 = !{}
!696 = !DILocalVariable(name: "ni", arg: 1, scope: !692, file: !5, line: 14, type: !110)
!697 = !DILocation(line: 14, column: 32, scope: !692)
!698 = !DILocalVariable(name: "nj", arg: 2, scope: !692, file: !5, line: 14, type: !110)
!699 = !DILocation(line: 14, column: 40, scope: !692)
!700 = !DILocalVariable(name: "nk", arg: 3, scope: !692, file: !5, line: 14, type: !110)
!701 = !DILocation(line: 14, column: 48, scope: !692)
!702 = !DILocalVariable(name: "alpha", arg: 4, scope: !692, file: !5, line: 15, type: !100)
!703 = !DILocation(line: 15, column: 35, scope: !692)
!704 = !DILocalVariable(name: "beta", arg: 5, scope: !692, file: !5, line: 16, type: !100)
!705 = !DILocation(line: 16, column: 35, scope: !692)
!706 = !DILocalVariable(name: "C", arg: 6, scope: !692, file: !5, line: 17, type: !99)
!707 = !DILocation(line: 17, column: 36, scope: !692)
!708 = !DILocalVariable(name: "A", arg: 7, scope: !692, file: !5, line: 17, type: !99)
!709 = !DILocation(line: 17, column: 47, scope: !692)
!710 = !DILocalVariable(name: "B", arg: 8, scope: !692, file: !5, line: 17, type: !99)
!711 = !DILocation(line: 17, column: 58, scope: !692)
!712 = !DILocation(line: 17, column: 61, scope: !692)
!713 = !DILocation(line: 30, column: 1, scope: !692)
!714 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 86, type: !715, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!715 = !DISubroutineType(types: !716)
!716 = !{!110, !110, !466}
!717 = !DILocalVariable(name: "argc", arg: 1, scope: !714, file: !5, line: 86, type: !110)
!718 = !DILocation(line: 86, column: 14, scope: !714)
!719 = !DILocalVariable(name: "argv", arg: 2, scope: !714, file: !5, line: 86, type: !466)
!720 = !DILocation(line: 86, column: 27, scope: !714)
!721 = !DILocalVariable(name: "dump_code", scope: !714, file: !5, line: 89, type: !110)
!722 = !DILocation(line: 89, column: 7, scope: !714)
!723 = !DILocation(line: 89, column: 24, scope: !714)
!724 = !DILocation(line: 89, column: 19, scope: !714)
!725 = !DILocalVariable(name: "ni", scope: !714, file: !5, line: 90, type: !110)
!726 = !DILocation(line: 90, column: 7, scope: !714)
!727 = !DILocation(line: 90, column: 17, scope: !714)
!728 = !DILocation(line: 90, column: 12, scope: !714)
!729 = !DILocalVariable(name: "nj", scope: !714, file: !5, line: 91, type: !110)
!730 = !DILocation(line: 91, column: 7, scope: !714)
!731 = !DILocation(line: 91, column: 17, scope: !714)
!732 = !DILocation(line: 91, column: 12, scope: !714)
!733 = !DILocalVariable(name: "nk", scope: !714, file: !5, line: 92, type: !110)
!734 = !DILocation(line: 92, column: 7, scope: !714)
!735 = !DILocation(line: 92, column: 17, scope: !714)
!736 = !DILocation(line: 92, column: 12, scope: !714)
!737 = !DILocalVariable(name: "A", scope: !714, file: !5, line: 94, type: !99)
!738 = !DILocation(line: 94, column: 11, scope: !714)
!739 = !DILocation(line: 94, column: 31, scope: !714)
!740 = !DILocation(line: 94, column: 34, scope: !714)
!741 = !DILocation(line: 94, column: 33, scope: !714)
!742 = !DILocation(line: 94, column: 36, scope: !714)
!743 = !DILocation(line: 94, column: 24, scope: !714)
!744 = !DILocation(line: 94, column: 15, scope: !714)
!745 = !DILocalVariable(name: "B", scope: !714, file: !5, line: 95, type: !99)
!746 = !DILocation(line: 95, column: 11, scope: !714)
!747 = !DILocation(line: 95, column: 31, scope: !714)
!748 = !DILocation(line: 95, column: 34, scope: !714)
!749 = !DILocation(line: 95, column: 33, scope: !714)
!750 = !DILocation(line: 95, column: 36, scope: !714)
!751 = !DILocation(line: 95, column: 24, scope: !714)
!752 = !DILocation(line: 95, column: 15, scope: !714)
!753 = !DILocalVariable(name: "C", scope: !714, file: !5, line: 96, type: !99)
!754 = !DILocation(line: 96, column: 11, scope: !714)
!755 = !DILocation(line: 96, column: 31, scope: !714)
!756 = !DILocation(line: 96, column: 34, scope: !714)
!757 = !DILocation(line: 96, column: 33, scope: !714)
!758 = !DILocation(line: 96, column: 36, scope: !714)
!759 = !DILocation(line: 96, column: 24, scope: !714)
!760 = !DILocation(line: 96, column: 15, scope: !714)
!761 = !DILocalVariable(name: "alpha", scope: !714, file: !5, line: 98, type: !100)
!762 = !DILocation(line: 98, column: 10, scope: !714)
!763 = !DILocalVariable(name: "beta", scope: !714, file: !5, line: 99, type: !100)
!764 = !DILocation(line: 99, column: 10, scope: !714)
!765 = !DILocation(line: 101, column: 15, scope: !714)
!766 = !DILocation(line: 101, column: 19, scope: !714)
!767 = !DILocation(line: 101, column: 23, scope: !714)
!768 = !DILocation(line: 102, column: 7, scope: !714)
!769 = !DILocation(line: 103, column: 7, scope: !714)
!770 = !DILocation(line: 104, column: 7, scope: !714)
!771 = !DILocation(line: 101, column: 3, scope: !714)
!772 = !DILocalVariable(name: "dev_A", scope: !714, file: !5, line: 107, type: !99)
!773 = !DILocation(line: 107, column: 11, scope: !714)
!774 = !DILocalVariable(name: "dev_B", scope: !714, file: !5, line: 108, type: !99)
!775 = !DILocation(line: 108, column: 11, scope: !714)
!776 = !DILocalVariable(name: "dev_C", scope: !714, file: !5, line: 109, type: !99)
!777 = !DILocation(line: 109, column: 11, scope: !714)
!778 = !DILocation(line: 110, column: 22, scope: !714)
!779 = !DILocation(line: 110, column: 25, scope: !714)
!780 = !DILocation(line: 110, column: 24, scope: !714)
!781 = !DILocation(line: 110, column: 27, scope: !714)
!782 = !DILocation(line: 110, column: 3, scope: !714)
!783 = !DILocation(line: 111, column: 22, scope: !714)
!784 = !DILocation(line: 111, column: 25, scope: !714)
!785 = !DILocation(line: 111, column: 24, scope: !714)
!786 = !DILocation(line: 111, column: 27, scope: !714)
!787 = !DILocation(line: 111, column: 3, scope: !714)
!788 = !DILocation(line: 112, column: 22, scope: !714)
!789 = !DILocation(line: 112, column: 25, scope: !714)
!790 = !DILocation(line: 112, column: 24, scope: !714)
!791 = !DILocation(line: 112, column: 27, scope: !714)
!792 = !DILocation(line: 112, column: 3, scope: !714)
!793 = !DILocation(line: 113, column: 14, scope: !714)
!794 = !DILocation(line: 113, column: 21, scope: !714)
!795 = !DILocation(line: 113, column: 24, scope: !714)
!796 = !DILocation(line: 113, column: 27, scope: !714)
!797 = !DILocation(line: 113, column: 26, scope: !714)
!798 = !DILocation(line: 113, column: 29, scope: !714)
!799 = !DILocation(line: 113, column: 3, scope: !714)
!800 = !DILocation(line: 114, column: 14, scope: !714)
!801 = !DILocation(line: 114, column: 21, scope: !714)
!802 = !DILocation(line: 114, column: 24, scope: !714)
!803 = !DILocation(line: 114, column: 27, scope: !714)
!804 = !DILocation(line: 114, column: 26, scope: !714)
!805 = !DILocation(line: 114, column: 29, scope: !714)
!806 = !DILocation(line: 114, column: 3, scope: !714)
!807 = !DILocation(line: 115, column: 14, scope: !714)
!808 = !DILocation(line: 115, column: 21, scope: !714)
!809 = !DILocation(line: 115, column: 24, scope: !714)
!810 = !DILocation(line: 115, column: 27, scope: !714)
!811 = !DILocation(line: 115, column: 26, scope: !714)
!812 = !DILocation(line: 115, column: 29, scope: !714)
!813 = !DILocation(line: 115, column: 3, scope: !714)
!814 = !DILocation(line: 118, column: 10, scope: !714)
!815 = !DILocation(line: 118, column: 14, scope: !714)
!816 = !DILocation(line: 118, column: 18, scope: !714)
!817 = !DILocation(line: 118, column: 22, scope: !714)
!818 = !DILocation(line: 118, column: 29, scope: !714)
!819 = !DILocation(line: 118, column: 35, scope: !714)
!820 = !DILocation(line: 118, column: 42, scope: !714)
!821 = !DILocation(line: 118, column: 49, scope: !714)
!822 = !DILocation(line: 118, column: 3, scope: !714)
!823 = !DILocation(line: 119, column: 14, scope: !714)
!824 = !DILocation(line: 119, column: 17, scope: !714)
!825 = !DILocation(line: 119, column: 24, scope: !714)
!826 = !DILocation(line: 119, column: 27, scope: !714)
!827 = !DILocation(line: 119, column: 26, scope: !714)
!828 = !DILocation(line: 119, column: 29, scope: !714)
!829 = !DILocation(line: 119, column: 3, scope: !714)
!830 = !DILocation(line: 124, column: 7, scope: !831)
!831 = distinct !DILexicalBlock(scope: !714, file: !5, line: 124, column: 7)
!832 = !DILocation(line: 124, column: 17, scope: !831)
!833 = !DILocation(line: 124, column: 7, scope: !714)
!834 = !DILocation(line: 124, column: 35, scope: !831)
!835 = !DILocation(line: 124, column: 39, scope: !831)
!836 = !DILocation(line: 124, column: 43, scope: !831)
!837 = !DILocation(line: 124, column: 23, scope: !831)
!838 = !DILocation(line: 127, column: 15, scope: !714)
!839 = !DILocation(line: 127, column: 3, scope: !714)
!840 = !DILocation(line: 128, column: 15, scope: !714)
!841 = !DILocation(line: 128, column: 3, scope: !714)
!842 = !DILocation(line: 129, column: 15, scope: !714)
!843 = !DILocation(line: 129, column: 3, scope: !714)
!844 = !DILocation(line: 130, column: 3, scope: !714)
!845 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiiiPdS_S_", scope: !5, file: !5, line: 49, type: !846, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!846 = !DISubroutineType(types: !847)
!847 = !{null, !110, !110, !110, !99, !99, !99}
!848 = !DILocalVariable(name: "ni", arg: 1, scope: !845, file: !5, line: 49, type: !110)
!849 = !DILocation(line: 49, column: 21, scope: !845)
!850 = !DILocalVariable(name: "nj", arg: 2, scope: !845, file: !5, line: 49, type: !110)
!851 = !DILocation(line: 49, column: 29, scope: !845)
!852 = !DILocalVariable(name: "nk", arg: 3, scope: !845, file: !5, line: 49, type: !110)
!853 = !DILocation(line: 49, column: 37, scope: !845)
!854 = !DILocalVariable(name: "C", arg: 4, scope: !845, file: !5, line: 50, type: !99)
!855 = !DILocation(line: 50, column: 13, scope: !845)
!856 = !DILocalVariable(name: "A", arg: 5, scope: !845, file: !5, line: 51, type: !99)
!857 = !DILocation(line: 51, column: 13, scope: !845)
!858 = !DILocalVariable(name: "B", arg: 6, scope: !845, file: !5, line: 52, type: !99)
!859 = !DILocation(line: 52, column: 13, scope: !845)
!860 = !DILocalVariable(name: "i", scope: !845, file: !5, line: 54, type: !110)
!861 = !DILocation(line: 54, column: 7, scope: !845)
!862 = !DILocalVariable(name: "j", scope: !845, file: !5, line: 54, type: !110)
!863 = !DILocation(line: 54, column: 10, scope: !845)
!864 = !DILocation(line: 57, column: 10, scope: !865)
!865 = distinct !DILexicalBlock(scope: !845, file: !5, line: 57, column: 3)
!866 = !DILocation(line: 57, column: 8, scope: !865)
!867 = !DILocation(line: 57, column: 15, scope: !868)
!868 = distinct !DILexicalBlock(scope: !865, file: !5, line: 57, column: 3)
!869 = !DILocation(line: 57, column: 19, scope: !868)
!870 = !DILocation(line: 57, column: 17, scope: !868)
!871 = !DILocation(line: 57, column: 3, scope: !865)
!872 = !DILocation(line: 58, column: 12, scope: !873)
!873 = distinct !DILexicalBlock(scope: !868, file: !5, line: 58, column: 5)
!874 = !DILocation(line: 58, column: 10, scope: !873)
!875 = !DILocation(line: 58, column: 17, scope: !876)
!876 = distinct !DILexicalBlock(scope: !873, file: !5, line: 58, column: 5)
!877 = !DILocation(line: 58, column: 21, scope: !876)
!878 = !DILocation(line: 58, column: 19, scope: !876)
!879 = !DILocation(line: 58, column: 5, scope: !873)
!880 = !DILocation(line: 59, column: 29, scope: !876)
!881 = !DILocation(line: 59, column: 31, scope: !876)
!882 = !DILocation(line: 59, column: 30, scope: !876)
!883 = !DILocation(line: 59, column: 36, scope: !876)
!884 = !DILocation(line: 59, column: 34, scope: !876)
!885 = !DILocation(line: 59, column: 7, scope: !876)
!886 = !DILocation(line: 59, column: 9, scope: !876)
!887 = !DILocation(line: 59, column: 11, scope: !876)
!888 = !DILocation(line: 59, column: 10, scope: !876)
!889 = !DILocation(line: 59, column: 14, scope: !876)
!890 = !DILocation(line: 59, column: 13, scope: !876)
!891 = !DILocation(line: 59, column: 17, scope: !876)
!892 = !DILocation(line: 58, column: 26, scope: !876)
!893 = !DILocation(line: 58, column: 5, scope: !876)
!894 = distinct !{!894, !879, !895}
!895 = !DILocation(line: 59, column: 36, scope: !873)
!896 = !DILocation(line: 57, column: 24, scope: !868)
!897 = !DILocation(line: 57, column: 3, scope: !868)
!898 = distinct !{!898, !871, !899}
!899 = !DILocation(line: 59, column: 36, scope: !865)
!900 = !DILocation(line: 60, column: 10, scope: !901)
!901 = distinct !DILexicalBlock(scope: !845, file: !5, line: 60, column: 3)
!902 = !DILocation(line: 60, column: 8, scope: !901)
!903 = !DILocation(line: 60, column: 15, scope: !904)
!904 = distinct !DILexicalBlock(scope: !901, file: !5, line: 60, column: 3)
!905 = !DILocation(line: 60, column: 19, scope: !904)
!906 = !DILocation(line: 60, column: 17, scope: !904)
!907 = !DILocation(line: 60, column: 3, scope: !901)
!908 = !DILocation(line: 61, column: 12, scope: !909)
!909 = distinct !DILexicalBlock(scope: !904, file: !5, line: 61, column: 5)
!910 = !DILocation(line: 61, column: 10, scope: !909)
!911 = !DILocation(line: 61, column: 17, scope: !912)
!912 = distinct !DILexicalBlock(scope: !909, file: !5, line: 61, column: 5)
!913 = !DILocation(line: 61, column: 21, scope: !912)
!914 = !DILocation(line: 61, column: 19, scope: !912)
!915 = !DILocation(line: 61, column: 5, scope: !909)
!916 = !DILocation(line: 62, column: 29, scope: !912)
!917 = !DILocation(line: 62, column: 31, scope: !912)
!918 = !DILocation(line: 62, column: 30, scope: !912)
!919 = !DILocation(line: 62, column: 36, scope: !912)
!920 = !DILocation(line: 62, column: 34, scope: !912)
!921 = !DILocation(line: 62, column: 7, scope: !912)
!922 = !DILocation(line: 62, column: 9, scope: !912)
!923 = !DILocation(line: 62, column: 11, scope: !912)
!924 = !DILocation(line: 62, column: 10, scope: !912)
!925 = !DILocation(line: 62, column: 14, scope: !912)
!926 = !DILocation(line: 62, column: 13, scope: !912)
!927 = !DILocation(line: 62, column: 17, scope: !912)
!928 = !DILocation(line: 61, column: 26, scope: !912)
!929 = !DILocation(line: 61, column: 5, scope: !912)
!930 = distinct !{!930, !915, !931}
!931 = !DILocation(line: 62, column: 36, scope: !909)
!932 = !DILocation(line: 60, column: 24, scope: !904)
!933 = !DILocation(line: 60, column: 3, scope: !904)
!934 = distinct !{!934, !907, !935}
!935 = !DILocation(line: 62, column: 36, scope: !901)
!936 = !DILocation(line: 63, column: 10, scope: !937)
!937 = distinct !DILexicalBlock(scope: !845, file: !5, line: 63, column: 3)
!938 = !DILocation(line: 63, column: 8, scope: !937)
!939 = !DILocation(line: 63, column: 15, scope: !940)
!940 = distinct !DILexicalBlock(scope: !937, file: !5, line: 63, column: 3)
!941 = !DILocation(line: 63, column: 19, scope: !940)
!942 = !DILocation(line: 63, column: 17, scope: !940)
!943 = !DILocation(line: 63, column: 3, scope: !937)
!944 = !DILocation(line: 64, column: 12, scope: !945)
!945 = distinct !DILexicalBlock(scope: !940, file: !5, line: 64, column: 5)
!946 = !DILocation(line: 64, column: 10, scope: !945)
!947 = !DILocation(line: 64, column: 17, scope: !948)
!948 = distinct !DILexicalBlock(scope: !945, file: !5, line: 64, column: 5)
!949 = !DILocation(line: 64, column: 21, scope: !948)
!950 = !DILocation(line: 64, column: 19, scope: !948)
!951 = !DILocation(line: 64, column: 5, scope: !945)
!952 = !DILocation(line: 65, column: 29, scope: !948)
!953 = !DILocation(line: 65, column: 31, scope: !948)
!954 = !DILocation(line: 65, column: 30, scope: !948)
!955 = !DILocation(line: 65, column: 36, scope: !948)
!956 = !DILocation(line: 65, column: 34, scope: !948)
!957 = !DILocation(line: 65, column: 7, scope: !948)
!958 = !DILocation(line: 65, column: 9, scope: !948)
!959 = !DILocation(line: 65, column: 11, scope: !948)
!960 = !DILocation(line: 65, column: 10, scope: !948)
!961 = !DILocation(line: 65, column: 14, scope: !948)
!962 = !DILocation(line: 65, column: 13, scope: !948)
!963 = !DILocation(line: 65, column: 17, scope: !948)
!964 = !DILocation(line: 64, column: 26, scope: !948)
!965 = !DILocation(line: 64, column: 5, scope: !948)
!966 = distinct !{!966, !951, !967}
!967 = !DILocation(line: 65, column: 36, scope: !945)
!968 = !DILocation(line: 63, column: 24, scope: !940)
!969 = !DILocation(line: 63, column: 3, scope: !940)
!970 = distinct !{!970, !943, !971}
!971 = !DILocation(line: 65, column: 36, scope: !937)
!972 = !DILocation(line: 66, column: 1, scope: !845)
!973 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !974, file: !974, line: 490, type: !975, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !979, retainedNodes: !695)
!974 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!975 = !DISubroutineType(types: !976)
!976 = !{!977, !978, !391}
!977 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!978 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!979 = !{!980}
!980 = !DITemplateTypeParameter(name: "T", type: !100)
!981 = !DILocalVariable(name: "devPtr", arg: 1, scope: !973, file: !974, line: 491, type: !978)
!982 = !DILocation(line: 491, column: 12, scope: !973)
!983 = !DILocalVariable(name: "size", arg: 2, scope: !973, file: !974, line: 492, type: !391)
!984 = !DILocation(line: 492, column: 12, scope: !973)
!985 = !DILocation(line: 495, column: 38, scope: !973)
!986 = !DILocation(line: 495, column: 23, scope: !973)
!987 = !DILocation(line: 495, column: 46, scope: !973)
!988 = !DILocation(line: 495, column: 10, scope: !973)
!989 = !DILocation(line: 495, column: 3, scope: !973)
!990 = distinct !DISubprogram(name: "kernel", linkageName: "_ZL6kerneliiiddPdS_S_", scope: !5, file: !5, line: 37, type: !693, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!991 = !DILocalVariable(name: "ni", arg: 1, scope: !990, file: !5, line: 37, type: !110)
!992 = !DILocation(line: 37, column: 24, scope: !990)
!993 = !DILocalVariable(name: "nj", arg: 2, scope: !990, file: !5, line: 37, type: !110)
!994 = !DILocation(line: 37, column: 32, scope: !990)
!995 = !DILocalVariable(name: "nk", arg: 3, scope: !990, file: !5, line: 37, type: !110)
!996 = !DILocation(line: 37, column: 40, scope: !990)
!997 = !DILocalVariable(name: "alpha", arg: 4, scope: !990, file: !5, line: 38, type: !100)
!998 = !DILocation(line: 38, column: 27, scope: !990)
!999 = !DILocalVariable(name: "beta", arg: 5, scope: !990, file: !5, line: 39, type: !100)
!1000 = !DILocation(line: 39, column: 27, scope: !990)
!1001 = !DILocalVariable(name: "C", arg: 6, scope: !990, file: !5, line: 40, type: !99)
!1002 = !DILocation(line: 40, column: 28, scope: !990)
!1003 = !DILocalVariable(name: "A", arg: 7, scope: !990, file: !5, line: 40, type: !99)
!1004 = !DILocation(line: 40, column: 39, scope: !990)
!1005 = !DILocalVariable(name: "B", arg: 8, scope: !990, file: !5, line: 40, type: !99)
!1006 = !DILocation(line: 40, column: 50, scope: !990)
!1007 = !DILocalVariable(name: "threadsPerBlock", scope: !990, file: !5, line: 42, type: !9)
!1008 = !DILocation(line: 42, column: 12, scope: !990)
!1009 = !DILocalVariable(name: "block", scope: !990, file: !5, line: 43, type: !1010)
!1010 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1011, line: 427, baseType: !1012)
!1011 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!1012 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1011, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1013, identifier: "_ZTS4dim3")
!1013 = !{!1014, !1015, !1016, !1017, !1021, !1030}
!1014 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1012, file: !1011, line: 419, baseType: !9, size: 32)
!1015 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1012, file: !1011, line: 419, baseType: !9, size: 32, offset: 32)
!1016 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1012, file: !1011, line: 419, baseType: !9, size: 32, offset: 64)
!1017 = !DISubprogram(name: "dim3", scope: !1012, file: !1011, line: 421, type: !1018, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{null, !1020, !9, !9, !9}
!1020 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1012, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1021 = !DISubprogram(name: "dim3", scope: !1012, file: !1011, line: 422, type: !1022, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{null, !1020, !1024}
!1024 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1011, line: 383, baseType: !1025)
!1025 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1011, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1026, identifier: "_ZTS5uint3")
!1026 = !{!1027, !1028, !1029}
!1027 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1025, file: !1011, line: 192, baseType: !9, size: 32)
!1028 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1025, file: !1011, line: 192, baseType: !9, size: 32, offset: 32)
!1029 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1025, file: !1011, line: 192, baseType: !9, size: 32, offset: 64)
!1030 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1012, file: !1011, line: 423, type: !1031, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!1024, !1020}
!1033 = !DILocation(line: 43, column: 8, scope: !990)
!1034 = !DILocation(line: 43, column: 14, scope: !990)
!1035 = !DILocation(line: 43, column: 30, scope: !990)
!1036 = !DILocalVariable(name: "grid", scope: !990, file: !5, line: 44, type: !1010)
!1037 = !DILocation(line: 44, column: 8, scope: !990)
!1038 = !DILocation(line: 44, column: 24, scope: !990)
!1039 = !DILocation(line: 44, column: 34, scope: !990)
!1040 = !DILocation(line: 44, column: 13, scope: !990)
!1041 = !DILocation(line: 44, column: 49, scope: !990)
!1042 = !DILocation(line: 44, column: 59, scope: !990)
!1043 = !DILocation(line: 44, column: 38, scope: !990)
!1044 = !DILocation(line: 45, column: 16, scope: !990)
!1045 = !DILocation(line: 45, column: 22, scope: !990)
!1046 = !DILocation(line: 45, column: 13, scope: !990)
!1047 = !DILocation(line: 45, column: 3, scope: !990)
!1048 = !DILocation(line: 45, column: 31, scope: !990)
!1049 = !DILocation(line: 45, column: 35, scope: !990)
!1050 = !DILocation(line: 45, column: 39, scope: !990)
!1051 = !DILocation(line: 45, column: 43, scope: !990)
!1052 = !DILocation(line: 45, column: 50, scope: !990)
!1053 = !DILocation(line: 45, column: 56, scope: !990)
!1054 = !DILocation(line: 45, column: 59, scope: !990)
!1055 = !DILocation(line: 45, column: 62, scope: !990)
!1056 = !DILocation(line: 46, column: 1, scope: !990)
!1057 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiiPd", scope: !5, file: !5, line: 72, type: !1058, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{null, !110, !110, !99}
!1060 = !DILocalVariable(name: "ni", arg: 1, scope: !1057, file: !5, line: 72, type: !110)
!1061 = !DILocation(line: 72, column: 22, scope: !1057)
!1062 = !DILocalVariable(name: "nj", arg: 2, scope: !1057, file: !5, line: 72, type: !110)
!1063 = !DILocation(line: 72, column: 30, scope: !1057)
!1064 = !DILocalVariable(name: "C", arg: 3, scope: !1057, file: !5, line: 73, type: !99)
!1065 = !DILocation(line: 73, column: 13, scope: !1057)
!1066 = !DILocalVariable(name: "i", scope: !1057, file: !5, line: 75, type: !110)
!1067 = !DILocation(line: 75, column: 7, scope: !1057)
!1068 = !DILocalVariable(name: "j", scope: !1057, file: !5, line: 75, type: !110)
!1069 = !DILocation(line: 75, column: 10, scope: !1057)
!1070 = !DILocation(line: 77, column: 10, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1057, file: !5, line: 77, column: 3)
!1072 = !DILocation(line: 77, column: 8, scope: !1071)
!1073 = !DILocation(line: 77, column: 15, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1071, file: !5, line: 77, column: 3)
!1075 = !DILocation(line: 77, column: 19, scope: !1074)
!1076 = !DILocation(line: 77, column: 17, scope: !1074)
!1077 = !DILocation(line: 77, column: 3, scope: !1071)
!1078 = !DILocation(line: 78, column: 12, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1074, file: !5, line: 78, column: 5)
!1080 = !DILocation(line: 78, column: 10, scope: !1079)
!1081 = !DILocation(line: 78, column: 17, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1079, file: !5, line: 78, column: 5)
!1083 = !DILocation(line: 78, column: 21, scope: !1082)
!1084 = !DILocation(line: 78, column: 19, scope: !1082)
!1085 = !DILocation(line: 78, column: 5, scope: !1079)
!1086 = !DILocation(line: 79, column: 16, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1082, file: !5, line: 78, column: 30)
!1088 = !DILocation(line: 79, column: 35, scope: !1087)
!1089 = !DILocation(line: 79, column: 37, scope: !1087)
!1090 = !DILocation(line: 79, column: 39, scope: !1087)
!1091 = !DILocation(line: 79, column: 38, scope: !1087)
!1092 = !DILocation(line: 79, column: 42, scope: !1087)
!1093 = !DILocation(line: 79, column: 41, scope: !1087)
!1094 = !DILocation(line: 79, column: 7, scope: !1087)
!1095 = !DILocation(line: 80, column: 12, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1087, file: !5, line: 80, column: 11)
!1097 = !DILocation(line: 80, column: 16, scope: !1096)
!1098 = !DILocation(line: 80, column: 14, scope: !1096)
!1099 = !DILocation(line: 80, column: 21, scope: !1096)
!1100 = !DILocation(line: 80, column: 19, scope: !1096)
!1101 = !DILocation(line: 80, column: 24, scope: !1096)
!1102 = !DILocation(line: 80, column: 29, scope: !1096)
!1103 = !DILocation(line: 80, column: 11, scope: !1087)
!1104 = !DILocation(line: 80, column: 44, scope: !1096)
!1105 = !DILocation(line: 80, column: 35, scope: !1096)
!1106 = !DILocation(line: 81, column: 5, scope: !1087)
!1107 = !DILocation(line: 78, column: 26, scope: !1082)
!1108 = !DILocation(line: 78, column: 5, scope: !1082)
!1109 = distinct !{!1109, !1085, !1110}
!1110 = !DILocation(line: 81, column: 5, scope: !1079)
!1111 = !DILocation(line: 77, column: 24, scope: !1074)
!1112 = !DILocation(line: 77, column: 3, scope: !1074)
!1113 = distinct !{!1113, !1077, !1114}
!1114 = !DILocation(line: 81, column: 5, scope: !1071)
!1115 = !DILocation(line: 82, column: 12, scope: !1057)
!1116 = !DILocation(line: 82, column: 3, scope: !1057)
!1117 = !DILocation(line: 83, column: 1, scope: !1057)
!1118 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1012, file: !1011, line: 421, type: !1018, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !1017, retainedNodes: !695)
!1119 = !DILocalVariable(name: "this", arg: 1, scope: !1118, type: !1120, flags: DIFlagArtificial | DIFlagObjectPointer)
!1120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1012, size: 64)
!1121 = !DILocation(line: 0, scope: !1118)
!1122 = !DILocalVariable(name: "vx", arg: 2, scope: !1118, file: !1011, line: 421, type: !9)
!1123 = !DILocation(line: 421, column: 43, scope: !1118)
!1124 = !DILocalVariable(name: "vy", arg: 3, scope: !1118, file: !1011, line: 421, type: !9)
!1125 = !DILocation(line: 421, column: 64, scope: !1118)
!1126 = !DILocalVariable(name: "vz", arg: 4, scope: !1118, file: !1011, line: 421, type: !9)
!1127 = !DILocation(line: 421, column: 85, scope: !1118)
!1128 = !DILocation(line: 421, column: 95, scope: !1118)
!1129 = !DILocation(line: 421, column: 97, scope: !1118)
!1130 = !DILocation(line: 421, column: 102, scope: !1118)
!1131 = !DILocation(line: 421, column: 104, scope: !1118)
!1132 = !DILocation(line: 421, column: 109, scope: !1118)
!1133 = !DILocation(line: 421, column: 111, scope: !1118)
!1134 = !DILocation(line: 421, column: 116, scope: !1118)
!1135 = distinct !DISubprogram(name: "num_blocks", linkageName: "_ZL10num_blocksii", scope: !5, file: !5, line: 33, type: !1136, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!9, !110, !110}
!1138 = !DILocalVariable(name: "num", arg: 1, scope: !1135, file: !5, line: 33, type: !110)
!1139 = !DILocation(line: 33, column: 32, scope: !1135)
!1140 = !DILocalVariable(name: "factor", arg: 2, scope: !1135, file: !5, line: 33, type: !110)
!1141 = !DILocation(line: 33, column: 41, scope: !1135)
!1142 = !DILocation(line: 34, column: 11, scope: !1135)
!1143 = !DILocation(line: 34, column: 17, scope: !1135)
!1144 = !DILocation(line: 34, column: 15, scope: !1135)
!1145 = !DILocation(line: 34, column: 24, scope: !1135)
!1146 = !DILocation(line: 34, column: 31, scope: !1135)
!1147 = !DILocation(line: 34, column: 29, scope: !1135)
!1148 = !DILocation(line: 34, column: 3, scope: !1135)
