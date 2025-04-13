; ModuleID = '2mm.cu'
source_filename = "2mm.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
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

; Function Attrs: noinline norecurse uwtable
define dso_local void @_Z29__device_stub__kernel_A_mul_BiiiiddPdS_S_S_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, double noundef %alpha, double noundef %beta, double* noundef %tmp, double* noundef %A, double* noundef %B, double* noundef %C, double* noundef %D) #0 !dbg !971 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %C.addr = alloca double*, align 8
  %D.addr = alloca double*, align 8
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !975, metadata !DIExpression()), !dbg !976
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !977, metadata !DIExpression()), !dbg !978
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !979, metadata !DIExpression()), !dbg !980
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !981, metadata !DIExpression()), !dbg !982
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !983, metadata !DIExpression()), !dbg !984
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !985, metadata !DIExpression()), !dbg !986
  store double* %tmp, double** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata double** %tmp.addr, metadata !987, metadata !DIExpression()), !dbg !988
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !991, metadata !DIExpression()), !dbg !992
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !993, metadata !DIExpression()), !dbg !994
  store double* %D, double** %D.addr, align 8
  call void @llvm.dbg.declare(metadata double** %D.addr, metadata !995, metadata !DIExpression()), !dbg !996
  %0 = bitcast i32* %ni.addr to i8*, !dbg !997
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !997
  %2 = icmp eq i32 %1, 0, !dbg !997
  br i1 %2, label %setup.next, label %setup.end, !dbg !997

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nj.addr to i8*, !dbg !997
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !997
  %5 = icmp eq i32 %4, 0, !dbg !997
  br i1 %5, label %setup.next1, label %setup.end, !dbg !997

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %nk.addr to i8*, !dbg !997
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !997
  %8 = icmp eq i32 %7, 0, !dbg !997
  br i1 %8, label %setup.next2, label %setup.end, !dbg !997

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %nl.addr to i8*, !dbg !997
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 12), !dbg !997
  %11 = icmp eq i32 %10, 0, !dbg !997
  br i1 %11, label %setup.next3, label %setup.end, !dbg !997

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double* %alpha.addr to i8*, !dbg !997
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 16), !dbg !997
  %14 = icmp eq i32 %13, 0, !dbg !997
  br i1 %14, label %setup.next4, label %setup.end, !dbg !997

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double* %beta.addr to i8*, !dbg !997
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 24), !dbg !997
  %17 = icmp eq i32 %16, 0, !dbg !997
  br i1 %17, label %setup.next5, label %setup.end, !dbg !997

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %tmp.addr to i8*, !dbg !997
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 32), !dbg !997
  %20 = icmp eq i32 %19, 0, !dbg !997
  br i1 %20, label %setup.next6, label %setup.end, !dbg !997

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast double** %A.addr to i8*, !dbg !997
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 40), !dbg !997
  %23 = icmp eq i32 %22, 0, !dbg !997
  br i1 %23, label %setup.next7, label %setup.end, !dbg !997

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast double** %B.addr to i8*, !dbg !997
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 48), !dbg !997
  %26 = icmp eq i32 %25, 0, !dbg !997
  br i1 %26, label %setup.next8, label %setup.end, !dbg !997

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast double** %C.addr to i8*, !dbg !997
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 56), !dbg !997
  %29 = icmp eq i32 %28, 0, !dbg !997
  br i1 %29, label %setup.next9, label %setup.end, !dbg !997

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast double** %D.addr to i8*, !dbg !997
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 8, i64 64), !dbg !997
  %32 = icmp eq i32 %31, 0, !dbg !997
  br i1 %32, label %setup.next10, label %setup.end, !dbg !997

setup.next10:                                     ; preds = %setup.next9
  %33 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @_Z29__device_stub__kernel_A_mul_BiiiiddPdS_S_S_S_ to i8*)), !dbg !997
  br label %setup.end, !dbg !997

setup.end:                                        ; preds = %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !998
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline norecurse uwtable
define dso_local void @_Z38__device_stub__kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, double noundef %alpha, double noundef %beta, double* noundef %tmp, double* noundef %A, double* noundef %B, double* noundef %C, double* noundef %D) #0 !dbg !999 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %C.addr = alloca double*, align 8
  %D.addr = alloca double*, align 8
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !1000, metadata !DIExpression()), !dbg !1001
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !1002, metadata !DIExpression()), !dbg !1003
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !1004, metadata !DIExpression()), !dbg !1005
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !1006, metadata !DIExpression()), !dbg !1007
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !1008, metadata !DIExpression()), !dbg !1009
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !1010, metadata !DIExpression()), !dbg !1011
  store double* %tmp, double** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata double** %tmp.addr, metadata !1012, metadata !DIExpression()), !dbg !1013
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !1014, metadata !DIExpression()), !dbg !1015
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !1016, metadata !DIExpression()), !dbg !1017
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  store double* %D, double** %D.addr, align 8
  call void @llvm.dbg.declare(metadata double** %D.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  %0 = bitcast i32* %ni.addr to i8*, !dbg !1022
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !1022
  %2 = icmp eq i32 %1, 0, !dbg !1022
  br i1 %2, label %setup.next, label %setup.end, !dbg !1022

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nj.addr to i8*, !dbg !1022
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !1022
  %5 = icmp eq i32 %4, 0, !dbg !1022
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1022

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %nk.addr to i8*, !dbg !1022
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !1022
  %8 = icmp eq i32 %7, 0, !dbg !1022
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1022

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %nl.addr to i8*, !dbg !1022
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 12), !dbg !1022
  %11 = icmp eq i32 %10, 0, !dbg !1022
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1022

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double* %alpha.addr to i8*, !dbg !1022
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 16), !dbg !1022
  %14 = icmp eq i32 %13, 0, !dbg !1022
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1022

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double* %beta.addr to i8*, !dbg !1022
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 24), !dbg !1022
  %17 = icmp eq i32 %16, 0, !dbg !1022
  br i1 %17, label %setup.next5, label %setup.end, !dbg !1022

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %tmp.addr to i8*, !dbg !1022
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 32), !dbg !1022
  %20 = icmp eq i32 %19, 0, !dbg !1022
  br i1 %20, label %setup.next6, label %setup.end, !dbg !1022

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast double** %A.addr to i8*, !dbg !1022
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 40), !dbg !1022
  %23 = icmp eq i32 %22, 0, !dbg !1022
  br i1 %23, label %setup.next7, label %setup.end, !dbg !1022

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast double** %B.addr to i8*, !dbg !1022
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 48), !dbg !1022
  %26 = icmp eq i32 %25, 0, !dbg !1022
  br i1 %26, label %setup.next8, label %setup.end, !dbg !1022

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast double** %C.addr to i8*, !dbg !1022
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 56), !dbg !1022
  %29 = icmp eq i32 %28, 0, !dbg !1022
  br i1 %29, label %setup.next9, label %setup.end, !dbg !1022

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast double** %D.addr to i8*, !dbg !1022
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 8, i64 64), !dbg !1022
  %32 = icmp eq i32 %31, 0, !dbg !1022
  br i1 %32, label %setup.next10, label %setup.end, !dbg !1022

setup.next10:                                     ; preds = %setup.next9
  %33 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @_Z38__device_stub__kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S_ to i8*)), !dbg !1022
  br label %setup.end, !dbg !1022

setup.end:                                        ; preds = %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1023
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local noundef signext i16 @_Z10num_blocksss(i16 noundef signext %num, i16 noundef signext %factor) #2 !dbg !1024 {
entry:
  %num.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %num, i16* %num.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %num.addr, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1030, metadata !DIExpression()), !dbg !1031
  %0 = load i16, i16* %num.addr, align 2, !dbg !1032
  %conv = sext i16 %0 to i32, !dbg !1032
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1033
  %conv1 = sext i16 %1 to i32, !dbg !1033
  %add = add nsw i32 %conv, %conv1, !dbg !1034
  %sub = sub nsw i32 %add, 1, !dbg !1035
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1036
  %conv2 = sext i16 %2 to i32, !dbg !1036
  %div = sdiv i32 %sub, %conv2, !dbg !1037
  %conv3 = trunc i32 %div to i16, !dbg !1038
  ret i16 %conv3, !dbg !1039
}

; Function Attrs: mustprogress noinline norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** noundef %argv) #3 !dbg !1040 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dump_code = alloca i32, align 4
  %ni = alloca i64, align 8
  %nj = alloca i64, align 8
  %nk = alloca i64, align 8
  %nl = alloca i64, align 8
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %A = alloca double*, align 8
  %B = alloca double*, align 8
  %C = alloca double*, align 8
  %D = alloca double*, align 8
  %tmp = alloca double*, align 8
  %dev_A = alloca double*, align 8
  %dev_B = alloca double*, align 8
  %dev_C = alloca double*, align 8
  %dev_D = alloca double*, align 8
  %dev_tmp = alloca double*, align 8
  %dev_alpha = alloca double*, align 8
  %dev_beta = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1045, metadata !DIExpression()), !dbg !1046
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !1047, metadata !DIExpression()), !dbg !1048
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !1049
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !1049
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !1049
  %call = call i32 @atoi(i8* noundef %1) #10, !dbg !1050
  store i32 %call, i32* %dump_code, align 4, !dbg !1048
  call void @llvm.dbg.declare(metadata i64* %ni, metadata !1051, metadata !DIExpression()), !dbg !1052
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !1053
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !1053
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !1053
  %call2 = call i32 @atoi(i8* noundef %3) #10, !dbg !1054
  %conv = sext i32 %call2 to i64, !dbg !1054
  store i64 %conv, i64* %ni, align 8, !dbg !1052
  call void @llvm.dbg.declare(metadata i64* %nj, metadata !1055, metadata !DIExpression()), !dbg !1056
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !1057
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 3, !dbg !1057
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !1057
  %call4 = call i32 @atoi(i8* noundef %5) #10, !dbg !1058
  %conv5 = sext i32 %call4 to i64, !dbg !1058
  store i64 %conv5, i64* %nj, align 8, !dbg !1056
  call void @llvm.dbg.declare(metadata i64* %nk, metadata !1059, metadata !DIExpression()), !dbg !1060
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !1061
  %arrayidx6 = getelementptr inbounds i8*, i8** %6, i64 4, !dbg !1061
  %7 = load i8*, i8** %arrayidx6, align 8, !dbg !1061
  %call7 = call i32 @atoi(i8* noundef %7) #10, !dbg !1062
  %conv8 = sext i32 %call7 to i64, !dbg !1062
  store i64 %conv8, i64* %nk, align 8, !dbg !1060
  call void @llvm.dbg.declare(metadata i64* %nl, metadata !1063, metadata !DIExpression()), !dbg !1064
  %8 = load i8**, i8*** %argv.addr, align 8, !dbg !1065
  %arrayidx9 = getelementptr inbounds i8*, i8** %8, i64 5, !dbg !1065
  %9 = load i8*, i8** %arrayidx9, align 8, !dbg !1065
  %call10 = call i32 @atoi(i8* noundef %9) #10, !dbg !1066
  %conv11 = sext i32 %call10 to i64, !dbg !1066
  store i64 %conv11, i64* %nl, align 8, !dbg !1064
  call void @llvm.dbg.declare(metadata double* %alpha, metadata !1067, metadata !DIExpression()), !dbg !1068
  store double 3.241200e+04, double* %alpha, align 8, !dbg !1068
  call void @llvm.dbg.declare(metadata double* %beta, metadata !1069, metadata !DIExpression()), !dbg !1070
  store double 2.123000e+03, double* %beta, align 8, !dbg !1070
  call void @llvm.dbg.declare(metadata double** %A, metadata !1071, metadata !DIExpression()), !dbg !1072
  %10 = load i64, i64* %ni, align 8, !dbg !1073
  %11 = load i64, i64* %nk, align 8, !dbg !1074
  %mul = mul nsw i64 %10, %11, !dbg !1075
  %mul12 = mul i64 %mul, 8, !dbg !1076
  %call13 = call noalias i8* @malloc(i64 noundef %mul12) #11, !dbg !1077
  %12 = bitcast i8* %call13 to double*, !dbg !1078
  store double* %12, double** %A, align 8, !dbg !1072
  call void @llvm.dbg.declare(metadata double** %B, metadata !1079, metadata !DIExpression()), !dbg !1080
  %13 = load i64, i64* %nk, align 8, !dbg !1081
  %14 = load i64, i64* %nj, align 8, !dbg !1082
  %mul14 = mul nsw i64 %13, %14, !dbg !1083
  %mul15 = mul i64 %mul14, 8, !dbg !1084
  %call16 = call noalias i8* @malloc(i64 noundef %mul15) #11, !dbg !1085
  %15 = bitcast i8* %call16 to double*, !dbg !1086
  store double* %15, double** %B, align 8, !dbg !1080
  call void @llvm.dbg.declare(metadata double** %C, metadata !1087, metadata !DIExpression()), !dbg !1088
  %16 = load i64, i64* %nl, align 8, !dbg !1089
  %17 = load i64, i64* %nj, align 8, !dbg !1090
  %mul17 = mul nsw i64 %16, %17, !dbg !1091
  %mul18 = mul i64 %mul17, 8, !dbg !1092
  %call19 = call noalias i8* @malloc(i64 noundef %mul18) #11, !dbg !1093
  %18 = bitcast i8* %call19 to double*, !dbg !1094
  store double* %18, double** %C, align 8, !dbg !1088
  call void @llvm.dbg.declare(metadata double** %D, metadata !1095, metadata !DIExpression()), !dbg !1096
  %19 = load i64, i64* %ni, align 8, !dbg !1097
  %20 = load i64, i64* %nl, align 8, !dbg !1098
  %mul20 = mul nsw i64 %19, %20, !dbg !1099
  %mul21 = mul i64 %mul20, 8, !dbg !1100
  %call22 = call noalias i8* @malloc(i64 noundef %mul21) #11, !dbg !1101
  %21 = bitcast i8* %call22 to double*, !dbg !1102
  store double* %21, double** %D, align 8, !dbg !1096
  call void @llvm.dbg.declare(metadata double** %tmp, metadata !1103, metadata !DIExpression()), !dbg !1104
  %22 = load i64, i64* %ni, align 8, !dbg !1105
  %23 = load i64, i64* %nj, align 8, !dbg !1106
  %mul23 = mul nsw i64 %22, %23, !dbg !1107
  %mul24 = mul i64 %mul23, 8, !dbg !1108
  %call25 = call noalias i8* @malloc(i64 noundef %mul24) #11, !dbg !1109
  %24 = bitcast i8* %call25 to double*, !dbg !1110
  store double* %24, double** %tmp, align 8, !dbg !1104
  %25 = load i64, i64* %ni, align 8, !dbg !1111
  %conv26 = trunc i64 %25 to i32, !dbg !1111
  %26 = load i64, i64* %nj, align 8, !dbg !1112
  %conv27 = trunc i64 %26 to i32, !dbg !1112
  %27 = load i64, i64* %nk, align 8, !dbg !1113
  %conv28 = trunc i64 %27 to i32, !dbg !1113
  %28 = load i64, i64* %nl, align 8, !dbg !1114
  %conv29 = trunc i64 %28 to i32, !dbg !1114
  %29 = load double*, double** %A, align 8, !dbg !1115
  %30 = load double*, double** %B, align 8, !dbg !1116
  %31 = load double*, double** %C, align 8, !dbg !1117
  %32 = load double*, double** %D, align 8, !dbg !1118
  %33 = load double*, double** %tmp, align 8, !dbg !1119
  call void @_ZL10init_arrayiiiiPdS_S_S_S_(i32 noundef %conv26, i32 noundef %conv27, i32 noundef %conv28, i32 noundef %conv29, double* noundef %29, double* noundef %30, double* noundef %31, double* noundef %32, double* noundef %33), !dbg !1120
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !1121, metadata !DIExpression()), !dbg !1122
  call void @llvm.dbg.declare(metadata double** %dev_B, metadata !1123, metadata !DIExpression()), !dbg !1124
  call void @llvm.dbg.declare(metadata double** %dev_C, metadata !1125, metadata !DIExpression()), !dbg !1126
  call void @llvm.dbg.declare(metadata double** %dev_D, metadata !1127, metadata !DIExpression()), !dbg !1128
  call void @llvm.dbg.declare(metadata double** %dev_tmp, metadata !1129, metadata !DIExpression()), !dbg !1130
  call void @llvm.dbg.declare(metadata double** %dev_alpha, metadata !1131, metadata !DIExpression()), !dbg !1132
  call void @llvm.dbg.declare(metadata double** %dev_beta, metadata !1133, metadata !DIExpression()), !dbg !1134
  %34 = load i64, i64* %ni, align 8, !dbg !1135
  %35 = load i64, i64* %nk, align 8, !dbg !1136
  %mul30 = mul nsw i64 %34, %35, !dbg !1137
  %mul31 = mul i64 %mul30, 8, !dbg !1138
  %call32 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %dev_A, i64 noundef %mul31), !dbg !1139
  %36 = load i64, i64* %nk, align 8, !dbg !1140
  %37 = load i64, i64* %nj, align 8, !dbg !1141
  %mul33 = mul nsw i64 %36, %37, !dbg !1142
  %mul34 = mul i64 %mul33, 8, !dbg !1143
  %call35 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %dev_B, i64 noundef %mul34), !dbg !1144
  %38 = load i64, i64* %nl, align 8, !dbg !1145
  %39 = load i64, i64* %nj, align 8, !dbg !1146
  %mul36 = mul nsw i64 %38, %39, !dbg !1147
  %mul37 = mul i64 %mul36, 8, !dbg !1148
  %call38 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %dev_C, i64 noundef %mul37), !dbg !1149
  %40 = load i64, i64* %ni, align 8, !dbg !1150
  %41 = load i64, i64* %nl, align 8, !dbg !1151
  %mul39 = mul nsw i64 %40, %41, !dbg !1152
  %mul40 = mul i64 %mul39, 8, !dbg !1153
  %call41 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %dev_D, i64 noundef %mul40), !dbg !1154
  %42 = load i64, i64* %ni, align 8, !dbg !1155
  %43 = load i64, i64* %nj, align 8, !dbg !1156
  %mul42 = mul nsw i64 %42, %43, !dbg !1157
  %mul43 = mul i64 %mul42, 8, !dbg !1158
  %call44 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %dev_tmp, i64 noundef %mul43), !dbg !1159
  %44 = load double*, double** %dev_A, align 8, !dbg !1160
  %45 = bitcast double* %44 to i8*, !dbg !1160
  %46 = load double*, double** %A, align 8, !dbg !1161
  %47 = bitcast double* %46 to i8*, !dbg !1161
  %48 = load i64, i64* %ni, align 8, !dbg !1162
  %49 = load i64, i64* %nk, align 8, !dbg !1163
  %mul45 = mul nsw i64 %48, %49, !dbg !1164
  %mul46 = mul i64 %mul45, 8, !dbg !1165
  %call47 = call i32 @cudaMemcpy(i8* noundef %45, i8* noundef %47, i64 noundef %mul46, i32 noundef 1), !dbg !1166
  %50 = load double*, double** %dev_B, align 8, !dbg !1167
  %51 = bitcast double* %50 to i8*, !dbg !1167
  %52 = load double*, double** %B, align 8, !dbg !1168
  %53 = bitcast double* %52 to i8*, !dbg !1168
  %54 = load i64, i64* %nk, align 8, !dbg !1169
  %55 = load i64, i64* %nj, align 8, !dbg !1170
  %mul48 = mul nsw i64 %54, %55, !dbg !1171
  %mul49 = mul i64 %mul48, 8, !dbg !1172
  %call50 = call i32 @cudaMemcpy(i8* noundef %51, i8* noundef %53, i64 noundef %mul49, i32 noundef 1), !dbg !1173
  %56 = load double*, double** %dev_C, align 8, !dbg !1174
  %57 = bitcast double* %56 to i8*, !dbg !1174
  %58 = load double*, double** %C, align 8, !dbg !1175
  %59 = bitcast double* %58 to i8*, !dbg !1175
  %60 = load i64, i64* %nl, align 8, !dbg !1176
  %61 = load i64, i64* %nj, align 8, !dbg !1177
  %mul51 = mul nsw i64 %60, %61, !dbg !1178
  %mul52 = mul i64 %mul51, 8, !dbg !1179
  %call53 = call i32 @cudaMemcpy(i8* noundef %57, i8* noundef %59, i64 noundef %mul52, i32 noundef 1), !dbg !1180
  %62 = load double*, double** %dev_D, align 8, !dbg !1181
  %63 = bitcast double* %62 to i8*, !dbg !1181
  %64 = load double*, double** %D, align 8, !dbg !1182
  %65 = bitcast double* %64 to i8*, !dbg !1182
  %66 = load i64, i64* %ni, align 8, !dbg !1183
  %67 = load i64, i64* %nl, align 8, !dbg !1184
  %mul54 = mul nsw i64 %66, %67, !dbg !1185
  %mul55 = mul i64 %mul54, 8, !dbg !1186
  %call56 = call i32 @cudaMemcpy(i8* noundef %63, i8* noundef %65, i64 noundef %mul55, i32 noundef 1), !dbg !1187
  %68 = load double*, double** %dev_tmp, align 8, !dbg !1188
  %69 = bitcast double* %68 to i8*, !dbg !1188
  %70 = load double*, double** %tmp, align 8, !dbg !1189
  %71 = bitcast double* %70 to i8*, !dbg !1189
  %72 = load i64, i64* %ni, align 8, !dbg !1190
  %73 = load i64, i64* %nj, align 8, !dbg !1191
  %mul57 = mul nsw i64 %72, %73, !dbg !1192
  %mul58 = mul i64 %mul57, 8, !dbg !1193
  %call59 = call i32 @cudaMemcpy(i8* noundef %69, i8* noundef %71, i64 noundef %mul58, i32 noundef 1), !dbg !1194
  %74 = load i64, i64* %ni, align 8, !dbg !1195
  %conv60 = trunc i64 %74 to i32, !dbg !1195
  %75 = load i64, i64* %nj, align 8, !dbg !1196
  %conv61 = trunc i64 %75 to i32, !dbg !1196
  %76 = load i64, i64* %nk, align 8, !dbg !1197
  %conv62 = trunc i64 %76 to i32, !dbg !1197
  %77 = load i64, i64* %nl, align 8, !dbg !1198
  %conv63 = trunc i64 %77 to i32, !dbg !1198
  %78 = load double, double* %alpha, align 8, !dbg !1199
  %79 = load double, double* %beta, align 8, !dbg !1200
  %80 = load double*, double** %dev_tmp, align 8, !dbg !1201
  %81 = load double*, double** %dev_A, align 8, !dbg !1202
  %82 = load double*, double** %dev_B, align 8, !dbg !1203
  %83 = load double*, double** %dev_C, align 8, !dbg !1204
  %84 = load double*, double** %dev_D, align 8, !dbg !1205
  call void @_ZL6kerneliiiiddPdS_S_S_S_(i32 noundef %conv60, i32 noundef %conv61, i32 noundef %conv62, i32 noundef %conv63, double noundef %78, double noundef %79, double* noundef %80, double* noundef %81, double* noundef %82, double* noundef %83, double* noundef %84), !dbg !1206
  %85 = load double*, double** %D, align 8, !dbg !1207
  %86 = bitcast double* %85 to i8*, !dbg !1207
  %87 = load double*, double** %dev_D, align 8, !dbg !1208
  %88 = bitcast double* %87 to i8*, !dbg !1208
  %89 = load i64, i64* %ni, align 8, !dbg !1209
  %90 = load i64, i64* %nl, align 8, !dbg !1210
  %mul64 = mul nsw i64 %89, %90, !dbg !1211
  %mul65 = mul i64 %mul64, 8, !dbg !1212
  %call66 = call i32 @cudaMemcpy(i8* noundef %86, i8* noundef %88, i64 noundef %mul65, i32 noundef 2), !dbg !1213
  %91 = load double*, double** %dev_A, align 8, !dbg !1214
  %92 = bitcast double* %91 to i8*, !dbg !1214
  %call67 = call i32 @cudaFree(i8* noundef %92), !dbg !1215
  %93 = load double*, double** %dev_B, align 8, !dbg !1216
  %94 = bitcast double* %93 to i8*, !dbg !1216
  %call68 = call i32 @cudaFree(i8* noundef %94), !dbg !1217
  %95 = load double*, double** %dev_C, align 8, !dbg !1218
  %96 = bitcast double* %95 to i8*, !dbg !1218
  %call69 = call i32 @cudaFree(i8* noundef %96), !dbg !1219
  %97 = load double*, double** %dev_D, align 8, !dbg !1220
  %98 = bitcast double* %97 to i8*, !dbg !1220
  %call70 = call i32 @cudaFree(i8* noundef %98), !dbg !1221
  %99 = load double*, double** %dev_tmp, align 8, !dbg !1222
  %100 = bitcast double* %99 to i8*, !dbg !1222
  %call71 = call i32 @cudaFree(i8* noundef %100), !dbg !1223
  %101 = load double*, double** %dev_alpha, align 8, !dbg !1224
  %102 = bitcast double* %101 to i8*, !dbg !1224
  %call72 = call i32 @cudaFree(i8* noundef %102), !dbg !1225
  %103 = load double*, double** %dev_beta, align 8, !dbg !1226
  %104 = bitcast double* %103 to i8*, !dbg !1226
  %call73 = call i32 @cudaFree(i8* noundef %104), !dbg !1227
  %105 = load i32, i32* %dump_code, align 4, !dbg !1228
  %cmp = icmp eq i32 %105, 1, !dbg !1230
  br i1 %cmp, label %if.then, label %if.end, !dbg !1231

if.then:                                          ; preds = %entry
  %106 = load i64, i64* %ni, align 8, !dbg !1232
  %conv74 = trunc i64 %106 to i32, !dbg !1232
  %107 = load i64, i64* %nk, align 8, !dbg !1233
  %conv75 = trunc i64 %107 to i32, !dbg !1233
  %108 = load double*, double** %D, align 8, !dbg !1234
  call void @_ZL11print_arrayiiPd(i32 noundef %conv74, i32 noundef %conv75, double* noundef %108), !dbg !1235
  br label %if.end, !dbg !1235

if.end:                                           ; preds = %if.then, %entry
  %109 = load double*, double** %tmp, align 8, !dbg !1236
  %110 = bitcast double* %109 to i8*, !dbg !1236
  call void @free(i8* noundef %110) #11, !dbg !1237
  %111 = load double*, double** %A, align 8, !dbg !1238
  %112 = bitcast double* %111 to i8*, !dbg !1238
  call void @free(i8* noundef %112) #11, !dbg !1239
  %113 = load double*, double** %B, align 8, !dbg !1240
  %114 = bitcast double* %113 to i8*, !dbg !1240
  call void @free(i8* noundef %114) #11, !dbg !1241
  %115 = load double*, double** %C, align 8, !dbg !1242
  %116 = bitcast double* %115 to i8*, !dbg !1242
  call void @free(i8* noundef %116) #11, !dbg !1243
  %117 = load double*, double** %D, align 8, !dbg !1244
  %118 = bitcast double* %117 to i8*, !dbg !1244
  call void @free(i8* noundef %118) #11, !dbg !1245
  ret i32 0, !dbg !1246
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8* noundef) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64 noundef) #5

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @_ZL10init_arrayiiiiPdS_S_S_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, double* noundef %A, double* noundef %B, double* noundef %C, double* noundef %D, double* noundef %tmp) #2 !dbg !1247 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %C.addr = alloca double*, align 8
  %D.addr = alloca double*, align 8
  %tmp.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !1250, metadata !DIExpression()), !dbg !1251
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !1252, metadata !DIExpression()), !dbg !1253
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !1254, metadata !DIExpression()), !dbg !1255
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !1258, metadata !DIExpression()), !dbg !1259
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !1260, metadata !DIExpression()), !dbg !1261
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !1262, metadata !DIExpression()), !dbg !1263
  store double* %D, double** %D.addr, align 8
  call void @llvm.dbg.declare(metadata double** %D.addr, metadata !1264, metadata !DIExpression()), !dbg !1265
  store double* %tmp, double** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata double** %tmp.addr, metadata !1266, metadata !DIExpression()), !dbg !1267
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1268, metadata !DIExpression()), !dbg !1269
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1270, metadata !DIExpression()), !dbg !1271
  store i32 0, i32* %i, align 4, !dbg !1272
  br label %for.cond, !dbg !1274

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1275
  %1 = load i32, i32* %ni.addr, align 4, !dbg !1277
  %cmp = icmp slt i32 %0, %1, !dbg !1278
  br i1 %cmp, label %for.body, label %for.end9, !dbg !1279

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1280
  br label %for.cond1, !dbg !1282

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1283
  %3 = load i32, i32* %nk.addr, align 4, !dbg !1285
  %cmp2 = icmp slt i32 %2, %3, !dbg !1286
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1287

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4, !dbg !1288
  %conv = sitofp i32 %4 to double, !dbg !1288
  %5 = load i32, i32* %j, align 4, !dbg !1289
  %conv4 = sitofp i32 %5 to double, !dbg !1289
  %mul = fmul double %conv, %conv4, !dbg !1290
  %6 = load i32, i32* %ni.addr, align 4, !dbg !1291
  %conv5 = sitofp i32 %6 to double, !dbg !1291
  %div = fdiv double %mul, %conv5, !dbg !1292
  %7 = load double*, double** %A.addr, align 8, !dbg !1293
  %8 = load i32, i32* %i, align 4, !dbg !1294
  %9 = load i32, i32* %ni.addr, align 4, !dbg !1295
  %mul6 = mul nsw i32 %8, %9, !dbg !1296
  %10 = load i32, i32* %j, align 4, !dbg !1297
  %add = add nsw i32 %mul6, %10, !dbg !1298
  %idxprom = sext i32 %add to i64, !dbg !1293
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom, !dbg !1293
  store double %div, double* %arrayidx, align 8, !dbg !1299
  br label %for.inc, !dbg !1293

for.inc:                                          ; preds = %for.body3
  %11 = load i32, i32* %j, align 4, !dbg !1300
  %inc = add nsw i32 %11, 1, !dbg !1300
  store i32 %inc, i32* %j, align 4, !dbg !1300
  br label %for.cond1, !dbg !1301, !llvm.loop !1302

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !1303

for.inc7:                                         ; preds = %for.end
  %12 = load i32, i32* %i, align 4, !dbg !1305
  %inc8 = add nsw i32 %12, 1, !dbg !1305
  store i32 %inc8, i32* %i, align 4, !dbg !1305
  br label %for.cond, !dbg !1306, !llvm.loop !1307

for.end9:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !1309
  br label %for.cond10, !dbg !1311

for.cond10:                                       ; preds = %for.inc29, %for.end9
  %13 = load i32, i32* %i, align 4, !dbg !1312
  %14 = load i32, i32* %nk.addr, align 4, !dbg !1314
  %cmp11 = icmp slt i32 %13, %14, !dbg !1315
  br i1 %cmp11, label %for.body12, label %for.end31, !dbg !1316

for.body12:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4, !dbg !1317
  br label %for.cond13, !dbg !1319

for.cond13:                                       ; preds = %for.inc26, %for.body12
  %15 = load i32, i32* %j, align 4, !dbg !1320
  %16 = load i32, i32* %nj.addr, align 4, !dbg !1322
  %cmp14 = icmp slt i32 %15, %16, !dbg !1323
  br i1 %cmp14, label %for.body15, label %for.end28, !dbg !1324

for.body15:                                       ; preds = %for.cond13
  %17 = load i32, i32* %i, align 4, !dbg !1325
  %conv16 = sitofp i32 %17 to double, !dbg !1325
  %18 = load i32, i32* %j, align 4, !dbg !1326
  %add17 = add nsw i32 %18, 1, !dbg !1327
  %conv18 = sitofp i32 %add17 to double, !dbg !1328
  %mul19 = fmul double %conv16, %conv18, !dbg !1329
  %19 = load i32, i32* %nj.addr, align 4, !dbg !1330
  %conv20 = sitofp i32 %19 to double, !dbg !1330
  %div21 = fdiv double %mul19, %conv20, !dbg !1331
  %20 = load double*, double** %B.addr, align 8, !dbg !1332
  %21 = load i32, i32* %i, align 4, !dbg !1333
  %22 = load i32, i32* %nk.addr, align 4, !dbg !1334
  %mul22 = mul nsw i32 %21, %22, !dbg !1335
  %23 = load i32, i32* %j, align 4, !dbg !1336
  %add23 = add nsw i32 %mul22, %23, !dbg !1337
  %idxprom24 = sext i32 %add23 to i64, !dbg !1332
  %arrayidx25 = getelementptr inbounds double, double* %20, i64 %idxprom24, !dbg !1332
  store double %div21, double* %arrayidx25, align 8, !dbg !1338
  br label %for.inc26, !dbg !1332

for.inc26:                                        ; preds = %for.body15
  %24 = load i32, i32* %j, align 4, !dbg !1339
  %inc27 = add nsw i32 %24, 1, !dbg !1339
  store i32 %inc27, i32* %j, align 4, !dbg !1339
  br label %for.cond13, !dbg !1340, !llvm.loop !1341

for.end28:                                        ; preds = %for.cond13
  br label %for.inc29, !dbg !1342

for.inc29:                                        ; preds = %for.end28
  %25 = load i32, i32* %i, align 4, !dbg !1343
  %inc30 = add nsw i32 %25, 1, !dbg !1343
  store i32 %inc30, i32* %i, align 4, !dbg !1343
  br label %for.cond10, !dbg !1344, !llvm.loop !1345

for.end31:                                        ; preds = %for.cond10
  store i32 0, i32* %i, align 4, !dbg !1347
  br label %for.cond32, !dbg !1349

for.cond32:                                       ; preds = %for.inc51, %for.end31
  %26 = load i32, i32* %i, align 4, !dbg !1350
  %27 = load i32, i32* %nl.addr, align 4, !dbg !1352
  %cmp33 = icmp slt i32 %26, %27, !dbg !1353
  br i1 %cmp33, label %for.body34, label %for.end53, !dbg !1354

for.body34:                                       ; preds = %for.cond32
  store i32 0, i32* %j, align 4, !dbg !1355
  br label %for.cond35, !dbg !1357

for.cond35:                                       ; preds = %for.inc48, %for.body34
  %28 = load i32, i32* %j, align 4, !dbg !1358
  %29 = load i32, i32* %nj.addr, align 4, !dbg !1360
  %cmp36 = icmp slt i32 %28, %29, !dbg !1361
  br i1 %cmp36, label %for.body37, label %for.end50, !dbg !1362

for.body37:                                       ; preds = %for.cond35
  %30 = load i32, i32* %i, align 4, !dbg !1363
  %conv38 = sitofp i32 %30 to double, !dbg !1363
  %31 = load i32, i32* %j, align 4, !dbg !1364
  %add39 = add nsw i32 %31, 3, !dbg !1365
  %conv40 = sitofp i32 %add39 to double, !dbg !1366
  %mul41 = fmul double %conv38, %conv40, !dbg !1367
  %32 = load i32, i32* %nl.addr, align 4, !dbg !1368
  %conv42 = sitofp i32 %32 to double, !dbg !1368
  %div43 = fdiv double %mul41, %conv42, !dbg !1369
  %33 = load double*, double** %C.addr, align 8, !dbg !1370
  %34 = load i32, i32* %i, align 4, !dbg !1371
  %35 = load i32, i32* %nl.addr, align 4, !dbg !1372
  %mul44 = mul nsw i32 %34, %35, !dbg !1373
  %36 = load i32, i32* %j, align 4, !dbg !1374
  %add45 = add nsw i32 %mul44, %36, !dbg !1375
  %idxprom46 = sext i32 %add45 to i64, !dbg !1370
  %arrayidx47 = getelementptr inbounds double, double* %33, i64 %idxprom46, !dbg !1370
  store double %div43, double* %arrayidx47, align 8, !dbg !1376
  br label %for.inc48, !dbg !1370

for.inc48:                                        ; preds = %for.body37
  %37 = load i32, i32* %j, align 4, !dbg !1377
  %inc49 = add nsw i32 %37, 1, !dbg !1377
  store i32 %inc49, i32* %j, align 4, !dbg !1377
  br label %for.cond35, !dbg !1378, !llvm.loop !1379

for.end50:                                        ; preds = %for.cond35
  br label %for.inc51, !dbg !1380

for.inc51:                                        ; preds = %for.end50
  %38 = load i32, i32* %i, align 4, !dbg !1381
  %inc52 = add nsw i32 %38, 1, !dbg !1381
  store i32 %inc52, i32* %i, align 4, !dbg !1381
  br label %for.cond32, !dbg !1382, !llvm.loop !1383

for.end53:                                        ; preds = %for.cond32
  store i32 0, i32* %i, align 4, !dbg !1385
  br label %for.cond54, !dbg !1387

for.cond54:                                       ; preds = %for.inc73, %for.end53
  %39 = load i32, i32* %i, align 4, !dbg !1388
  %40 = load i32, i32* %ni.addr, align 4, !dbg !1390
  %cmp55 = icmp slt i32 %39, %40, !dbg !1391
  br i1 %cmp55, label %for.body56, label %for.end75, !dbg !1392

for.body56:                                       ; preds = %for.cond54
  store i32 0, i32* %j, align 4, !dbg !1393
  br label %for.cond57, !dbg !1395

for.cond57:                                       ; preds = %for.inc70, %for.body56
  %41 = load i32, i32* %j, align 4, !dbg !1396
  %42 = load i32, i32* %nl.addr, align 4, !dbg !1398
  %cmp58 = icmp slt i32 %41, %42, !dbg !1399
  br i1 %cmp58, label %for.body59, label %for.end72, !dbg !1400

for.body59:                                       ; preds = %for.cond57
  %43 = load i32, i32* %i, align 4, !dbg !1401
  %conv60 = sitofp i32 %43 to double, !dbg !1401
  %44 = load i32, i32* %j, align 4, !dbg !1402
  %add61 = add nsw i32 %44, 2, !dbg !1403
  %conv62 = sitofp i32 %add61 to double, !dbg !1404
  %mul63 = fmul double %conv60, %conv62, !dbg !1405
  %45 = load i32, i32* %nk.addr, align 4, !dbg !1406
  %conv64 = sitofp i32 %45 to double, !dbg !1406
  %div65 = fdiv double %mul63, %conv64, !dbg !1407
  %46 = load double*, double** %D.addr, align 8, !dbg !1408
  %47 = load i32, i32* %i, align 4, !dbg !1409
  %48 = load i32, i32* %ni.addr, align 4, !dbg !1410
  %mul66 = mul nsw i32 %47, %48, !dbg !1411
  %49 = load i32, i32* %j, align 4, !dbg !1412
  %add67 = add nsw i32 %mul66, %49, !dbg !1413
  %idxprom68 = sext i32 %add67 to i64, !dbg !1408
  %arrayidx69 = getelementptr inbounds double, double* %46, i64 %idxprom68, !dbg !1408
  store double %div65, double* %arrayidx69, align 8, !dbg !1414
  br label %for.inc70, !dbg !1408

for.inc70:                                        ; preds = %for.body59
  %50 = load i32, i32* %j, align 4, !dbg !1415
  %inc71 = add nsw i32 %50, 1, !dbg !1415
  store i32 %inc71, i32* %j, align 4, !dbg !1415
  br label %for.cond57, !dbg !1416, !llvm.loop !1417

for.end72:                                        ; preds = %for.cond57
  br label %for.inc73, !dbg !1418

for.inc73:                                        ; preds = %for.end72
  %51 = load i32, i32* %i, align 4, !dbg !1419
  %inc74 = add nsw i32 %51, 1, !dbg !1419
  store i32 %inc74, i32* %i, align 4, !dbg !1419
  br label %for.cond54, !dbg !1420, !llvm.loop !1421

for.end75:                                        ; preds = %for.cond54
  store i32 0, i32* %i, align 4, !dbg !1423
  br label %for.cond76, !dbg !1425

for.cond76:                                       ; preds = %for.inc89, %for.end75
  %52 = load i32, i32* %i, align 4, !dbg !1426
  %53 = load i32, i32* %ni.addr, align 4, !dbg !1428
  %cmp77 = icmp slt i32 %52, %53, !dbg !1429
  br i1 %cmp77, label %for.body78, label %for.end91, !dbg !1430

for.body78:                                       ; preds = %for.cond76
  store i32 0, i32* %j, align 4, !dbg !1431
  br label %for.cond79, !dbg !1433

for.cond79:                                       ; preds = %for.inc86, %for.body78
  %54 = load i32, i32* %j, align 4, !dbg !1434
  %55 = load i32, i32* %nj.addr, align 4, !dbg !1436
  %cmp80 = icmp slt i32 %54, %55, !dbg !1437
  br i1 %cmp80, label %for.body81, label %for.end88, !dbg !1438

for.body81:                                       ; preds = %for.cond79
  %56 = load double*, double** %tmp.addr, align 8, !dbg !1439
  %57 = load i32, i32* %i, align 4, !dbg !1440
  %58 = load i32, i32* %ni.addr, align 4, !dbg !1441
  %mul82 = mul nsw i32 %57, %58, !dbg !1442
  %59 = load i32, i32* %j, align 4, !dbg !1443
  %add83 = add nsw i32 %mul82, %59, !dbg !1444
  %idxprom84 = sext i32 %add83 to i64, !dbg !1439
  %arrayidx85 = getelementptr inbounds double, double* %56, i64 %idxprom84, !dbg !1439
  store double 0.000000e+00, double* %arrayidx85, align 8, !dbg !1445
  br label %for.inc86, !dbg !1439

for.inc86:                                        ; preds = %for.body81
  %60 = load i32, i32* %j, align 4, !dbg !1446
  %inc87 = add nsw i32 %60, 1, !dbg !1446
  store i32 %inc87, i32* %j, align 4, !dbg !1446
  br label %for.cond79, !dbg !1447, !llvm.loop !1448

for.end88:                                        ; preds = %for.cond79
  br label %for.inc89, !dbg !1449

for.inc89:                                        ; preds = %for.end88
  %61 = load i32, i32* %i, align 4, !dbg !1450
  %inc90 = add nsw i32 %61, 1, !dbg !1450
  store i32 %inc90, i32* %i, align 4, !dbg !1450
  br label %for.cond76, !dbg !1451, !llvm.loop !1452

for.end91:                                        ; preds = %for.cond76
  ret void, !dbg !1454
}

; Function Attrs: mustprogress noinline uwtable
define internal noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** noundef %devPtr, i64 noundef %size) #6 !dbg !1455 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !1463, metadata !DIExpression()), !dbg !1464
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1465, metadata !DIExpression()), !dbg !1466
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !1467
  %1 = bitcast double** %0 to i8*, !dbg !1467
  %2 = bitcast i8* %1 to i8**, !dbg !1468
  %3 = load i64, i64* %size.addr, align 8, !dbg !1469
  %call = call i32 @cudaMalloc(i8** noundef %2, i64 noundef %3), !dbg !1470
  ret i32 %call, !dbg !1471
}

declare dso_local i32 @cudaMemcpy(i8* noundef, i8* noundef, i64 noundef, i32 noundef) #7

; Function Attrs: mustprogress noinline uwtable
define internal void @_ZL6kerneliiiiddPdS_S_S_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, double noundef %alpha, double noundef %beta, double* noundef %tmp, double* noundef %A, double* noundef %B, double* noundef %C, double* noundef %D) #6 !dbg !1472 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %C.addr = alloca double*, align 8
  %D.addr = alloca double*, align 8
  %threadsPerBlock = alloca i32, align 4
  %block = alloca %struct.dim3, align 4
  %grid = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp7 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp7.coerce = alloca { i64, i32 }, align 4
  %grid9 = alloca %struct.dim3, align 4
  %agg.tmp20 = alloca %struct.dim3, align 4
  %agg.tmp21 = alloca %struct.dim3, align 4
  %agg.tmp20.coerce = alloca { i64, i32 }, align 4
  %agg.tmp21.coerce = alloca { i64, i32 }, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !1473, metadata !DIExpression()), !dbg !1474
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !1475, metadata !DIExpression()), !dbg !1476
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !1477, metadata !DIExpression()), !dbg !1478
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !1479, metadata !DIExpression()), !dbg !1480
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !1481, metadata !DIExpression()), !dbg !1482
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !1483, metadata !DIExpression()), !dbg !1484
  store double* %tmp, double** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata double** %tmp.addr, metadata !1485, metadata !DIExpression()), !dbg !1486
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !1487, metadata !DIExpression()), !dbg !1488
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !1489, metadata !DIExpression()), !dbg !1490
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !1491, metadata !DIExpression()), !dbg !1492
  store double* %D, double** %D.addr, align 8
  call void @llvm.dbg.declare(metadata double** %D.addr, metadata !1493, metadata !DIExpression()), !dbg !1494
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !1495, metadata !DIExpression()), !dbg !1496
  store i32 256, i32* %threadsPerBlock, align 4, !dbg !1496
  call void @llvm.dbg.declare(metadata %struct.dim3* %block, metadata !1497, metadata !DIExpression()), !dbg !1499
  %0 = load i32, i32* %threadsPerBlock, align 4, !dbg !1500
  %div = udiv i32 %0, 32, !dbg !1501
  call void @_ZN4dim3C2Ejjj(%struct.dim3* noundef nonnull align 4 dereferenceable(12) %block, i32 noundef %div, i32 noundef 32, i32 noundef 1), !dbg !1499
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !1502, metadata !DIExpression()), !dbg !1504
  %1 = load i32, i32* %ni.addr, align 4, !dbg !1505
  %conv = trunc i32 %1 to i16, !dbg !1505
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0, !dbg !1506
  %2 = load i32, i32* %x, align 4, !dbg !1506
  %conv1 = trunc i32 %2 to i16, !dbg !1507
  %call = call noundef signext i16 @_Z10num_blocksss(i16 noundef signext %conv, i16 noundef signext %conv1), !dbg !1508
  %conv2 = sext i16 %call to i32, !dbg !1508
  %3 = load i32, i32* %nj.addr, align 4, !dbg !1509
  %conv3 = trunc i32 %3 to i16, !dbg !1509
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 1, !dbg !1510
  %4 = load i32, i32* %y, align 4, !dbg !1510
  %conv4 = trunc i32 %4 to i16, !dbg !1511
  %call5 = call noundef signext i16 @_Z10num_blocksss(i16 noundef signext %conv3, i16 noundef signext %conv4), !dbg !1512
  %conv6 = sext i16 %call5 to i32, !dbg !1512
  call void @_ZN4dim3C2Ejjj(%struct.dim3* noundef nonnull align 4 dereferenceable(12) %grid, i32 noundef %conv2, i32 noundef %conv6, i32 noundef 1), !dbg !1504
  %5 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1513
  %6 = bitcast %struct.dim3* %grid to i8*, !dbg !1513
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %6, i64 12, i1 false), !dbg !1513
  %7 = bitcast %struct.dim3* %agg.tmp7 to i8*, !dbg !1514
  %8 = bitcast %struct.dim3* %block to i8*, !dbg !1514
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 4 %8, i64 12, i1 false), !dbg !1514
  %9 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1515
  %10 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1515
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 4 %10, i64 12, i1 false), !dbg !1515
  %11 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1515
  %12 = load i64, i64* %11, align 4, !dbg !1515
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1515
  %14 = load i32, i32* %13, align 4, !dbg !1515
  %15 = bitcast { i64, i32 }* %agg.tmp7.coerce to i8*, !dbg !1515
  %16 = bitcast %struct.dim3* %agg.tmp7 to i8*, !dbg !1515
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 4 %16, i64 12, i1 false), !dbg !1515
  %17 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp7.coerce, i32 0, i32 0, !dbg !1515
  %18 = load i64, i64* %17, align 4, !dbg !1515
  %19 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp7.coerce, i32 0, i32 1, !dbg !1515
  %20 = load i32, i32* %19, align 4, !dbg !1515
  %call8 = call i32 @cudaConfigureCall(i64 %12, i32 %14, i64 %18, i32 %20, i64 noundef 0, %struct.CUstream_st* noundef null), !dbg !1515
  %tobool = icmp ne i32 %call8, 0, !dbg !1515
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !1516

kcall.configok:                                   ; preds = %entry
  %21 = load i32, i32* %ni.addr, align 4, !dbg !1517
  %22 = load i32, i32* %nj.addr, align 4, !dbg !1518
  %23 = load i32, i32* %nk.addr, align 4, !dbg !1519
  %24 = load i32, i32* %nl.addr, align 4, !dbg !1520
  %25 = load double, double* %alpha.addr, align 8, !dbg !1521
  %26 = load double, double* %beta.addr, align 8, !dbg !1522
  %27 = load double*, double** %tmp.addr, align 8, !dbg !1523
  %28 = load double*, double** %A.addr, align 8, !dbg !1524
  %29 = load double*, double** %B.addr, align 8, !dbg !1525
  %30 = load double*, double** %C.addr, align 8, !dbg !1526
  %31 = load double*, double** %D.addr, align 8, !dbg !1527
  call void @_Z29__device_stub__kernel_A_mul_BiiiiddPdS_S_S_S_(i32 noundef %21, i32 noundef %22, i32 noundef %23, i32 noundef %24, double noundef %25, double noundef %26, double* noundef %27, double* noundef %28, double* noundef %29, double* noundef %30, double* noundef %31), !dbg !1516
  br label %kcall.end, !dbg !1516

kcall.end:                                        ; preds = %kcall.configok, %entry
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid9, metadata !1528, metadata !DIExpression()), !dbg !1530
  %32 = load i32, i32* %ni.addr, align 4, !dbg !1531
  %conv10 = trunc i32 %32 to i16, !dbg !1531
  %x11 = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0, !dbg !1532
  %33 = load i32, i32* %x11, align 4, !dbg !1532
  %conv12 = trunc i32 %33 to i16, !dbg !1533
  %call13 = call noundef signext i16 @_Z10num_blocksss(i16 noundef signext %conv10, i16 noundef signext %conv12), !dbg !1534
  %conv14 = sext i16 %call13 to i32, !dbg !1534
  %34 = load i32, i32* %nl.addr, align 4, !dbg !1535
  %conv15 = trunc i32 %34 to i16, !dbg !1535
  %y16 = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 1, !dbg !1536
  %35 = load i32, i32* %y16, align 4, !dbg !1536
  %conv17 = trunc i32 %35 to i16, !dbg !1537
  %call18 = call noundef signext i16 @_Z10num_blocksss(i16 noundef signext %conv15, i16 noundef signext %conv17), !dbg !1538
  %conv19 = sext i16 %call18 to i32, !dbg !1538
  call void @_ZN4dim3C2Ejjj(%struct.dim3* noundef nonnull align 4 dereferenceable(12) %grid9, i32 noundef %conv14, i32 noundef %conv19, i32 noundef 1), !dbg !1530
  %36 = bitcast %struct.dim3* %agg.tmp20 to i8*, !dbg !1539
  %37 = bitcast %struct.dim3* %grid9 to i8*, !dbg !1539
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %36, i8* align 4 %37, i64 12, i1 false), !dbg !1539
  %38 = bitcast %struct.dim3* %agg.tmp21 to i8*, !dbg !1540
  %39 = bitcast %struct.dim3* %block to i8*, !dbg !1540
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %38, i8* align 4 %39, i64 12, i1 false), !dbg !1540
  %40 = bitcast { i64, i32 }* %agg.tmp20.coerce to i8*, !dbg !1541
  %41 = bitcast %struct.dim3* %agg.tmp20 to i8*, !dbg !1541
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %40, i8* align 4 %41, i64 12, i1 false), !dbg !1541
  %42 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp20.coerce, i32 0, i32 0, !dbg !1541
  %43 = load i64, i64* %42, align 4, !dbg !1541
  %44 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp20.coerce, i32 0, i32 1, !dbg !1541
  %45 = load i32, i32* %44, align 4, !dbg !1541
  %46 = bitcast { i64, i32 }* %agg.tmp21.coerce to i8*, !dbg !1541
  %47 = bitcast %struct.dim3* %agg.tmp21 to i8*, !dbg !1541
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %46, i8* align 4 %47, i64 12, i1 false), !dbg !1541
  %48 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp21.coerce, i32 0, i32 0, !dbg !1541
  %49 = load i64, i64* %48, align 4, !dbg !1541
  %50 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp21.coerce, i32 0, i32 1, !dbg !1541
  %51 = load i32, i32* %50, align 4, !dbg !1541
  %call22 = call i32 @cudaConfigureCall(i64 %43, i32 %45, i64 %49, i32 %51, i64 noundef 0, %struct.CUstream_st* noundef null), !dbg !1541
  %tobool23 = icmp ne i32 %call22, 0, !dbg !1541
  br i1 %tobool23, label %kcall.end25, label %kcall.configok24, !dbg !1542

kcall.configok24:                                 ; preds = %kcall.end
  %52 = load i32, i32* %ni.addr, align 4, !dbg !1543
  %53 = load i32, i32* %nj.addr, align 4, !dbg !1544
  %54 = load i32, i32* %nk.addr, align 4, !dbg !1545
  %55 = load i32, i32* %nl.addr, align 4, !dbg !1546
  %56 = load double, double* %alpha.addr, align 8, !dbg !1547
  %57 = load double, double* %beta.addr, align 8, !dbg !1548
  %58 = load double*, double** %tmp.addr, align 8, !dbg !1549
  %59 = load double*, double** %A.addr, align 8, !dbg !1550
  %60 = load double*, double** %B.addr, align 8, !dbg !1551
  %61 = load double*, double** %C.addr, align 8, !dbg !1552
  %62 = load double*, double** %D.addr, align 8, !dbg !1553
  call void @_Z38__device_stub__kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S_(i32 noundef %52, i32 noundef %53, i32 noundef %54, i32 noundef %55, double noundef %56, double noundef %57, double* noundef %58, double* noundef %59, double* noundef %60, double* noundef %61, double* noundef %62), !dbg !1542
  br label %kcall.end25, !dbg !1542

kcall.end25:                                      ; preds = %kcall.configok24, %kcall.end
  ret void, !dbg !1554
}

declare dso_local i32 @cudaFree(i8* noundef) #7

; Function Attrs: mustprogress noinline uwtable
define internal void @_ZL11print_arrayiiPd(i32 noundef %ni, i32 noundef %nl, double* noundef %D) #6 !dbg !1555 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %D.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !1558, metadata !DIExpression()), !dbg !1559
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !1560, metadata !DIExpression()), !dbg !1561
  store double* %D, double** %D.addr, align 8
  call void @llvm.dbg.declare(metadata double** %D.addr, metadata !1562, metadata !DIExpression()), !dbg !1563
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1564, metadata !DIExpression()), !dbg !1565
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1566, metadata !DIExpression()), !dbg !1567
  store i32 0, i32* %i, align 4, !dbg !1568
  br label %for.cond, !dbg !1570

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1571
  %1 = load i32, i32* %ni.addr, align 4, !dbg !1573
  %cmp = icmp slt i32 %0, %1, !dbg !1574
  br i1 %cmp, label %for.body, label %for.end10, !dbg !1575

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1576
  br label %for.cond1, !dbg !1578

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1579
  %3 = load i32, i32* %nl.addr, align 4, !dbg !1581
  %cmp2 = icmp slt i32 %2, %3, !dbg !1582
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1583

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1584
  %5 = load double*, double** %D.addr, align 8, !dbg !1586
  %6 = load i32, i32* %i, align 4, !dbg !1587
  %7 = load i32, i32* %ni.addr, align 4, !dbg !1588
  %mul = mul nsw i32 %6, %7, !dbg !1589
  %8 = load i32, i32* %j, align 4, !dbg !1590
  %add = add nsw i32 %mul, %8, !dbg !1591
  %idxprom = sext i32 %add to i64, !dbg !1586
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom, !dbg !1586
  %9 = load double, double* %arrayidx, align 8, !dbg !1586
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %4, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double noundef %9), !dbg !1592
  %10 = load i32, i32* %i, align 4, !dbg !1593
  %11 = load i32, i32* %ni.addr, align 4, !dbg !1595
  %mul4 = mul nsw i32 %10, %11, !dbg !1596
  %12 = load i32, i32* %j, align 4, !dbg !1597
  %add5 = add nsw i32 %mul4, %12, !dbg !1598
  %rem = srem i32 %add5, 20, !dbg !1599
  %cmp6 = icmp eq i32 %rem, 0, !dbg !1600
  br i1 %cmp6, label %if.then, label %if.end, !dbg !1601

if.then:                                          ; preds = %for.body3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1602
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %13, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1603
  br label %if.end, !dbg !1603

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !1604

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %j, align 4, !dbg !1605
  %inc = add nsw i32 %14, 1, !dbg !1605
  store i32 %inc, i32* %j, align 4, !dbg !1605
  br label %for.cond1, !dbg !1606, !llvm.loop !1607

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !1608

for.inc8:                                         ; preds = %for.end
  %15 = load i32, i32* %i, align 4, !dbg !1609
  %inc9 = add nsw i32 %15, 1, !dbg !1609
  store i32 %inc9, i32* %i, align 4, !dbg !1609
  br label %for.cond, !dbg !1610, !llvm.loop !1611

for.end10:                                        ; preds = %for.cond
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1613
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %16, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1614
  ret void, !dbg !1615
}

; Function Attrs: nounwind
declare dso_local void @free(i8* noundef) #5

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* noundef nonnull align 4 dereferenceable(12) %this, i32 noundef %vx, i32 noundef %vy, i32 noundef %vz) unnamed_addr #8 comdat align 2 !dbg !1616 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1617, metadata !DIExpression()), !dbg !1619
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1620, metadata !DIExpression()), !dbg !1621
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1622, metadata !DIExpression()), !dbg !1623
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1624, metadata !DIExpression()), !dbg !1625
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1626
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1627
  store i32 %0, i32* %x, align 4, !dbg !1626
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1628
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1629
  store i32 %1, i32* %y, align 4, !dbg !1628
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1630
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1631
  store i32 %2, i32* %z, align 4, !dbg !1630
  ret void, !dbg !1632
}

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64 noundef, %struct.CUstream_st* noundef) #7

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #9

declare dso_local i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #7

declare dso_local i32 @cudaMalloc(i8** noundef, i64 noundef) #7

attributes #0 = { noinline norecurse uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress noinline norecurse uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { argmemonly nofree nounwind willreturn }
attributes #10 = { nounwind readonly willreturn }
attributes #11 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.dbg.cu = !{!6}
!llvm.ident = !{!970}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 7, !"Dwarf Version", i32 5}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !7, producer: "clang version 14.0.6 (https://github.com/andrewhe-princeton/llvm-project-linkcudafe a53d292d961c119a051729d608a48499697ae08e)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !100, imports: !127, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "2mm.cu", directory: "/u/ah7226/xstack-benchmark/polybench-cuda/2mm", checksumkind: CSK_MD5, checksum: "5c8840f9ec005306fa832b22959f72c0")
!8 = !{!9, !18}
!9 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !10, line: 796, baseType: !11, size: 32, elements: !12, identifier: "_ZTS14cudaMemcpyKind")
!10 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "", checksumkind: CSK_MD5, checksum: "47b878b3354d5ce593f0965f5477fd52")
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!13, !14, !15, !16, !17}
!13 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!14 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!15 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!16 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!17 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !10, line: 150, baseType: !11, size: 32, elements: !19, identifier: "_ZTS9cudaError")
!19 = !{!20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99}
!20 = !DIEnumerator(name: "cudaSuccess", value: 0, isUnsigned: true)
!21 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1, isUnsigned: true)
!22 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2, isUnsigned: true)
!23 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3, isUnsigned: true)
!24 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4, isUnsigned: true)
!25 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5, isUnsigned: true)
!26 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6, isUnsigned: true)
!27 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7, isUnsigned: true)
!28 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8, isUnsigned: true)
!29 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9, isUnsigned: true)
!30 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10, isUnsigned: true)
!31 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11, isUnsigned: true)
!32 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12, isUnsigned: true)
!33 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13, isUnsigned: true)
!34 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14, isUnsigned: true)
!35 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15, isUnsigned: true)
!36 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16, isUnsigned: true)
!37 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!38 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18, isUnsigned: true)
!39 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19, isUnsigned: true)
!40 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20, isUnsigned: true)
!41 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!42 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22, isUnsigned: true)
!43 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23, isUnsigned: true)
!44 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24, isUnsigned: true)
!45 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25, isUnsigned: true)
!46 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26, isUnsigned: true)
!47 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27, isUnsigned: true)
!48 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28, isUnsigned: true)
!49 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29, isUnsigned: true)
!50 = !DIEnumerator(name: "cudaErrorUnknown", value: 30, isUnsigned: true)
!51 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31, isUnsigned: true)
!52 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32, isUnsigned: true)
!53 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33, isUnsigned: true)
!54 = !DIEnumerator(name: "cudaErrorNotReady", value: 34, isUnsigned: true)
!55 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35, isUnsigned: true)
!56 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36, isUnsigned: true)
!57 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37, isUnsigned: true)
!58 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38, isUnsigned: true)
!59 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39, isUnsigned: true)
!60 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40, isUnsigned: true)
!61 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41, isUnsigned: true)
!62 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42, isUnsigned: true)
!63 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43, isUnsigned: true)
!64 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44, isUnsigned: true)
!65 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45, isUnsigned: true)
!66 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46, isUnsigned: true)
!67 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47, isUnsigned: true)
!68 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48, isUnsigned: true)
!69 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49, isUnsigned: true)
!70 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50, isUnsigned: true)
!71 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51, isUnsigned: true)
!72 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54, isUnsigned: true)
!73 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55, isUnsigned: true)
!74 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56, isUnsigned: true)
!75 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57, isUnsigned: true)
!76 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58, isUnsigned: true)
!77 = !DIEnumerator(name: "cudaErrorAssert", value: 59, isUnsigned: true)
!78 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60, isUnsigned: true)
!79 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61, isUnsigned: true)
!80 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62, isUnsigned: true)
!81 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63, isUnsigned: true)
!82 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64, isUnsigned: true)
!83 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65, isUnsigned: true)
!84 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66, isUnsigned: true)
!85 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67, isUnsigned: true)
!86 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68, isUnsigned: true)
!87 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69, isUnsigned: true)
!88 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70, isUnsigned: true)
!89 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71, isUnsigned: true)
!90 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72, isUnsigned: true)
!91 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73, isUnsigned: true)
!92 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74, isUnsigned: true)
!93 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75, isUnsigned: true)
!94 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76, isUnsigned: true)
!95 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77, isUnsigned: true)
!96 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78, isUnsigned: true)
!97 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79, isUnsigned: true)
!98 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127, isUnsigned: true)
!99 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000, isUnsigned: true)
!100 = !{!101, !103, !102, !104, !105}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !106, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !107, identifier: "_ZTS4dim3")
!106 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "", checksumkind: CSK_MD5, checksum: "f3556ae0cd0322db142a7014a8724339")
!107 = !{!108, !109, !110, !111, !115, !124}
!108 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !105, file: !106, line: 419, baseType: !11, size: 32)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !105, file: !106, line: 419, baseType: !11, size: 32, offset: 32)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !105, file: !106, line: 419, baseType: !11, size: 32, offset: 64)
!111 = !DISubprogram(name: "dim3", scope: !105, file: !106, line: 421, type: !112, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{null, !114, !11, !11, !11}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!115 = !DISubprogram(name: "dim3", scope: !105, file: !106, line: 422, type: !116, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{null, !114, !118}
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !106, line: 383, baseType: !119)
!119 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !106, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !120, identifier: "_ZTS5uint3")
!120 = !{!121, !122, !123}
!121 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !119, file: !106, line: 192, baseType: !11, size: 32)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !119, file: !106, line: 192, baseType: !11, size: 32, offset: 32)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !119, file: !106, line: 192, baseType: !11, size: 32, offset: 64)
!124 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !105, file: !106, line: 423, type: !125, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DISubroutineType(types: !126)
!126 = !{!118, !114}
!127 = !{!128, !135, !140, !142, !144, !146, !148, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !180, !184, !186, !188, !190, !194, !199, !201, !203, !208, !212, !214, !216, !218, !220, !222, !224, !226, !228, !233, !237, !239, !244, !248, !250, !252, !254, !256, !258, !262, !264, !266, !271, !278, !282, !284, !286, !288, !290, !294, !296, !298, !302, !304, !306, !308, !310, !312, !314, !316, !318, !320, !324, !330, !332, !334, !338, !340, !342, !344, !346, !348, !350, !352, !356, !360, !362, !364, !368, !370, !372, !374, !376, !378, !380, !383, !385, !387, !389, !394, !396, !398, !400, !402, !404, !406, !408, !410, !412, !414, !416, !420, !422, !424, !426, !428, !430, !432, !434, !436, !438, !440, !442, !444, !446, !448, !450, !454, !456, !460, !462, !464, !466, !468, !470, !472, !474, !476, !478, !482, !484, !488, !490, !492, !494, !498, !500, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !532, !534, !538, !540, !542, !544, !546, !548, !552, !554, !556, !558, !560, !562, !564, !568, !572, !574, !576, !578, !580, !584, !586, !590, !592, !594, !596, !598, !600, !602, !606, !608, !612, !614, !616, !620, !622, !624, !626, !628, !630, !632, !636, !642, !646, !651, !653, !655, !659, !663, !676, !680, !684, !688, !692, !697, !699, !703, !707, !711, !719, !723, !727, !729, !733, !737, !741, !747, !751, !755, !757, !765, !769, !776, !778, !780, !784, !788, !792, !797, !801, !805, !806, !807, !808, !810, !811, !812, !813, !814, !815, !816, !818, !819, !820, !821, !822, !823, !824, !826, !827, !828, !829, !830, !831, !832, !833, !834, !835, !836, !837, !838, !839, !840, !841, !842, !843, !844, !845, !846, !847, !848, !849, !850, !854, !856, !858, !860, !862, !864, !866, !868, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !927, !929, !931, !933, !935, !937, !939, !941, !943, !945, !947, !949, !951, !953, !955, !957, !959, !961, !963, !965}
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !130, file: !131, line: 200)
!129 = !DINamespace(name: "std", scope: null)
!130 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !131, file: !131, line: 30, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!131 = !DIFile(filename: "/scratch/ah7226/install-14-cudafe/lib/clang/14.0.6/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!132 = !DISubroutineType(types: !133)
!133 = !{!134, !134}
!134 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !136, file: !131, line: 201)
!136 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !131, file: !131, line: 32, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!137 = !DISubroutineType(types: !138)
!138 = !{!139, !139}
!139 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !141, file: !131, line: 202)
!141 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !131, file: !131, line: 34, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !143, file: !131, line: 203)
!143 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !131, file: !131, line: 36, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !145, file: !131, line: 204)
!145 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !131, file: !131, line: 38, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !147, file: !131, line: 205)
!147 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !131, file: !131, line: 42, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !149, file: !131, line: 206)
!149 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !131, file: !131, line: 40, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!150 = !DISubroutineType(types: !151)
!151 = !{!139, !139, !139}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !153, file: !131, line: 207)
!153 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !131, file: !131, line: 44, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !155, file: !131, line: 208)
!155 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !131, file: !131, line: 46, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !157, file: !131, line: 209)
!157 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !131, file: !131, line: 48, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !159, file: !131, line: 210)
!159 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !131, file: !131, line: 50, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !161, file: !131, line: 211)
!161 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !131, file: !131, line: 52, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !163, file: !131, line: 212)
!163 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !131, file: !131, line: 54, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !165, file: !131, line: 213)
!165 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !131, file: !131, line: 58, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !167, file: !131, line: 214)
!167 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !131, file: !131, line: 56, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !169, file: !131, line: 215)
!169 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !131, file: !131, line: 62, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !171, file: !131, line: 216)
!171 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !131, file: !131, line: 60, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !173, file: !131, line: 217)
!173 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !131, file: !131, line: 64, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !175, file: !131, line: 218)
!175 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !131, file: !131, line: 66, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !177, file: !131, line: 219)
!177 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !131, file: !131, line: 68, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !179, file: !131, line: 220)
!179 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !131, file: !131, line: 70, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !181, file: !131, line: 221)
!181 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !131, file: !131, line: 72, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!182 = !DISubroutineType(types: !183)
!183 = !{!139, !139, !139, !139}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !185, file: !131, line: 222)
!185 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !131, file: !131, line: 74, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !187, file: !131, line: 223)
!187 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !131, file: !131, line: 76, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !189, file: !131, line: 224)
!189 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !131, file: !131, line: 78, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !191, file: !131, line: 225)
!191 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !131, file: !131, line: 80, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!192 = !DISubroutineType(types: !193)
!193 = !{!134, !139}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !195, file: !131, line: 226)
!195 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !131, file: !131, line: 82, type: !196, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!196 = !DISubroutineType(types: !197)
!197 = !{!139, !139, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !200, file: !131, line: 227)
!200 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !131, file: !131, line: 84, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !202, file: !131, line: 228)
!202 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !131, file: !131, line: 86, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !204, file: !131, line: 229)
!204 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !131, file: !131, line: 91, type: !205, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!205 = !DISubroutineType(types: !206)
!206 = !{!207, !139}
!207 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !209, file: !131, line: 230)
!209 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !131, file: !131, line: 95, type: !210, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!210 = !DISubroutineType(types: !211)
!211 = !{!207, !139, !139}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !213, file: !131, line: 231)
!213 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !131, file: !131, line: 94, type: !210, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !215, file: !131, line: 232)
!215 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !131, file: !131, line: 100, type: !205, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !217, file: !131, line: 233)
!217 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !131, file: !131, line: 104, type: !210, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !219, file: !131, line: 234)
!219 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !131, file: !131, line: 103, type: !210, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !221, file: !131, line: 235)
!221 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !131, file: !131, line: 106, type: !210, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !223, file: !131, line: 236)
!223 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !131, file: !131, line: 111, type: !205, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !225, file: !131, line: 237)
!225 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !131, file: !131, line: 113, type: !205, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !227, file: !131, line: 238)
!227 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !131, file: !131, line: 115, type: !210, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !229, file: !131, line: 239)
!229 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !131, file: !131, line: 116, type: !230, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!230 = !DISubroutineType(types: !231)
!231 = !{!232, !232}
!232 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !234, file: !131, line: 240)
!234 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !131, file: !131, line: 118, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!235 = !DISubroutineType(types: !236)
!236 = !{!139, !139, !134}
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !238, file: !131, line: 241)
!238 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !131, file: !131, line: 120, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !240, file: !131, line: 242)
!240 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !131, file: !131, line: 121, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!241 = !DISubroutineType(types: !242)
!242 = !{!243, !243}
!243 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !245, file: !131, line: 243)
!245 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !131, file: !131, line: 123, type: !246, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!246 = !DISubroutineType(types: !247)
!247 = !{!243, !139}
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !249, file: !131, line: 244)
!249 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !131, file: !131, line: 133, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !251, file: !131, line: 245)
!251 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !131, file: !131, line: 125, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !253, file: !131, line: 246)
!253 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !131, file: !131, line: 127, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !255, file: !131, line: 247)
!255 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !131, file: !131, line: 129, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !257, file: !131, line: 248)
!257 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !131, file: !131, line: 131, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !259, file: !131, line: 249)
!259 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !131, file: !131, line: 135, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!260 = !DISubroutineType(types: !261)
!261 = !{!232, !139}
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !263, file: !131, line: 250)
!263 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !131, file: !131, line: 137, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !265, file: !131, line: 251)
!265 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !131, file: !131, line: 138, type: !246, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !267, file: !131, line: 252)
!267 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !131, file: !131, line: 140, type: !268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!268 = !DISubroutineType(types: !269)
!269 = !{!139, !139, !270}
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !272, file: !131, line: 253)
!272 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !131, file: !131, line: 141, type: !273, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!273 = !DISubroutineType(types: !274)
!274 = !{!102, !275}
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!276 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !277)
!277 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !279, file: !131, line: 254)
!279 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !131, file: !131, line: 142, type: !280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!280 = !DISubroutineType(types: !281)
!281 = !{!139, !275}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !283, file: !131, line: 255)
!283 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !131, file: !131, line: 144, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !285, file: !131, line: 256)
!285 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !131, file: !131, line: 146, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !287, file: !131, line: 257)
!287 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !131, file: !131, line: 150, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !289, file: !131, line: 258)
!289 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !131, file: !131, line: 152, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !291, file: !131, line: 259)
!291 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !131, file: !131, line: 154, type: !292, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!292 = !DISubroutineType(types: !293)
!293 = !{!139, !139, !139, !198}
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !295, file: !131, line: 260)
!295 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !131, file: !131, line: 156, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !297, file: !131, line: 261)
!297 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !131, file: !131, line: 158, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !299, file: !131, line: 262)
!299 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !131, file: !131, line: 160, type: !300, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!300 = !DISubroutineType(types: !301)
!301 = !{!139, !139, !232}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !303, file: !131, line: 263)
!303 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !131, file: !131, line: 162, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !305, file: !131, line: 264)
!305 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !131, file: !131, line: 167, type: !205, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !307, file: !131, line: 265)
!307 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !131, file: !131, line: 169, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !309, file: !131, line: 266)
!309 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !131, file: !131, line: 171, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !311, file: !131, line: 267)
!311 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !131, file: !131, line: 173, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !313, file: !131, line: 268)
!313 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !131, file: !131, line: 175, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !315, file: !131, line: 269)
!315 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !131, file: !131, line: 177, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !317, file: !131, line: 270)
!317 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !131, file: !131, line: 179, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !319, file: !131, line: 271)
!319 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !131, file: !131, line: 181, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !321, file: !323, line: 52)
!321 = !DISubprogram(name: "abs", scope: !322, file: !322, line: 840, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f0db66726d35051e5af2525f5b33bd81")
!323 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !325, file: !329, line: 83)
!325 = !DISubprogram(name: "acos", scope: !326, file: !326, line: 53, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "833006f6c08fa0a86f73f7ac7f62dccb")
!327 = !DISubroutineType(types: !328)
!328 = !{!102, !102}
!329 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cmath", directory: "")
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !331, file: !329, line: 102)
!331 = !DISubprogram(name: "asin", scope: !326, file: !326, line: 55, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !333, file: !329, line: 121)
!333 = !DISubprogram(name: "atan", scope: !326, file: !326, line: 57, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !335, file: !329, line: 140)
!335 = !DISubprogram(name: "atan2", scope: !326, file: !326, line: 59, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!336 = !DISubroutineType(types: !337)
!337 = !{!102, !102, !102}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !339, file: !329, line: 161)
!339 = !DISubprogram(name: "ceil", scope: !326, file: !326, line: 159, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !341, file: !329, line: 180)
!341 = !DISubprogram(name: "cos", scope: !326, file: !326, line: 62, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !343, file: !329, line: 199)
!343 = !DISubprogram(name: "cosh", scope: !326, file: !326, line: 71, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !345, file: !329, line: 218)
!345 = !DISubprogram(name: "exp", scope: !326, file: !326, line: 95, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !347, file: !329, line: 237)
!347 = !DISubprogram(name: "fabs", scope: !326, file: !326, line: 162, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !349, file: !329, line: 256)
!349 = !DISubprogram(name: "floor", scope: !326, file: !326, line: 165, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !351, file: !329, line: 275)
!351 = !DISubprogram(name: "fmod", scope: !326, file: !326, line: 168, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !353, file: !329, line: 296)
!353 = !DISubprogram(name: "frexp", scope: !326, file: !326, line: 98, type: !354, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DISubroutineType(types: !355)
!355 = !{!102, !102, !198}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !357, file: !329, line: 315)
!357 = !DISubprogram(name: "ldexp", scope: !326, file: !326, line: 101, type: !358, flags: DIFlagPrototyped, spFlags: 0)
!358 = !DISubroutineType(types: !359)
!359 = !{!102, !102, !134}
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !361, file: !329, line: 334)
!361 = !DISubprogram(name: "log", scope: !326, file: !326, line: 104, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !363, file: !329, line: 353)
!363 = !DISubprogram(name: "log10", scope: !326, file: !326, line: 107, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !365, file: !329, line: 372)
!365 = !DISubprogram(name: "modf", scope: !326, file: !326, line: 110, type: !366, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DISubroutineType(types: !367)
!367 = !{!102, !102, !101}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !369, file: !329, line: 384)
!369 = !DISubprogram(name: "pow", scope: !326, file: !326, line: 140, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !371, file: !329, line: 421)
!371 = !DISubprogram(name: "sin", scope: !326, file: !326, line: 64, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !373, file: !329, line: 440)
!373 = !DISubprogram(name: "sinh", scope: !326, file: !326, line: 73, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !375, file: !329, line: 459)
!375 = !DISubprogram(name: "sqrt", scope: !326, file: !326, line: 143, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !377, file: !329, line: 478)
!377 = !DISubprogram(name: "tan", scope: !326, file: !326, line: 66, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !379, file: !329, line: 497)
!379 = !DISubprogram(name: "tanh", scope: !326, file: !326, line: 75, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !381, file: !329, line: 1065)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !382, line: 150, baseType: !102)
!382 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "2fed8744bf26ef122777e2a4593ca401")
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !384, file: !329, line: 1066)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !382, line: 149, baseType: !139)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !386, file: !329, line: 1069)
!386 = !DISubprogram(name: "acosh", scope: !326, file: !326, line: 85, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !388, file: !329, line: 1070)
!388 = !DISubprogram(name: "acoshf", scope: !326, file: !326, line: 85, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !390, file: !329, line: 1071)
!390 = !DISubprogram(name: "acoshl", scope: !326, file: !326, line: 85, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!391 = !DISubroutineType(types: !392)
!392 = !{!393, !393}
!393 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !395, file: !329, line: 1073)
!395 = !DISubprogram(name: "asinh", scope: !326, file: !326, line: 87, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !397, file: !329, line: 1074)
!397 = !DISubprogram(name: "asinhf", scope: !326, file: !326, line: 87, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !399, file: !329, line: 1075)
!399 = !DISubprogram(name: "asinhl", scope: !326, file: !326, line: 87, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !401, file: !329, line: 1077)
!401 = !DISubprogram(name: "atanh", scope: !326, file: !326, line: 89, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !403, file: !329, line: 1078)
!403 = !DISubprogram(name: "atanhf", scope: !326, file: !326, line: 89, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !405, file: !329, line: 1079)
!405 = !DISubprogram(name: "atanhl", scope: !326, file: !326, line: 89, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !407, file: !329, line: 1081)
!407 = !DISubprogram(name: "cbrt", scope: !326, file: !326, line: 152, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !409, file: !329, line: 1082)
!409 = !DISubprogram(name: "cbrtf", scope: !326, file: !326, line: 152, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !411, file: !329, line: 1083)
!411 = !DISubprogram(name: "cbrtl", scope: !326, file: !326, line: 152, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !413, file: !329, line: 1085)
!413 = !DISubprogram(name: "copysign", scope: !326, file: !326, line: 196, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !415, file: !329, line: 1086)
!415 = !DISubprogram(name: "copysignf", scope: !326, file: !326, line: 196, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !417, file: !329, line: 1087)
!417 = !DISubprogram(name: "copysignl", scope: !326, file: !326, line: 196, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!418 = !DISubroutineType(types: !419)
!419 = !{!393, !393, !393}
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !421, file: !329, line: 1089)
!421 = !DISubprogram(name: "erf", scope: !326, file: !326, line: 228, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !423, file: !329, line: 1090)
!423 = !DISubprogram(name: "erff", scope: !326, file: !326, line: 228, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !425, file: !329, line: 1091)
!425 = !DISubprogram(name: "erfl", scope: !326, file: !326, line: 228, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !427, file: !329, line: 1093)
!427 = !DISubprogram(name: "erfc", scope: !326, file: !326, line: 229, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !429, file: !329, line: 1094)
!429 = !DISubprogram(name: "erfcf", scope: !326, file: !326, line: 229, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !431, file: !329, line: 1095)
!431 = !DISubprogram(name: "erfcl", scope: !326, file: !326, line: 229, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !433, file: !329, line: 1097)
!433 = !DISubprogram(name: "exp2", scope: !326, file: !326, line: 130, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !435, file: !329, line: 1098)
!435 = !DISubprogram(name: "exp2f", scope: !326, file: !326, line: 130, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !437, file: !329, line: 1099)
!437 = !DISubprogram(name: "exp2l", scope: !326, file: !326, line: 130, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !439, file: !329, line: 1101)
!439 = !DISubprogram(name: "expm1", scope: !326, file: !326, line: 119, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !441, file: !329, line: 1102)
!441 = !DISubprogram(name: "expm1f", scope: !326, file: !326, line: 119, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !443, file: !329, line: 1103)
!443 = !DISubprogram(name: "expm1l", scope: !326, file: !326, line: 119, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !445, file: !329, line: 1105)
!445 = !DISubprogram(name: "fdim", scope: !326, file: !326, line: 326, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !447, file: !329, line: 1106)
!447 = !DISubprogram(name: "fdimf", scope: !326, file: !326, line: 326, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !449, file: !329, line: 1107)
!449 = !DISubprogram(name: "fdiml", scope: !326, file: !326, line: 326, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !451, file: !329, line: 1109)
!451 = !DISubprogram(name: "fma", scope: !326, file: !326, line: 335, type: !452, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DISubroutineType(types: !453)
!453 = !{!102, !102, !102, !102}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !455, file: !329, line: 1110)
!455 = !DISubprogram(name: "fmaf", scope: !326, file: !326, line: 335, type: !182, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !457, file: !329, line: 1111)
!457 = !DISubprogram(name: "fmal", scope: !326, file: !326, line: 335, type: !458, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DISubroutineType(types: !459)
!459 = !{!393, !393, !393, !393}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !461, file: !329, line: 1113)
!461 = !DISubprogram(name: "fmax", scope: !326, file: !326, line: 329, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !463, file: !329, line: 1114)
!463 = !DISubprogram(name: "fmaxf", scope: !326, file: !326, line: 329, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !465, file: !329, line: 1115)
!465 = !DISubprogram(name: "fmaxl", scope: !326, file: !326, line: 329, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !467, file: !329, line: 1117)
!467 = !DISubprogram(name: "fmin", scope: !326, file: !326, line: 332, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !469, file: !329, line: 1118)
!469 = !DISubprogram(name: "fminf", scope: !326, file: !326, line: 332, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !471, file: !329, line: 1119)
!471 = !DISubprogram(name: "fminl", scope: !326, file: !326, line: 332, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !473, file: !329, line: 1121)
!473 = !DISubprogram(name: "hypot", scope: !326, file: !326, line: 147, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !475, file: !329, line: 1122)
!475 = !DISubprogram(name: "hypotf", scope: !326, file: !326, line: 147, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !477, file: !329, line: 1123)
!477 = !DISubprogram(name: "hypotl", scope: !326, file: !326, line: 147, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !479, file: !329, line: 1125)
!479 = !DISubprogram(name: "ilogb", scope: !326, file: !326, line: 280, type: !480, flags: DIFlagPrototyped, spFlags: 0)
!480 = !DISubroutineType(types: !481)
!481 = !{!134, !102}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !483, file: !329, line: 1126)
!483 = !DISubprogram(name: "ilogbf", scope: !326, file: !326, line: 280, type: !192, flags: DIFlagPrototyped, spFlags: 0)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !485, file: !329, line: 1127)
!485 = !DISubprogram(name: "ilogbl", scope: !326, file: !326, line: 280, type: !486, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DISubroutineType(types: !487)
!487 = !{!134, !393}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !489, file: !329, line: 1129)
!489 = !DISubprogram(name: "lgamma", scope: !326, file: !326, line: 230, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !491, file: !329, line: 1130)
!491 = !DISubprogram(name: "lgammaf", scope: !326, file: !326, line: 230, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !493, file: !329, line: 1131)
!493 = !DISubprogram(name: "lgammal", scope: !326, file: !326, line: 230, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !495, file: !329, line: 1134)
!495 = !DISubprogram(name: "llrint", scope: !326, file: !326, line: 316, type: !496, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DISubroutineType(types: !497)
!497 = !{!243, !102}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !499, file: !329, line: 1135)
!499 = !DISubprogram(name: "llrintf", scope: !326, file: !326, line: 316, type: !246, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !501, file: !329, line: 1136)
!501 = !DISubprogram(name: "llrintl", scope: !326, file: !326, line: 316, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DISubroutineType(types: !503)
!503 = !{!243, !393}
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !505, file: !329, line: 1138)
!505 = !DISubprogram(name: "llround", scope: !326, file: !326, line: 322, type: !496, flags: DIFlagPrototyped, spFlags: 0)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !507, file: !329, line: 1139)
!507 = !DISubprogram(name: "llroundf", scope: !326, file: !326, line: 322, type: !246, flags: DIFlagPrototyped, spFlags: 0)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !509, file: !329, line: 1140)
!509 = !DISubprogram(name: "llroundl", scope: !326, file: !326, line: 322, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !511, file: !329, line: 1143)
!511 = !DISubprogram(name: "log1p", scope: !326, file: !326, line: 122, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !513, file: !329, line: 1144)
!513 = !DISubprogram(name: "log1pf", scope: !326, file: !326, line: 122, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !515, file: !329, line: 1145)
!515 = !DISubprogram(name: "log1pl", scope: !326, file: !326, line: 122, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !517, file: !329, line: 1147)
!517 = !DISubprogram(name: "log2", scope: !326, file: !326, line: 133, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !519, file: !329, line: 1148)
!519 = !DISubprogram(name: "log2f", scope: !326, file: !326, line: 133, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !521, file: !329, line: 1149)
!521 = !DISubprogram(name: "log2l", scope: !326, file: !326, line: 133, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !523, file: !329, line: 1151)
!523 = !DISubprogram(name: "logb", scope: !326, file: !326, line: 125, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !525, file: !329, line: 1152)
!525 = !DISubprogram(name: "logbf", scope: !326, file: !326, line: 125, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !527, file: !329, line: 1153)
!527 = !DISubprogram(name: "logbl", scope: !326, file: !326, line: 125, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !529, file: !329, line: 1155)
!529 = !DISubprogram(name: "lrint", scope: !326, file: !326, line: 314, type: !530, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DISubroutineType(types: !531)
!531 = !{!232, !102}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !533, file: !329, line: 1156)
!533 = !DISubprogram(name: "lrintf", scope: !326, file: !326, line: 314, type: !260, flags: DIFlagPrototyped, spFlags: 0)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !535, file: !329, line: 1157)
!535 = !DISubprogram(name: "lrintl", scope: !326, file: !326, line: 314, type: !536, flags: DIFlagPrototyped, spFlags: 0)
!536 = !DISubroutineType(types: !537)
!537 = !{!232, !393}
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !539, file: !329, line: 1159)
!539 = !DISubprogram(name: "lround", scope: !326, file: !326, line: 320, type: !530, flags: DIFlagPrototyped, spFlags: 0)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !541, file: !329, line: 1160)
!541 = !DISubprogram(name: "lroundf", scope: !326, file: !326, line: 320, type: !260, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !543, file: !329, line: 1161)
!543 = !DISubprogram(name: "lroundl", scope: !326, file: !326, line: 320, type: !536, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !545, file: !329, line: 1163)
!545 = !DISubprogram(name: "nan", scope: !326, file: !326, line: 201, type: !273, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !547, file: !329, line: 1164)
!547 = !DISubprogram(name: "nanf", scope: !326, file: !326, line: 201, type: !280, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !549, file: !329, line: 1165)
!549 = !DISubprogram(name: "nanl", scope: !326, file: !326, line: 201, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!393, !275}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !553, file: !329, line: 1167)
!553 = !DISubprogram(name: "nearbyint", scope: !326, file: !326, line: 294, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !555, file: !329, line: 1168)
!555 = !DISubprogram(name: "nearbyintf", scope: !326, file: !326, line: 294, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !557, file: !329, line: 1169)
!557 = !DISubprogram(name: "nearbyintl", scope: !326, file: !326, line: 294, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !559, file: !329, line: 1171)
!559 = !DISubprogram(name: "nextafter", scope: !326, file: !326, line: 259, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !561, file: !329, line: 1172)
!561 = !DISubprogram(name: "nextafterf", scope: !326, file: !326, line: 259, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !563, file: !329, line: 1173)
!563 = !DISubprogram(name: "nextafterl", scope: !326, file: !326, line: 259, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !565, file: !329, line: 1175)
!565 = !DISubprogram(name: "nexttoward", scope: !326, file: !326, line: 261, type: !566, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DISubroutineType(types: !567)
!567 = !{!102, !102, !393}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !569, file: !329, line: 1176)
!569 = !DISubprogram(name: "nexttowardf", scope: !326, file: !326, line: 261, type: !570, flags: DIFlagPrototyped, spFlags: 0)
!570 = !DISubroutineType(types: !571)
!571 = !{!139, !139, !393}
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !573, file: !329, line: 1177)
!573 = !DISubprogram(name: "nexttowardl", scope: !326, file: !326, line: 261, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !575, file: !329, line: 1179)
!575 = !DISubprogram(name: "remainder", scope: !326, file: !326, line: 272, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !577, file: !329, line: 1180)
!577 = !DISubprogram(name: "remainderf", scope: !326, file: !326, line: 272, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !579, file: !329, line: 1181)
!579 = !DISubprogram(name: "remainderl", scope: !326, file: !326, line: 272, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !581, file: !329, line: 1183)
!581 = !DISubprogram(name: "remquo", scope: !326, file: !326, line: 307, type: !582, flags: DIFlagPrototyped, spFlags: 0)
!582 = !DISubroutineType(types: !583)
!583 = !{!102, !102, !102, !198}
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !585, file: !329, line: 1184)
!585 = !DISubprogram(name: "remquof", scope: !326, file: !326, line: 307, type: !292, flags: DIFlagPrototyped, spFlags: 0)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !587, file: !329, line: 1185)
!587 = !DISubprogram(name: "remquol", scope: !326, file: !326, line: 307, type: !588, flags: DIFlagPrototyped, spFlags: 0)
!588 = !DISubroutineType(types: !589)
!589 = !{!393, !393, !393, !198}
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !591, file: !329, line: 1187)
!591 = !DISubprogram(name: "rint", scope: !326, file: !326, line: 256, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !593, file: !329, line: 1188)
!593 = !DISubprogram(name: "rintf", scope: !326, file: !326, line: 256, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !595, file: !329, line: 1189)
!595 = !DISubprogram(name: "rintl", scope: !326, file: !326, line: 256, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !597, file: !329, line: 1191)
!597 = !DISubprogram(name: "round", scope: !326, file: !326, line: 298, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !599, file: !329, line: 1192)
!599 = !DISubprogram(name: "roundf", scope: !326, file: !326, line: 298, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !601, file: !329, line: 1193)
!601 = !DISubprogram(name: "roundl", scope: !326, file: !326, line: 298, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !603, file: !329, line: 1195)
!603 = !DISubprogram(name: "scalbln", scope: !326, file: !326, line: 290, type: !604, flags: DIFlagPrototyped, spFlags: 0)
!604 = !DISubroutineType(types: !605)
!605 = !{!102, !102, !232}
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !607, file: !329, line: 1196)
!607 = !DISubprogram(name: "scalblnf", scope: !326, file: !326, line: 290, type: !300, flags: DIFlagPrototyped, spFlags: 0)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !609, file: !329, line: 1197)
!609 = !DISubprogram(name: "scalblnl", scope: !326, file: !326, line: 290, type: !610, flags: DIFlagPrototyped, spFlags: 0)
!610 = !DISubroutineType(types: !611)
!611 = !{!393, !393, !232}
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !613, file: !329, line: 1199)
!613 = !DISubprogram(name: "scalbn", scope: !326, file: !326, line: 276, type: !358, flags: DIFlagPrototyped, spFlags: 0)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !615, file: !329, line: 1200)
!615 = !DISubprogram(name: "scalbnf", scope: !326, file: !326, line: 276, type: !235, flags: DIFlagPrototyped, spFlags: 0)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !617, file: !329, line: 1201)
!617 = !DISubprogram(name: "scalbnl", scope: !326, file: !326, line: 276, type: !618, flags: DIFlagPrototyped, spFlags: 0)
!618 = !DISubroutineType(types: !619)
!619 = !{!393, !393, !134}
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !621, file: !329, line: 1203)
!621 = !DISubprogram(name: "tgamma", scope: !326, file: !326, line: 235, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !623, file: !329, line: 1204)
!623 = !DISubprogram(name: "tgammaf", scope: !326, file: !326, line: 235, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !625, file: !329, line: 1205)
!625 = !DISubprogram(name: "tgammal", scope: !326, file: !326, line: 235, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !627, file: !329, line: 1207)
!627 = !DISubprogram(name: "trunc", scope: !326, file: !326, line: 302, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !629, file: !329, line: 1208)
!629 = !DISubprogram(name: "truncf", scope: !326, file: !326, line: 302, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !631, file: !329, line: 1209)
!631 = !DISubprogram(name: "truncl", scope: !326, file: !326, line: 302, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !633, file: !635, line: 127)
!633 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !322, line: 62, baseType: !634)
!634 = !DICompositeType(tag: DW_TAG_structure_type, file: !322, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!635 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/cstdlib", directory: "")
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !637, file: !635, line: 128)
!637 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !322, line: 70, baseType: !638)
!638 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !322, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !639, identifier: "_ZTS6ldiv_t")
!639 = !{!640, !641}
!640 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !638, file: !322, line: 68, baseType: !232, size: 64)
!641 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !638, file: !322, line: 69, baseType: !232, size: 64, offset: 64)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !643, file: !635, line: 130)
!643 = !DISubprogram(name: "abort", scope: !322, file: !322, line: 591, type: !644, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!644 = !DISubroutineType(types: !645)
!645 = !{null}
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !647, file: !635, line: 134)
!647 = !DISubprogram(name: "atexit", scope: !322, file: !322, line: 595, type: !648, flags: DIFlagPrototyped, spFlags: 0)
!648 = !DISubroutineType(types: !649)
!649 = !{!134, !650}
!650 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !644, size: 64)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !652, file: !635, line: 137)
!652 = !DISubprogram(name: "at_quick_exit", scope: !322, file: !322, line: 600, type: !648, flags: DIFlagPrototyped, spFlags: 0)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !654, file: !635, line: 140)
!654 = !DISubprogram(name: "atof", scope: !322, file: !322, line: 101, type: !273, flags: DIFlagPrototyped, spFlags: 0)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !656, file: !635, line: 141)
!656 = !DISubprogram(name: "atoi", scope: !322, file: !322, line: 104, type: !657, flags: DIFlagPrototyped, spFlags: 0)
!657 = !DISubroutineType(types: !658)
!658 = !{!134, !275}
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !660, file: !635, line: 142)
!660 = !DISubprogram(name: "atol", scope: !322, file: !322, line: 107, type: !661, flags: DIFlagPrototyped, spFlags: 0)
!661 = !DISubroutineType(types: !662)
!662 = !{!232, !275}
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !664, file: !635, line: 143)
!664 = !DISubprogram(name: "bsearch", scope: !322, file: !322, line: 820, type: !665, flags: DIFlagPrototyped, spFlags: 0)
!665 = !DISubroutineType(types: !666)
!666 = !{!103, !667, !667, !669, !669, !672}
!667 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !668, size: 64)
!668 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!669 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !670, line: 46, baseType: !671)
!670 = !DIFile(filename: "/scratch/ah7226/install-14-cudafe/lib/clang/14.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!671 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!672 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !322, line: 808, baseType: !673)
!673 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !674, size: 64)
!674 = !DISubroutineType(types: !675)
!675 = !{!134, !667, !667}
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !677, file: !635, line: 144)
!677 = !DISubprogram(name: "calloc", scope: !322, file: !322, line: 542, type: !678, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DISubroutineType(types: !679)
!679 = !{!103, !669, !669}
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !681, file: !635, line: 145)
!681 = !DISubprogram(name: "div", scope: !322, file: !322, line: 852, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DISubroutineType(types: !683)
!683 = !{!633, !134, !134}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !685, file: !635, line: 146)
!685 = !DISubprogram(name: "exit", scope: !322, file: !322, line: 617, type: !686, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!686 = !DISubroutineType(types: !687)
!687 = !{null, !134}
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !689, file: !635, line: 147)
!689 = !DISubprogram(name: "free", scope: !322, file: !322, line: 565, type: !690, flags: DIFlagPrototyped, spFlags: 0)
!690 = !DISubroutineType(types: !691)
!691 = !{null, !103}
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !693, file: !635, line: 148)
!693 = !DISubprogram(name: "getenv", scope: !322, file: !322, line: 634, type: !694, flags: DIFlagPrototyped, spFlags: 0)
!694 = !DISubroutineType(types: !695)
!695 = !{!696, !275}
!696 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !698, file: !635, line: 149)
!698 = !DISubprogram(name: "labs", scope: !322, file: !322, line: 841, type: !230, flags: DIFlagPrototyped, spFlags: 0)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !700, file: !635, line: 150)
!700 = !DISubprogram(name: "ldiv", scope: !322, file: !322, line: 854, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!701 = !DISubroutineType(types: !702)
!702 = !{!637, !232, !232}
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !704, file: !635, line: 151)
!704 = !DISubprogram(name: "malloc", scope: !322, file: !322, line: 539, type: !705, flags: DIFlagPrototyped, spFlags: 0)
!705 = !DISubroutineType(types: !706)
!706 = !{!103, !669}
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !708, file: !635, line: 153)
!708 = !DISubprogram(name: "mblen", scope: !322, file: !322, line: 922, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DISubroutineType(types: !710)
!710 = !{!134, !275, !669}
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !712, file: !635, line: 154)
!712 = !DISubprogram(name: "mbstowcs", scope: !322, file: !322, line: 933, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DISubroutineType(types: !714)
!714 = !{!669, !715, !718, !669}
!715 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !716)
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !717, size: 64)
!717 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!718 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !275)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !720, file: !635, line: 155)
!720 = !DISubprogram(name: "mbtowc", scope: !322, file: !322, line: 925, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DISubroutineType(types: !722)
!722 = !{!134, !715, !718, !669}
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !724, file: !635, line: 157)
!724 = !DISubprogram(name: "qsort", scope: !322, file: !322, line: 830, type: !725, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DISubroutineType(types: !726)
!726 = !{null, !103, !669, !669, !672}
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !728, file: !635, line: 160)
!728 = !DISubprogram(name: "quick_exit", scope: !322, file: !322, line: 623, type: !686, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !730, file: !635, line: 163)
!730 = !DISubprogram(name: "rand", scope: !322, file: !322, line: 453, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DISubroutineType(types: !732)
!732 = !{!134}
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !734, file: !635, line: 164)
!734 = !DISubprogram(name: "realloc", scope: !322, file: !322, line: 550, type: !735, flags: DIFlagPrototyped, spFlags: 0)
!735 = !DISubroutineType(types: !736)
!736 = !{!103, !103, !669}
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !738, file: !635, line: 165)
!738 = !DISubprogram(name: "srand", scope: !322, file: !322, line: 455, type: !739, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DISubroutineType(types: !740)
!740 = !{null, !11}
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !742, file: !635, line: 166)
!742 = !DISubprogram(name: "strtod", scope: !322, file: !322, line: 117, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DISubroutineType(types: !744)
!744 = !{!102, !718, !745}
!745 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !746)
!746 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !696, size: 64)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !748, file: !635, line: 167)
!748 = !DISubprogram(name: "strtol", scope: !322, file: !322, line: 176, type: !749, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DISubroutineType(types: !750)
!750 = !{!232, !718, !745, !134}
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !752, file: !635, line: 168)
!752 = !DISubprogram(name: "strtoul", scope: !322, file: !322, line: 180, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!753 = !DISubroutineType(types: !754)
!754 = !{!671, !718, !745, !134}
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !756, file: !635, line: 169)
!756 = !DISubprogram(name: "system", scope: !322, file: !322, line: 784, type: !657, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !758, file: !635, line: 171)
!758 = !DISubprogram(name: "wcstombs", scope: !322, file: !322, line: 936, type: !759, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DISubroutineType(types: !760)
!760 = !{!669, !761, !762, !669}
!761 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !696)
!762 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !763)
!763 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !764, size: 64)
!764 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !717)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !766, file: !635, line: 172)
!766 = !DISubprogram(name: "wctomb", scope: !322, file: !322, line: 929, type: !767, flags: DIFlagPrototyped, spFlags: 0)
!767 = !DISubroutineType(types: !768)
!768 = !{!134, !696, !717}
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !771, file: !635, line: 200)
!770 = !DINamespace(name: "__gnu_cxx", scope: null)
!771 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !322, line: 80, baseType: !772)
!772 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !322, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !773, identifier: "_ZTS7lldiv_t")
!773 = !{!774, !775}
!774 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !772, file: !322, line: 78, baseType: !243, size: 64)
!775 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !772, file: !322, line: 79, baseType: !243, size: 64, offset: 64)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !777, file: !635, line: 206)
!777 = !DISubprogram(name: "_Exit", scope: !322, file: !322, line: 629, type: !686, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !779, file: !635, line: 210)
!779 = !DISubprogram(name: "llabs", scope: !322, file: !322, line: 844, type: !241, flags: DIFlagPrototyped, spFlags: 0)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !781, file: !635, line: 216)
!781 = !DISubprogram(name: "lldiv", scope: !322, file: !322, line: 858, type: !782, flags: DIFlagPrototyped, spFlags: 0)
!782 = !DISubroutineType(types: !783)
!783 = !{!771, !243, !243}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !785, file: !635, line: 227)
!785 = !DISubprogram(name: "atoll", scope: !322, file: !322, line: 112, type: !786, flags: DIFlagPrototyped, spFlags: 0)
!786 = !DISubroutineType(types: !787)
!787 = !{!243, !275}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !789, file: !635, line: 228)
!789 = !DISubprogram(name: "strtoll", scope: !322, file: !322, line: 200, type: !790, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DISubroutineType(types: !791)
!791 = !{!243, !718, !745, !134}
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !793, file: !635, line: 229)
!793 = !DISubprogram(name: "strtoull", scope: !322, file: !322, line: 205, type: !794, flags: DIFlagPrototyped, spFlags: 0)
!794 = !DISubroutineType(types: !795)
!795 = !{!796, !718, !745, !134}
!796 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !798, file: !635, line: 231)
!798 = !DISubprogram(name: "strtof", scope: !322, file: !322, line: 123, type: !799, flags: DIFlagPrototyped, spFlags: 0)
!799 = !DISubroutineType(types: !800)
!800 = !{!139, !718, !745}
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !770, entity: !802, file: !635, line: 232)
!802 = !DISubprogram(name: "strtold", scope: !322, file: !322, line: 126, type: !803, flags: DIFlagPrototyped, spFlags: 0)
!803 = !DISubroutineType(types: !804)
!804 = !{!393, !718, !745}
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !771, file: !635, line: 240)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !777, file: !635, line: 242)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !779, file: !635, line: 244)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !809, file: !635, line: 245)
!809 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !770, file: !635, line: 213, type: !782, flags: DIFlagPrototyped, spFlags: 0)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !781, file: !635, line: 246)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !785, file: !635, line: 248)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !798, file: !635, line: 249)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !789, file: !635, line: 250)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !793, file: !635, line: 251)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !802, file: !635, line: 252)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !643, file: !817, line: 38)
!817 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "74812296ae1ebf65f0c19983efc04bc1")
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !647, file: !817, line: 39)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !685, file: !817, line: 40)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !652, file: !817, line: 43)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !728, file: !817, line: 46)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !633, file: !817, line: 51)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !637, file: !817, line: 52)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !825, file: !817, line: 54)
!825 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !129, file: !323, line: 79, type: !391, flags: DIFlagPrototyped, spFlags: 0)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !654, file: !817, line: 55)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !656, file: !817, line: 56)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !660, file: !817, line: 57)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !664, file: !817, line: 58)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !677, file: !817, line: 59)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !809, file: !817, line: 60)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !689, file: !817, line: 61)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !693, file: !817, line: 62)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !698, file: !817, line: 63)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !700, file: !817, line: 64)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !704, file: !817, line: 65)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !708, file: !817, line: 67)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !712, file: !817, line: 68)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !720, file: !817, line: 69)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !724, file: !817, line: 71)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !730, file: !817, line: 72)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !734, file: !817, line: 73)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !738, file: !817, line: 74)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !742, file: !817, line: 75)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !748, file: !817, line: 76)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !752, file: !817, line: 77)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !756, file: !817, line: 78)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !758, file: !817, line: 80)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !766, file: !817, line: 81)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !851, file: !853, line: 443)
!851 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !852, file: !852, line: 1126, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!852 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "", checksumkind: CSK_MD5, checksum: "2ef9e35a0dffaee5e71030742dd1ac6e")
!853 = !DIFile(filename: "/scratch/ah7226/install-14-cudafe/lib/clang/14.0.6/include/__clang_cuda_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "3d0d88afe6654d905aa65f6ef63eb849")
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !855, file: !853, line: 444)
!855 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !852, file: !852, line: 1154, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !857, file: !853, line: 445)
!857 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !852, file: !852, line: 1121, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !859, file: !853, line: 446)
!859 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !852, file: !852, line: 1159, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !861, file: !853, line: 447)
!861 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !852, file: !852, line: 1111, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !863, file: !853, line: 448)
!863 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !852, file: !852, line: 1116, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !865, file: !853, line: 449)
!865 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !852, file: !852, line: 1164, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !867, file: !853, line: 450)
!867 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !852, file: !852, line: 1199, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !869, file: !853, line: 451)
!869 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !870, file: !870, line: 647, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!870 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "", checksumkind: CSK_MD5, checksum: "10f3b6dd1fecdf3afb05bf98abcb5c04")
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !872, file: !853, line: 452)
!872 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !852, file: !852, line: 973, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !874, file: !853, line: 453)
!874 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !852, file: !852, line: 1027, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !876, file: !853, line: 454)
!876 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !852, file: !852, line: 1096, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !878, file: !853, line: 455)
!878 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !852, file: !852, line: 1259, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !880, file: !853, line: 456)
!880 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !852, file: !852, line: 1249, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !882, file: !853, line: 457)
!882 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !870, file: !870, line: 637, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !884, file: !853, line: 458)
!884 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !852, file: !852, line: 1078, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !886, file: !853, line: 459)
!886 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !852, file: !852, line: 1169, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !888, file: !853, line: 460)
!888 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !870, file: !870, line: 582, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !890, file: !853, line: 461)
!890 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !852, file: !852, line: 1385, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !892, file: !853, line: 462)
!892 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !870, file: !870, line: 572, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !894, file: !853, line: 463)
!894 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !852, file: !852, line: 1337, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !896, file: !853, line: 464)
!896 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !870, file: !870, line: 602, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !898, file: !853, line: 465)
!898 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !870, file: !870, line: 597, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !900, file: !853, line: 466)
!900 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !852, file: !852, line: 1322, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !902, file: !853, line: 467)
!902 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !852, file: !852, line: 1312, type: !196, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !904, file: !853, line: 468)
!904 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !852, file: !852, line: 1174, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !906, file: !853, line: 469)
!906 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !852, file: !852, line: 1390, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !908, file: !853, line: 470)
!908 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !852, file: !852, line: 1289, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !910, file: !853, line: 471)
!910 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !852, file: !852, line: 1284, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !912, file: !853, line: 472)
!912 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !852, file: !852, line: 933, type: !246, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !914, file: !853, line: 473)
!914 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !852, file: !852, line: 1371, type: !246, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !916, file: !853, line: 474)
!916 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !852, file: !852, line: 1140, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !918, file: !853, line: 475)
!918 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !852, file: !852, line: 1149, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !920, file: !853, line: 476)
!920 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !852, file: !852, line: 1069, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !922, file: !853, line: 477)
!922 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !852, file: !852, line: 1395, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !924, file: !853, line: 478)
!924 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !852, file: !852, line: 1131, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !926, file: !853, line: 479)
!926 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !852, file: !852, line: 924, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !928, file: !853, line: 480)
!928 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !852, file: !852, line: 1376, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !930, file: !853, line: 481)
!930 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !852, file: !852, line: 1317, type: !268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !932, file: !853, line: 482)
!932 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !852, file: !852, line: 938, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !934, file: !853, line: 483)
!934 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !852, file: !852, line: 1002, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !936, file: !853, line: 484)
!936 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !852, file: !852, line: 1352, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !938, file: !853, line: 485)
!938 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !852, file: !852, line: 1327, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !940, file: !853, line: 486)
!940 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !852, file: !852, line: 1332, type: !292, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !942, file: !853, line: 487)
!942 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !852, file: !852, line: 919, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !944, file: !853, line: 488)
!944 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !852, file: !852, line: 1366, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !946, file: !853, line: 489)
!946 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !852, file: !852, line: 1299, type: !300, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !948, file: !853, line: 490)
!948 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !852, file: !852, line: 1294, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !950, file: !853, line: 491)
!950 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !852, file: !852, line: 1018, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !952, file: !853, line: 492)
!952 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !852, file: !852, line: 1101, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !954, file: !853, line: 493)
!954 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !870, file: !870, line: 887, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !956, file: !853, line: 494)
!956 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !852, file: !852, line: 1060, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !958, file: !853, line: 495)
!958 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !852, file: !852, line: 1106, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !960, file: !853, line: 496)
!960 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !852, file: !852, line: 1361, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !129, entity: !962, file: !853, line: 497)
!962 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !870, file: !870, line: 642, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !825, file: !964, line: 38)
!964 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/10/../../../../include/c++/10/math.h", directory: "", checksumkind: CSK_MD5, checksum: "b4e5451670188aa97f74ef245fc696ff")
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !966, file: !964, line: 54)
!966 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !129, file: !329, line: 380, type: !967, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DISubroutineType(types: !968)
!968 = !{!393, !393, !969}
!969 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !393, size: 64)
!970 = !{!"clang version 14.0.6 (https://github.com/andrewhe-princeton/llvm-project-linkcudafe a53d292d961c119a051729d608a48499697ae08e)"}
!971 = distinct !DISubprogram(name: "kernel_A_mul_B", linkageName: "_Z29__device_stub__kernel_A_mul_BiiiiddPdS_S_S_S_", scope: !7, file: !7, line: 15, type: !972, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !974)
!972 = !DISubroutineType(types: !973)
!973 = !{null, !134, !134, !134, !134, !102, !102, !101, !101, !101, !101, !101}
!974 = !{}
!975 = !DILocalVariable(name: "ni", arg: 1, scope: !971, file: !7, line: 15, type: !134)
!976 = !DILocation(line: 15, column: 36, scope: !971)
!977 = !DILocalVariable(name: "nj", arg: 2, scope: !971, file: !7, line: 15, type: !134)
!978 = !DILocation(line: 15, column: 44, scope: !971)
!979 = !DILocalVariable(name: "nk", arg: 3, scope: !971, file: !7, line: 15, type: !134)
!980 = !DILocation(line: 15, column: 52, scope: !971)
!981 = !DILocalVariable(name: "nl", arg: 4, scope: !971, file: !7, line: 15, type: !134)
!982 = !DILocation(line: 15, column: 60, scope: !971)
!983 = !DILocalVariable(name: "alpha", arg: 5, scope: !971, file: !7, line: 16, type: !102)
!984 = !DILocation(line: 16, column: 39, scope: !971)
!985 = !DILocalVariable(name: "beta", arg: 6, scope: !971, file: !7, line: 16, type: !102)
!986 = !DILocation(line: 16, column: 53, scope: !971)
!987 = !DILocalVariable(name: "tmp", arg: 7, scope: !971, file: !7, line: 17, type: !101)
!988 = !DILocation(line: 17, column: 40, scope: !971)
!989 = !DILocalVariable(name: "A", arg: 8, scope: !971, file: !7, line: 18, type: !101)
!990 = !DILocation(line: 18, column: 40, scope: !971)
!991 = !DILocalVariable(name: "B", arg: 9, scope: !971, file: !7, line: 19, type: !101)
!992 = !DILocation(line: 19, column: 40, scope: !971)
!993 = !DILocalVariable(name: "C", arg: 10, scope: !971, file: !7, line: 19, type: !101)
!994 = !DILocation(line: 19, column: 51, scope: !971)
!995 = !DILocalVariable(name: "D", arg: 11, scope: !971, file: !7, line: 19, type: !101)
!996 = !DILocation(line: 19, column: 62, scope: !971)
!997 = !DILocation(line: 19, column: 65, scope: !971)
!998 = !DILocation(line: 31, column: 1, scope: !971)
!999 = distinct !DISubprogram(name: "kernel_D_plus_tmp_mul_C", linkageName: "_Z38__device_stub__kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S_", scope: !7, file: !7, line: 35, type: !972, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !974)
!1000 = !DILocalVariable(name: "ni", arg: 1, scope: !999, file: !7, line: 35, type: !134)
!1001 = !DILocation(line: 35, column: 45, scope: !999)
!1002 = !DILocalVariable(name: "nj", arg: 2, scope: !999, file: !7, line: 35, type: !134)
!1003 = !DILocation(line: 35, column: 53, scope: !999)
!1004 = !DILocalVariable(name: "nk", arg: 3, scope: !999, file: !7, line: 35, type: !134)
!1005 = !DILocation(line: 35, column: 61, scope: !999)
!1006 = !DILocalVariable(name: "nl", arg: 4, scope: !999, file: !7, line: 35, type: !134)
!1007 = !DILocation(line: 35, column: 69, scope: !999)
!1008 = !DILocalVariable(name: "alpha", arg: 5, scope: !999, file: !7, line: 36, type: !102)
!1009 = !DILocation(line: 36, column: 48, scope: !999)
!1010 = !DILocalVariable(name: "beta", arg: 6, scope: !999, file: !7, line: 36, type: !102)
!1011 = !DILocation(line: 36, column: 62, scope: !999)
!1012 = !DILocalVariable(name: "tmp", arg: 7, scope: !999, file: !7, line: 37, type: !101)
!1013 = !DILocation(line: 37, column: 49, scope: !999)
!1014 = !DILocalVariable(name: "A", arg: 8, scope: !999, file: !7, line: 38, type: !101)
!1015 = !DILocation(line: 38, column: 49, scope: !999)
!1016 = !DILocalVariable(name: "B", arg: 9, scope: !999, file: !7, line: 39, type: !101)
!1017 = !DILocation(line: 39, column: 49, scope: !999)
!1018 = !DILocalVariable(name: "C", arg: 10, scope: !999, file: !7, line: 39, type: !101)
!1019 = !DILocation(line: 39, column: 60, scope: !999)
!1020 = !DILocalVariable(name: "D", arg: 11, scope: !999, file: !7, line: 39, type: !101)
!1021 = !DILocation(line: 39, column: 71, scope: !999)
!1022 = !DILocation(line: 39, column: 74, scope: !999)
!1023 = !DILocation(line: 55, column: 1, scope: !999)
!1024 = distinct !DISubprogram(name: "num_blocks", linkageName: "_Z10num_blocksss", scope: !7, file: !7, line: 57, type: !1025, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !974)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!1027, !1027, !1027}
!1027 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1028 = !DILocalVariable(name: "num", arg: 1, scope: !1024, file: !7, line: 57, type: !1027)
!1029 = !DILocation(line: 57, column: 24, scope: !1024)
!1030 = !DILocalVariable(name: "factor", arg: 2, scope: !1024, file: !7, line: 57, type: !1027)
!1031 = !DILocation(line: 57, column: 35, scope: !1024)
!1032 = !DILocation(line: 58, column: 11, scope: !1024)
!1033 = !DILocation(line: 58, column: 17, scope: !1024)
!1034 = !DILocation(line: 58, column: 15, scope: !1024)
!1035 = !DILocation(line: 58, column: 24, scope: !1024)
!1036 = !DILocation(line: 58, column: 31, scope: !1024)
!1037 = !DILocation(line: 58, column: 29, scope: !1024)
!1038 = !DILocation(line: 58, column: 10, scope: !1024)
!1039 = !DILocation(line: 58, column: 3, scope: !1024)
!1040 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 132, type: !1041, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !974)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!134, !134, !746}
!1043 = !DILocalVariable(name: "argc", arg: 1, scope: !1040, file: !7, line: 132, type: !134)
!1044 = !DILocation(line: 132, column: 14, scope: !1040)
!1045 = !DILocalVariable(name: "argv", arg: 2, scope: !1040, file: !7, line: 132, type: !746)
!1046 = !DILocation(line: 132, column: 27, scope: !1040)
!1047 = !DILocalVariable(name: "dump_code", scope: !1040, file: !7, line: 134, type: !134)
!1048 = !DILocation(line: 134, column: 7, scope: !1040)
!1049 = !DILocation(line: 134, column: 24, scope: !1040)
!1050 = !DILocation(line: 134, column: 19, scope: !1040)
!1051 = !DILocalVariable(name: "ni", scope: !1040, file: !7, line: 135, type: !232)
!1052 = !DILocation(line: 135, column: 9, scope: !1040)
!1053 = !DILocation(line: 135, column: 19, scope: !1040)
!1054 = !DILocation(line: 135, column: 14, scope: !1040)
!1055 = !DILocalVariable(name: "nj", scope: !1040, file: !7, line: 136, type: !232)
!1056 = !DILocation(line: 136, column: 9, scope: !1040)
!1057 = !DILocation(line: 136, column: 19, scope: !1040)
!1058 = !DILocation(line: 136, column: 14, scope: !1040)
!1059 = !DILocalVariable(name: "nk", scope: !1040, file: !7, line: 137, type: !232)
!1060 = !DILocation(line: 137, column: 9, scope: !1040)
!1061 = !DILocation(line: 137, column: 19, scope: !1040)
!1062 = !DILocation(line: 137, column: 14, scope: !1040)
!1063 = !DILocalVariable(name: "nl", scope: !1040, file: !7, line: 138, type: !232)
!1064 = !DILocation(line: 138, column: 9, scope: !1040)
!1065 = !DILocation(line: 138, column: 19, scope: !1040)
!1066 = !DILocation(line: 138, column: 14, scope: !1040)
!1067 = !DILocalVariable(name: "alpha", scope: !1040, file: !7, line: 141, type: !102)
!1068 = !DILocation(line: 141, column: 10, scope: !1040)
!1069 = !DILocalVariable(name: "beta", scope: !1040, file: !7, line: 142, type: !102)
!1070 = !DILocation(line: 142, column: 10, scope: !1040)
!1071 = !DILocalVariable(name: "A", scope: !1040, file: !7, line: 143, type: !101)
!1072 = !DILocation(line: 143, column: 11, scope: !1040)
!1073 = !DILocation(line: 143, column: 31, scope: !1040)
!1074 = !DILocation(line: 143, column: 34, scope: !1040)
!1075 = !DILocation(line: 143, column: 33, scope: !1040)
!1076 = !DILocation(line: 143, column: 36, scope: !1040)
!1077 = !DILocation(line: 143, column: 24, scope: !1040)
!1078 = !DILocation(line: 143, column: 15, scope: !1040)
!1079 = !DILocalVariable(name: "B", scope: !1040, file: !7, line: 144, type: !101)
!1080 = !DILocation(line: 144, column: 11, scope: !1040)
!1081 = !DILocation(line: 144, column: 31, scope: !1040)
!1082 = !DILocation(line: 144, column: 34, scope: !1040)
!1083 = !DILocation(line: 144, column: 33, scope: !1040)
!1084 = !DILocation(line: 144, column: 36, scope: !1040)
!1085 = !DILocation(line: 144, column: 24, scope: !1040)
!1086 = !DILocation(line: 144, column: 15, scope: !1040)
!1087 = !DILocalVariable(name: "C", scope: !1040, file: !7, line: 145, type: !101)
!1088 = !DILocation(line: 145, column: 11, scope: !1040)
!1089 = !DILocation(line: 145, column: 31, scope: !1040)
!1090 = !DILocation(line: 145, column: 34, scope: !1040)
!1091 = !DILocation(line: 145, column: 33, scope: !1040)
!1092 = !DILocation(line: 145, column: 36, scope: !1040)
!1093 = !DILocation(line: 145, column: 24, scope: !1040)
!1094 = !DILocation(line: 145, column: 15, scope: !1040)
!1095 = !DILocalVariable(name: "D", scope: !1040, file: !7, line: 146, type: !101)
!1096 = !DILocation(line: 146, column: 11, scope: !1040)
!1097 = !DILocation(line: 146, column: 31, scope: !1040)
!1098 = !DILocation(line: 146, column: 34, scope: !1040)
!1099 = !DILocation(line: 146, column: 33, scope: !1040)
!1100 = !DILocation(line: 146, column: 36, scope: !1040)
!1101 = !DILocation(line: 146, column: 24, scope: !1040)
!1102 = !DILocation(line: 146, column: 15, scope: !1040)
!1103 = !DILocalVariable(name: "tmp", scope: !1040, file: !7, line: 147, type: !101)
!1104 = !DILocation(line: 147, column: 11, scope: !1040)
!1105 = !DILocation(line: 147, column: 33, scope: !1040)
!1106 = !DILocation(line: 147, column: 36, scope: !1040)
!1107 = !DILocation(line: 147, column: 35, scope: !1040)
!1108 = !DILocation(line: 147, column: 38, scope: !1040)
!1109 = !DILocation(line: 147, column: 26, scope: !1040)
!1110 = !DILocation(line: 147, column: 17, scope: !1040)
!1111 = !DILocation(line: 152, column: 15, scope: !1040)
!1112 = !DILocation(line: 152, column: 19, scope: !1040)
!1113 = !DILocation(line: 152, column: 23, scope: !1040)
!1114 = !DILocation(line: 152, column: 27, scope: !1040)
!1115 = !DILocation(line: 153, column: 7, scope: !1040)
!1116 = !DILocation(line: 154, column: 7, scope: !1040)
!1117 = !DILocation(line: 155, column: 7, scope: !1040)
!1118 = !DILocation(line: 156, column: 7, scope: !1040)
!1119 = !DILocation(line: 157, column: 7, scope: !1040)
!1120 = !DILocation(line: 152, column: 3, scope: !1040)
!1121 = !DILocalVariable(name: "dev_A", scope: !1040, file: !7, line: 161, type: !101)
!1122 = !DILocation(line: 161, column: 11, scope: !1040)
!1123 = !DILocalVariable(name: "dev_B", scope: !1040, file: !7, line: 162, type: !101)
!1124 = !DILocation(line: 162, column: 11, scope: !1040)
!1125 = !DILocalVariable(name: "dev_C", scope: !1040, file: !7, line: 163, type: !101)
!1126 = !DILocation(line: 163, column: 11, scope: !1040)
!1127 = !DILocalVariable(name: "dev_D", scope: !1040, file: !7, line: 164, type: !101)
!1128 = !DILocation(line: 164, column: 11, scope: !1040)
!1129 = !DILocalVariable(name: "dev_tmp", scope: !1040, file: !7, line: 165, type: !101)
!1130 = !DILocation(line: 165, column: 11, scope: !1040)
!1131 = !DILocalVariable(name: "dev_alpha", scope: !1040, file: !7, line: 166, type: !101)
!1132 = !DILocation(line: 166, column: 11, scope: !1040)
!1133 = !DILocalVariable(name: "dev_beta", scope: !1040, file: !7, line: 167, type: !101)
!1134 = !DILocation(line: 167, column: 11, scope: !1040)
!1135 = !DILocation(line: 168, column: 22, scope: !1040)
!1136 = !DILocation(line: 168, column: 25, scope: !1040)
!1137 = !DILocation(line: 168, column: 24, scope: !1040)
!1138 = !DILocation(line: 168, column: 27, scope: !1040)
!1139 = !DILocation(line: 168, column: 3, scope: !1040)
!1140 = !DILocation(line: 169, column: 22, scope: !1040)
!1141 = !DILocation(line: 169, column: 25, scope: !1040)
!1142 = !DILocation(line: 169, column: 24, scope: !1040)
!1143 = !DILocation(line: 169, column: 27, scope: !1040)
!1144 = !DILocation(line: 169, column: 3, scope: !1040)
!1145 = !DILocation(line: 170, column: 22, scope: !1040)
!1146 = !DILocation(line: 170, column: 25, scope: !1040)
!1147 = !DILocation(line: 170, column: 24, scope: !1040)
!1148 = !DILocation(line: 170, column: 27, scope: !1040)
!1149 = !DILocation(line: 170, column: 3, scope: !1040)
!1150 = !DILocation(line: 171, column: 22, scope: !1040)
!1151 = !DILocation(line: 171, column: 25, scope: !1040)
!1152 = !DILocation(line: 171, column: 24, scope: !1040)
!1153 = !DILocation(line: 171, column: 27, scope: !1040)
!1154 = !DILocation(line: 171, column: 3, scope: !1040)
!1155 = !DILocation(line: 172, column: 24, scope: !1040)
!1156 = !DILocation(line: 172, column: 27, scope: !1040)
!1157 = !DILocation(line: 172, column: 26, scope: !1040)
!1158 = !DILocation(line: 172, column: 29, scope: !1040)
!1159 = !DILocation(line: 172, column: 3, scope: !1040)
!1160 = !DILocation(line: 173, column: 14, scope: !1040)
!1161 = !DILocation(line: 173, column: 21, scope: !1040)
!1162 = !DILocation(line: 173, column: 24, scope: !1040)
!1163 = !DILocation(line: 173, column: 27, scope: !1040)
!1164 = !DILocation(line: 173, column: 26, scope: !1040)
!1165 = !DILocation(line: 173, column: 29, scope: !1040)
!1166 = !DILocation(line: 173, column: 3, scope: !1040)
!1167 = !DILocation(line: 174, column: 14, scope: !1040)
!1168 = !DILocation(line: 174, column: 21, scope: !1040)
!1169 = !DILocation(line: 174, column: 24, scope: !1040)
!1170 = !DILocation(line: 174, column: 27, scope: !1040)
!1171 = !DILocation(line: 174, column: 26, scope: !1040)
!1172 = !DILocation(line: 174, column: 29, scope: !1040)
!1173 = !DILocation(line: 174, column: 3, scope: !1040)
!1174 = !DILocation(line: 175, column: 14, scope: !1040)
!1175 = !DILocation(line: 175, column: 21, scope: !1040)
!1176 = !DILocation(line: 175, column: 24, scope: !1040)
!1177 = !DILocation(line: 175, column: 27, scope: !1040)
!1178 = !DILocation(line: 175, column: 26, scope: !1040)
!1179 = !DILocation(line: 175, column: 29, scope: !1040)
!1180 = !DILocation(line: 175, column: 3, scope: !1040)
!1181 = !DILocation(line: 176, column: 14, scope: !1040)
!1182 = !DILocation(line: 176, column: 21, scope: !1040)
!1183 = !DILocation(line: 176, column: 24, scope: !1040)
!1184 = !DILocation(line: 176, column: 27, scope: !1040)
!1185 = !DILocation(line: 176, column: 26, scope: !1040)
!1186 = !DILocation(line: 176, column: 29, scope: !1040)
!1187 = !DILocation(line: 176, column: 3, scope: !1040)
!1188 = !DILocation(line: 177, column: 14, scope: !1040)
!1189 = !DILocation(line: 177, column: 23, scope: !1040)
!1190 = !DILocation(line: 177, column: 28, scope: !1040)
!1191 = !DILocation(line: 177, column: 31, scope: !1040)
!1192 = !DILocation(line: 177, column: 30, scope: !1040)
!1193 = !DILocation(line: 177, column: 33, scope: !1040)
!1194 = !DILocation(line: 177, column: 3, scope: !1040)
!1195 = !DILocation(line: 183, column: 10, scope: !1040)
!1196 = !DILocation(line: 183, column: 14, scope: !1040)
!1197 = !DILocation(line: 183, column: 18, scope: !1040)
!1198 = !DILocation(line: 183, column: 22, scope: !1040)
!1199 = !DILocation(line: 183, column: 26, scope: !1040)
!1200 = !DILocation(line: 183, column: 33, scope: !1040)
!1201 = !DILocation(line: 183, column: 39, scope: !1040)
!1202 = !DILocation(line: 183, column: 48, scope: !1040)
!1203 = !DILocation(line: 183, column: 55, scope: !1040)
!1204 = !DILocation(line: 183, column: 62, scope: !1040)
!1205 = !DILocation(line: 183, column: 69, scope: !1040)
!1206 = !DILocation(line: 183, column: 3, scope: !1040)
!1207 = !DILocation(line: 186, column: 14, scope: !1040)
!1208 = !DILocation(line: 186, column: 17, scope: !1040)
!1209 = !DILocation(line: 186, column: 24, scope: !1040)
!1210 = !DILocation(line: 186, column: 27, scope: !1040)
!1211 = !DILocation(line: 186, column: 26, scope: !1040)
!1212 = !DILocation(line: 186, column: 29, scope: !1040)
!1213 = !DILocation(line: 186, column: 3, scope: !1040)
!1214 = !DILocation(line: 187, column: 19, scope: !1040)
!1215 = !DILocation(line: 187, column: 3, scope: !1040)
!1216 = !DILocation(line: 188, column: 19, scope: !1040)
!1217 = !DILocation(line: 188, column: 3, scope: !1040)
!1218 = !DILocation(line: 189, column: 19, scope: !1040)
!1219 = !DILocation(line: 189, column: 3, scope: !1040)
!1220 = !DILocation(line: 190, column: 19, scope: !1040)
!1221 = !DILocation(line: 190, column: 3, scope: !1040)
!1222 = !DILocation(line: 191, column: 19, scope: !1040)
!1223 = !DILocation(line: 191, column: 3, scope: !1040)
!1224 = !DILocation(line: 192, column: 19, scope: !1040)
!1225 = !DILocation(line: 192, column: 3, scope: !1040)
!1226 = !DILocation(line: 193, column: 19, scope: !1040)
!1227 = !DILocation(line: 193, column: 3, scope: !1040)
!1228 = !DILocation(line: 196, column: 7, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1040, file: !7, line: 196, column: 7)
!1230 = !DILocation(line: 196, column: 17, scope: !1229)
!1231 = !DILocation(line: 196, column: 7, scope: !1040)
!1232 = !DILocation(line: 196, column: 35, scope: !1229)
!1233 = !DILocation(line: 196, column: 39, scope: !1229)
!1234 = !DILocation(line: 196, column: 43, scope: !1229)
!1235 = !DILocation(line: 196, column: 23, scope: !1229)
!1236 = !DILocation(line: 199, column: 15, scope: !1040)
!1237 = !DILocation(line: 199, column: 3, scope: !1040)
!1238 = !DILocation(line: 200, column: 15, scope: !1040)
!1239 = !DILocation(line: 200, column: 3, scope: !1040)
!1240 = !DILocation(line: 201, column: 15, scope: !1040)
!1241 = !DILocation(line: 201, column: 3, scope: !1040)
!1242 = !DILocation(line: 202, column: 15, scope: !1040)
!1243 = !DILocation(line: 202, column: 3, scope: !1040)
!1244 = !DILocation(line: 203, column: 15, scope: !1040)
!1245 = !DILocation(line: 203, column: 3, scope: !1040)
!1246 = !DILocation(line: 205, column: 3, scope: !1040)
!1247 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiiiiPdS_S_S_S_", scope: !7, file: !7, line: 105, type: !1248, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !974)
!1248 = !DISubroutineType(types: !1249)
!1249 = !{null, !134, !134, !134, !134, !101, !101, !101, !101, !101}
!1250 = !DILocalVariable(name: "ni", arg: 1, scope: !1247, file: !7, line: 105, type: !134)
!1251 = !DILocation(line: 105, column: 28, scope: !1247)
!1252 = !DILocalVariable(name: "nj", arg: 2, scope: !1247, file: !7, line: 105, type: !134)
!1253 = !DILocation(line: 105, column: 36, scope: !1247)
!1254 = !DILocalVariable(name: "nk", arg: 3, scope: !1247, file: !7, line: 105, type: !134)
!1255 = !DILocation(line: 105, column: 44, scope: !1247)
!1256 = !DILocalVariable(name: "nl", arg: 4, scope: !1247, file: !7, line: 105, type: !134)
!1257 = !DILocation(line: 105, column: 52, scope: !1247)
!1258 = !DILocalVariable(name: "A", arg: 5, scope: !1247, file: !7, line: 106, type: !101)
!1259 = !DILocation(line: 106, column: 13, scope: !1247)
!1260 = !DILocalVariable(name: "B", arg: 6, scope: !1247, file: !7, line: 107, type: !101)
!1261 = !DILocation(line: 107, column: 13, scope: !1247)
!1262 = !DILocalVariable(name: "C", arg: 7, scope: !1247, file: !7, line: 108, type: !101)
!1263 = !DILocation(line: 108, column: 13, scope: !1247)
!1264 = !DILocalVariable(name: "D", arg: 8, scope: !1247, file: !7, line: 109, type: !101)
!1265 = !DILocation(line: 109, column: 13, scope: !1247)
!1266 = !DILocalVariable(name: "tmp", arg: 9, scope: !1247, file: !7, line: 110, type: !101)
!1267 = !DILocation(line: 110, column: 13, scope: !1247)
!1268 = !DILocalVariable(name: "i", scope: !1247, file: !7, line: 112, type: !134)
!1269 = !DILocation(line: 112, column: 7, scope: !1247)
!1270 = !DILocalVariable(name: "j", scope: !1247, file: !7, line: 112, type: !134)
!1271 = !DILocation(line: 112, column: 10, scope: !1247)
!1272 = !DILocation(line: 114, column: 10, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1247, file: !7, line: 114, column: 3)
!1274 = !DILocation(line: 114, column: 8, scope: !1273)
!1275 = !DILocation(line: 114, column: 15, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1273, file: !7, line: 114, column: 3)
!1277 = !DILocation(line: 114, column: 19, scope: !1276)
!1278 = !DILocation(line: 114, column: 17, scope: !1276)
!1279 = !DILocation(line: 114, column: 3, scope: !1273)
!1280 = !DILocation(line: 115, column: 12, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1276, file: !7, line: 115, column: 5)
!1282 = !DILocation(line: 115, column: 10, scope: !1281)
!1283 = !DILocation(line: 115, column: 17, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1281, file: !7, line: 115, column: 5)
!1285 = !DILocation(line: 115, column: 21, scope: !1284)
!1286 = !DILocation(line: 115, column: 19, scope: !1284)
!1287 = !DILocation(line: 115, column: 5, scope: !1281)
!1288 = !DILocation(line: 116, column: 29, scope: !1284)
!1289 = !DILocation(line: 116, column: 31, scope: !1284)
!1290 = !DILocation(line: 116, column: 30, scope: !1284)
!1291 = !DILocation(line: 116, column: 36, scope: !1284)
!1292 = !DILocation(line: 116, column: 34, scope: !1284)
!1293 = !DILocation(line: 116, column: 7, scope: !1284)
!1294 = !DILocation(line: 116, column: 9, scope: !1284)
!1295 = !DILocation(line: 116, column: 11, scope: !1284)
!1296 = !DILocation(line: 116, column: 10, scope: !1284)
!1297 = !DILocation(line: 116, column: 14, scope: !1284)
!1298 = !DILocation(line: 116, column: 13, scope: !1284)
!1299 = !DILocation(line: 116, column: 17, scope: !1284)
!1300 = !DILocation(line: 115, column: 26, scope: !1284)
!1301 = !DILocation(line: 115, column: 5, scope: !1284)
!1302 = distinct !{!1302, !1287, !1303, !1304}
!1303 = !DILocation(line: 116, column: 36, scope: !1281)
!1304 = !{!"llvm.loop.mustprogress"}
!1305 = !DILocation(line: 114, column: 24, scope: !1276)
!1306 = !DILocation(line: 114, column: 3, scope: !1276)
!1307 = distinct !{!1307, !1279, !1308, !1304}
!1308 = !DILocation(line: 116, column: 36, scope: !1273)
!1309 = !DILocation(line: 117, column: 10, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1247, file: !7, line: 117, column: 3)
!1311 = !DILocation(line: 117, column: 8, scope: !1310)
!1312 = !DILocation(line: 117, column: 15, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1310, file: !7, line: 117, column: 3)
!1314 = !DILocation(line: 117, column: 19, scope: !1313)
!1315 = !DILocation(line: 117, column: 17, scope: !1313)
!1316 = !DILocation(line: 117, column: 3, scope: !1310)
!1317 = !DILocation(line: 118, column: 12, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1313, file: !7, line: 118, column: 5)
!1319 = !DILocation(line: 118, column: 10, scope: !1318)
!1320 = !DILocation(line: 118, column: 17, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1318, file: !7, line: 118, column: 5)
!1322 = !DILocation(line: 118, column: 21, scope: !1321)
!1323 = !DILocation(line: 118, column: 19, scope: !1321)
!1324 = !DILocation(line: 118, column: 5, scope: !1318)
!1325 = !DILocation(line: 119, column: 29, scope: !1321)
!1326 = !DILocation(line: 119, column: 32, scope: !1321)
!1327 = !DILocation(line: 119, column: 33, scope: !1321)
!1328 = !DILocation(line: 119, column: 31, scope: !1321)
!1329 = !DILocation(line: 119, column: 30, scope: !1321)
!1330 = !DILocation(line: 119, column: 40, scope: !1321)
!1331 = !DILocation(line: 119, column: 38, scope: !1321)
!1332 = !DILocation(line: 119, column: 7, scope: !1321)
!1333 = !DILocation(line: 119, column: 9, scope: !1321)
!1334 = !DILocation(line: 119, column: 11, scope: !1321)
!1335 = !DILocation(line: 119, column: 10, scope: !1321)
!1336 = !DILocation(line: 119, column: 14, scope: !1321)
!1337 = !DILocation(line: 119, column: 13, scope: !1321)
!1338 = !DILocation(line: 119, column: 17, scope: !1321)
!1339 = !DILocation(line: 118, column: 26, scope: !1321)
!1340 = !DILocation(line: 118, column: 5, scope: !1321)
!1341 = distinct !{!1341, !1324, !1342, !1304}
!1342 = !DILocation(line: 119, column: 40, scope: !1318)
!1343 = !DILocation(line: 117, column: 24, scope: !1313)
!1344 = !DILocation(line: 117, column: 3, scope: !1313)
!1345 = distinct !{!1345, !1316, !1346, !1304}
!1346 = !DILocation(line: 119, column: 40, scope: !1310)
!1347 = !DILocation(line: 120, column: 10, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1247, file: !7, line: 120, column: 3)
!1349 = !DILocation(line: 120, column: 8, scope: !1348)
!1350 = !DILocation(line: 120, column: 15, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1348, file: !7, line: 120, column: 3)
!1352 = !DILocation(line: 120, column: 19, scope: !1351)
!1353 = !DILocation(line: 120, column: 17, scope: !1351)
!1354 = !DILocation(line: 120, column: 3, scope: !1348)
!1355 = !DILocation(line: 121, column: 12, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1351, file: !7, line: 121, column: 5)
!1357 = !DILocation(line: 121, column: 10, scope: !1356)
!1358 = !DILocation(line: 121, column: 17, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1356, file: !7, line: 121, column: 5)
!1360 = !DILocation(line: 121, column: 21, scope: !1359)
!1361 = !DILocation(line: 121, column: 19, scope: !1359)
!1362 = !DILocation(line: 121, column: 5, scope: !1356)
!1363 = !DILocation(line: 122, column: 29, scope: !1359)
!1364 = !DILocation(line: 122, column: 32, scope: !1359)
!1365 = !DILocation(line: 122, column: 33, scope: !1359)
!1366 = !DILocation(line: 122, column: 31, scope: !1359)
!1367 = !DILocation(line: 122, column: 30, scope: !1359)
!1368 = !DILocation(line: 122, column: 40, scope: !1359)
!1369 = !DILocation(line: 122, column: 38, scope: !1359)
!1370 = !DILocation(line: 122, column: 7, scope: !1359)
!1371 = !DILocation(line: 122, column: 9, scope: !1359)
!1372 = !DILocation(line: 122, column: 11, scope: !1359)
!1373 = !DILocation(line: 122, column: 10, scope: !1359)
!1374 = !DILocation(line: 122, column: 14, scope: !1359)
!1375 = !DILocation(line: 122, column: 13, scope: !1359)
!1376 = !DILocation(line: 122, column: 17, scope: !1359)
!1377 = !DILocation(line: 121, column: 26, scope: !1359)
!1378 = !DILocation(line: 121, column: 5, scope: !1359)
!1379 = distinct !{!1379, !1362, !1380, !1304}
!1380 = !DILocation(line: 122, column: 40, scope: !1356)
!1381 = !DILocation(line: 120, column: 24, scope: !1351)
!1382 = !DILocation(line: 120, column: 3, scope: !1351)
!1383 = distinct !{!1383, !1354, !1384, !1304}
!1384 = !DILocation(line: 122, column: 40, scope: !1348)
!1385 = !DILocation(line: 123, column: 10, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1247, file: !7, line: 123, column: 3)
!1387 = !DILocation(line: 123, column: 8, scope: !1386)
!1388 = !DILocation(line: 123, column: 15, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1386, file: !7, line: 123, column: 3)
!1390 = !DILocation(line: 123, column: 19, scope: !1389)
!1391 = !DILocation(line: 123, column: 17, scope: !1389)
!1392 = !DILocation(line: 123, column: 3, scope: !1386)
!1393 = !DILocation(line: 124, column: 12, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1389, file: !7, line: 124, column: 5)
!1395 = !DILocation(line: 124, column: 10, scope: !1394)
!1396 = !DILocation(line: 124, column: 17, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1394, file: !7, line: 124, column: 5)
!1398 = !DILocation(line: 124, column: 21, scope: !1397)
!1399 = !DILocation(line: 124, column: 19, scope: !1397)
!1400 = !DILocation(line: 124, column: 5, scope: !1394)
!1401 = !DILocation(line: 125, column: 29, scope: !1397)
!1402 = !DILocation(line: 125, column: 32, scope: !1397)
!1403 = !DILocation(line: 125, column: 33, scope: !1397)
!1404 = !DILocation(line: 125, column: 31, scope: !1397)
!1405 = !DILocation(line: 125, column: 30, scope: !1397)
!1406 = !DILocation(line: 125, column: 40, scope: !1397)
!1407 = !DILocation(line: 125, column: 38, scope: !1397)
!1408 = !DILocation(line: 125, column: 7, scope: !1397)
!1409 = !DILocation(line: 125, column: 9, scope: !1397)
!1410 = !DILocation(line: 125, column: 11, scope: !1397)
!1411 = !DILocation(line: 125, column: 10, scope: !1397)
!1412 = !DILocation(line: 125, column: 14, scope: !1397)
!1413 = !DILocation(line: 125, column: 13, scope: !1397)
!1414 = !DILocation(line: 125, column: 17, scope: !1397)
!1415 = !DILocation(line: 124, column: 26, scope: !1397)
!1416 = !DILocation(line: 124, column: 5, scope: !1397)
!1417 = distinct !{!1417, !1400, !1418, !1304}
!1418 = !DILocation(line: 125, column: 40, scope: !1394)
!1419 = !DILocation(line: 123, column: 24, scope: !1389)
!1420 = !DILocation(line: 123, column: 3, scope: !1389)
!1421 = distinct !{!1421, !1392, !1422, !1304}
!1422 = !DILocation(line: 125, column: 40, scope: !1386)
!1423 = !DILocation(line: 126, column: 10, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1247, file: !7, line: 126, column: 3)
!1425 = !DILocation(line: 126, column: 8, scope: !1424)
!1426 = !DILocation(line: 126, column: 15, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1424, file: !7, line: 126, column: 3)
!1428 = !DILocation(line: 126, column: 19, scope: !1427)
!1429 = !DILocation(line: 126, column: 17, scope: !1427)
!1430 = !DILocation(line: 126, column: 3, scope: !1424)
!1431 = !DILocation(line: 127, column: 12, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1427, file: !7, line: 127, column: 5)
!1433 = !DILocation(line: 127, column: 10, scope: !1432)
!1434 = !DILocation(line: 127, column: 17, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1432, file: !7, line: 127, column: 5)
!1436 = !DILocation(line: 127, column: 21, scope: !1435)
!1437 = !DILocation(line: 127, column: 19, scope: !1435)
!1438 = !DILocation(line: 127, column: 5, scope: !1432)
!1439 = !DILocation(line: 128, column: 7, scope: !1435)
!1440 = !DILocation(line: 128, column: 11, scope: !1435)
!1441 = !DILocation(line: 128, column: 13, scope: !1435)
!1442 = !DILocation(line: 128, column: 12, scope: !1435)
!1443 = !DILocation(line: 128, column: 16, scope: !1435)
!1444 = !DILocation(line: 128, column: 15, scope: !1435)
!1445 = !DILocation(line: 128, column: 19, scope: !1435)
!1446 = !DILocation(line: 127, column: 26, scope: !1435)
!1447 = !DILocation(line: 127, column: 5, scope: !1435)
!1448 = distinct !{!1448, !1438, !1449, !1304}
!1449 = !DILocation(line: 128, column: 21, scope: !1432)
!1450 = !DILocation(line: 126, column: 24, scope: !1427)
!1451 = !DILocation(line: 126, column: 3, scope: !1427)
!1452 = distinct !{!1452, !1430, !1453, !1304}
!1453 = !DILocation(line: 128, column: 21, scope: !1424)
!1454 = !DILocation(line: 129, column: 1, scope: !1247)
!1455 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !1456, file: !1456, line: 490, type: !1457, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, templateParams: !1461, retainedNodes: !974)
!1456 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "01b91beeef6619de13835efed0a8dca8")
!1457 = !DISubroutineType(types: !1458)
!1458 = !{!1459, !1460, !669}
!1459 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !10, line: 1419, baseType: !18)
!1460 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!1461 = !{!1462}
!1462 = !DITemplateTypeParameter(name: "T", type: !102)
!1463 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1455, file: !1456, line: 491, type: !1460)
!1464 = !DILocation(line: 491, column: 12, scope: !1455)
!1465 = !DILocalVariable(name: "size", arg: 2, scope: !1455, file: !1456, line: 492, type: !669)
!1466 = !DILocation(line: 492, column: 12, scope: !1455)
!1467 = !DILocation(line: 495, column: 38, scope: !1455)
!1468 = !DILocation(line: 495, column: 23, scope: !1455)
!1469 = !DILocation(line: 495, column: 46, scope: !1455)
!1470 = !DILocation(line: 495, column: 10, scope: !1455)
!1471 = !DILocation(line: 495, column: 3, scope: !1455)
!1472 = distinct !DISubprogram(name: "kernel", linkageName: "_ZL6kerneliiiiddPdS_S_S_S_", scope: !7, file: !7, line: 62, type: !972, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !974)
!1473 = !DILocalVariable(name: "ni", arg: 1, scope: !1472, file: !7, line: 62, type: !134)
!1474 = !DILocation(line: 62, column: 24, scope: !1472)
!1475 = !DILocalVariable(name: "nj", arg: 2, scope: !1472, file: !7, line: 62, type: !134)
!1476 = !DILocation(line: 62, column: 32, scope: !1472)
!1477 = !DILocalVariable(name: "nk", arg: 3, scope: !1472, file: !7, line: 62, type: !134)
!1478 = !DILocation(line: 62, column: 40, scope: !1472)
!1479 = !DILocalVariable(name: "nl", arg: 4, scope: !1472, file: !7, line: 62, type: !134)
!1480 = !DILocation(line: 62, column: 48, scope: !1472)
!1481 = !DILocalVariable(name: "alpha", arg: 5, scope: !1472, file: !7, line: 63, type: !102)
!1482 = !DILocation(line: 63, column: 27, scope: !1472)
!1483 = !DILocalVariable(name: "beta", arg: 6, scope: !1472, file: !7, line: 63, type: !102)
!1484 = !DILocation(line: 63, column: 41, scope: !1472)
!1485 = !DILocalVariable(name: "tmp", arg: 7, scope: !1472, file: !7, line: 64, type: !101)
!1486 = !DILocation(line: 64, column: 28, scope: !1472)
!1487 = !DILocalVariable(name: "A", arg: 8, scope: !1472, file: !7, line: 65, type: !101)
!1488 = !DILocation(line: 65, column: 28, scope: !1472)
!1489 = !DILocalVariable(name: "B", arg: 9, scope: !1472, file: !7, line: 66, type: !101)
!1490 = !DILocation(line: 66, column: 28, scope: !1472)
!1491 = !DILocalVariable(name: "C", arg: 10, scope: !1472, file: !7, line: 66, type: !101)
!1492 = !DILocation(line: 66, column: 39, scope: !1472)
!1493 = !DILocalVariable(name: "D", arg: 11, scope: !1472, file: !7, line: 66, type: !101)
!1494 = !DILocation(line: 66, column: 50, scope: !1472)
!1495 = !DILocalVariable(name: "threadsPerBlock", scope: !1472, file: !7, line: 70, type: !11)
!1496 = !DILocation(line: 70, column: 12, scope: !1472)
!1497 = !DILocalVariable(name: "block", scope: !1472, file: !7, line: 71, type: !1498)
!1498 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !106, line: 427, baseType: !105)
!1499 = !DILocation(line: 71, column: 8, scope: !1472)
!1500 = !DILocation(line: 71, column: 14, scope: !1472)
!1501 = !DILocation(line: 71, column: 30, scope: !1472)
!1502 = !DILocalVariable(name: "grid", scope: !1503, file: !7, line: 74, type: !1498)
!1503 = distinct !DILexicalBlock(scope: !1472, file: !7, line: 73, column: 3)
!1504 = !DILocation(line: 74, column: 10, scope: !1503)
!1505 = !DILocation(line: 74, column: 26, scope: !1503)
!1506 = !DILocation(line: 74, column: 36, scope: !1503)
!1507 = !DILocation(line: 74, column: 30, scope: !1503)
!1508 = !DILocation(line: 74, column: 15, scope: !1503)
!1509 = !DILocation(line: 74, column: 51, scope: !1503)
!1510 = !DILocation(line: 74, column: 61, scope: !1503)
!1511 = !DILocation(line: 74, column: 55, scope: !1503)
!1512 = !DILocation(line: 74, column: 40, scope: !1503)
!1513 = !DILocation(line: 75, column: 22, scope: !1503)
!1514 = !DILocation(line: 75, column: 28, scope: !1503)
!1515 = !DILocation(line: 75, column: 19, scope: !1503)
!1516 = !DILocation(line: 75, column: 5, scope: !1503)
!1517 = !DILocation(line: 75, column: 37, scope: !1503)
!1518 = !DILocation(line: 75, column: 41, scope: !1503)
!1519 = !DILocation(line: 75, column: 45, scope: !1503)
!1520 = !DILocation(line: 75, column: 49, scope: !1503)
!1521 = !DILocation(line: 75, column: 53, scope: !1503)
!1522 = !DILocation(line: 75, column: 60, scope: !1503)
!1523 = !DILocation(line: 75, column: 66, scope: !1503)
!1524 = !DILocation(line: 75, column: 71, scope: !1503)
!1525 = !DILocation(line: 75, column: 74, scope: !1503)
!1526 = !DILocation(line: 75, column: 77, scope: !1503)
!1527 = !DILocation(line: 75, column: 80, scope: !1503)
!1528 = !DILocalVariable(name: "grid", scope: !1529, file: !7, line: 80, type: !1498)
!1529 = distinct !DILexicalBlock(scope: !1472, file: !7, line: 79, column: 3)
!1530 = !DILocation(line: 80, column: 10, scope: !1529)
!1531 = !DILocation(line: 80, column: 26, scope: !1529)
!1532 = !DILocation(line: 80, column: 36, scope: !1529)
!1533 = !DILocation(line: 80, column: 30, scope: !1529)
!1534 = !DILocation(line: 80, column: 15, scope: !1529)
!1535 = !DILocation(line: 80, column: 51, scope: !1529)
!1536 = !DILocation(line: 80, column: 61, scope: !1529)
!1537 = !DILocation(line: 80, column: 55, scope: !1529)
!1538 = !DILocation(line: 80, column: 40, scope: !1529)
!1539 = !DILocation(line: 81, column: 31, scope: !1529)
!1540 = !DILocation(line: 81, column: 37, scope: !1529)
!1541 = !DILocation(line: 81, column: 28, scope: !1529)
!1542 = !DILocation(line: 81, column: 5, scope: !1529)
!1543 = !DILocation(line: 81, column: 46, scope: !1529)
!1544 = !DILocation(line: 81, column: 50, scope: !1529)
!1545 = !DILocation(line: 81, column: 54, scope: !1529)
!1546 = !DILocation(line: 81, column: 58, scope: !1529)
!1547 = !DILocation(line: 81, column: 62, scope: !1529)
!1548 = !DILocation(line: 81, column: 69, scope: !1529)
!1549 = !DILocation(line: 81, column: 75, scope: !1529)
!1550 = !DILocation(line: 81, column: 80, scope: !1529)
!1551 = !DILocation(line: 81, column: 83, scope: !1529)
!1552 = !DILocation(line: 81, column: 86, scope: !1529)
!1553 = !DILocation(line: 81, column: 89, scope: !1529)
!1554 = !DILocation(line: 87, column: 1, scope: !1472)
!1555 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiiPd", scope: !7, file: !7, line: 91, type: !1556, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !974)
!1556 = !DISubroutineType(types: !1557)
!1557 = !{null, !134, !134, !101}
!1558 = !DILocalVariable(name: "ni", arg: 1, scope: !1555, file: !7, line: 91, type: !134)
!1559 = !DILocation(line: 91, column: 22, scope: !1555)
!1560 = !DILocalVariable(name: "nl", arg: 2, scope: !1555, file: !7, line: 91, type: !134)
!1561 = !DILocation(line: 91, column: 30, scope: !1555)
!1562 = !DILocalVariable(name: "D", arg: 3, scope: !1555, file: !7, line: 92, type: !101)
!1563 = !DILocation(line: 92, column: 13, scope: !1555)
!1564 = !DILocalVariable(name: "i", scope: !1555, file: !7, line: 94, type: !134)
!1565 = !DILocation(line: 94, column: 7, scope: !1555)
!1566 = !DILocalVariable(name: "j", scope: !1555, file: !7, line: 94, type: !134)
!1567 = !DILocation(line: 94, column: 10, scope: !1555)
!1568 = !DILocation(line: 96, column: 10, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1555, file: !7, line: 96, column: 3)
!1570 = !DILocation(line: 96, column: 8, scope: !1569)
!1571 = !DILocation(line: 96, column: 15, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1569, file: !7, line: 96, column: 3)
!1573 = !DILocation(line: 96, column: 19, scope: !1572)
!1574 = !DILocation(line: 96, column: 17, scope: !1572)
!1575 = !DILocation(line: 96, column: 3, scope: !1569)
!1576 = !DILocation(line: 97, column: 12, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1572, file: !7, line: 97, column: 5)
!1578 = !DILocation(line: 97, column: 10, scope: !1577)
!1579 = !DILocation(line: 97, column: 17, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1577, file: !7, line: 97, column: 5)
!1581 = !DILocation(line: 97, column: 21, scope: !1580)
!1582 = !DILocation(line: 97, column: 19, scope: !1580)
!1583 = !DILocation(line: 97, column: 5, scope: !1577)
!1584 = !DILocation(line: 98, column: 16, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1580, file: !7, line: 97, column: 30)
!1586 = !DILocation(line: 98, column: 35, scope: !1585)
!1587 = !DILocation(line: 98, column: 37, scope: !1585)
!1588 = !DILocation(line: 98, column: 39, scope: !1585)
!1589 = !DILocation(line: 98, column: 38, scope: !1585)
!1590 = !DILocation(line: 98, column: 42, scope: !1585)
!1591 = !DILocation(line: 98, column: 41, scope: !1585)
!1592 = !DILocation(line: 98, column: 7, scope: !1585)
!1593 = !DILocation(line: 99, column: 12, scope: !1594)
!1594 = distinct !DILexicalBlock(scope: !1585, file: !7, line: 99, column: 11)
!1595 = !DILocation(line: 99, column: 16, scope: !1594)
!1596 = !DILocation(line: 99, column: 14, scope: !1594)
!1597 = !DILocation(line: 99, column: 21, scope: !1594)
!1598 = !DILocation(line: 99, column: 19, scope: !1594)
!1599 = !DILocation(line: 99, column: 24, scope: !1594)
!1600 = !DILocation(line: 99, column: 29, scope: !1594)
!1601 = !DILocation(line: 99, column: 11, scope: !1585)
!1602 = !DILocation(line: 99, column: 44, scope: !1594)
!1603 = !DILocation(line: 99, column: 35, scope: !1594)
!1604 = !DILocation(line: 100, column: 5, scope: !1585)
!1605 = !DILocation(line: 97, column: 26, scope: !1580)
!1606 = !DILocation(line: 97, column: 5, scope: !1580)
!1607 = distinct !{!1607, !1583, !1608, !1304}
!1608 = !DILocation(line: 100, column: 5, scope: !1577)
!1609 = !DILocation(line: 96, column: 24, scope: !1572)
!1610 = !DILocation(line: 96, column: 3, scope: !1572)
!1611 = distinct !{!1611, !1575, !1612, !1304}
!1612 = !DILocation(line: 100, column: 5, scope: !1569)
!1613 = !DILocation(line: 101, column: 12, scope: !1555)
!1614 = !DILocation(line: 101, column: 3, scope: !1555)
!1615 = !DILocation(line: 102, column: 1, scope: !1555)
!1616 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !105, file: !106, line: 421, type: !112, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, declaration: !111, retainedNodes: !974)
!1617 = !DILocalVariable(name: "this", arg: 1, scope: !1616, type: !1618, flags: DIFlagArtificial | DIFlagObjectPointer)
!1618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!1619 = !DILocation(line: 0, scope: !1616)
!1620 = !DILocalVariable(name: "vx", arg: 2, scope: !1616, file: !106, line: 421, type: !11)
!1621 = !DILocation(line: 421, column: 43, scope: !1616)
!1622 = !DILocalVariable(name: "vy", arg: 3, scope: !1616, file: !106, line: 421, type: !11)
!1623 = !DILocation(line: 421, column: 64, scope: !1616)
!1624 = !DILocalVariable(name: "vz", arg: 4, scope: !1616, file: !106, line: 421, type: !11)
!1625 = !DILocation(line: 421, column: 85, scope: !1616)
!1626 = !DILocation(line: 421, column: 95, scope: !1616)
!1627 = !DILocation(line: 421, column: 97, scope: !1616)
!1628 = !DILocation(line: 421, column: 102, scope: !1616)
!1629 = !DILocation(line: 421, column: 104, scope: !1616)
!1630 = !DILocation(line: 421, column: 109, scope: !1616)
!1631 = !DILocation(line: 421, column: 111, scope: !1616)
!1632 = !DILocation(line: 421, column: 116, scope: !1616)
