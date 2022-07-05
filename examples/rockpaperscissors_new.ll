; ModuleID = 'tests/rockpaperscissors/rockpaperscissors.ll'
source_filename = "tests/rockpaperscissors/rockpaperscissors.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@COUNTER = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [54 x i8] c"Control Flow Graph error detected, killing process...\00", align 1
@.str.1 = private unnamed_addr constant [73 x i8] c"AH-AH you lost, AIs will take over the world!\0AWanna play another round?\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"RPS-Bot:\0A\00", align 1
@.str.3 = private unnamed_addr constant [163 x i8] c"The unbeatable Rock Paper Scissors bot trained with the most advanced Reinforcement Learning and Neural Network techniques.\0A\0ASelect one of the following actions:\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Rock\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"Paper\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Scissors\00", align 1
@__const.play.moves = private unnamed_addr constant [3 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0)], align 16
@.str.7 = private unnamed_addr constant [39 x i8] c"1) Rock\0A2) Paper\0A3) Scissors\0A0) Exit\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"Cya!\0A\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"You chose %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"The AI chose %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [34 x i8] c"OMG you won! How did you do it?!\0A\00", align 1
@G = weak global i32 0
@D = weak global i32 0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @cfg_err_detected() #0 {
  %BackupG = load i32, i32* @G, align 4
  %BackupD = load i32, i32* @D, align 4
  store i32 1, i32* @G, align 4
  %1 = call i32 @puts(i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 noundef 0) #4
  unreachable

ErrBB:                                            ; preds = %ErrBB
  call void @cfg_err_detected()
  br label %ErrBB
}

declare i32 @puts(i8* noundef) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @you_lost() #0 {
  %BackupG = load i32, i32* @G, align 4
  %BackupD = load i32, i32* @D, align 4
  store i32 2, i32* @G, align 4
  %1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @.str.1, i64 0, i64 0))
  store i32 %BackupG, i32* @G, align 4
  store i32 %BackupD, i32* @D, align 4
  ret void

ErrBB:                                            ; preds = %ErrBB
  call void @cfg_err_detected()
  br label %ErrBB
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %BackupG = load i32, i32* @G, align 4
  %BackupD = load i32, i32* @D, align 4
  store i32 3, i32* @G, align 4
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0))
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([163 x i8], [163 x i8]* @.str.3, i64 0, i64 0))
  call void @play()
  br label %CFGVerificationBB_4

CFGVerificationBB_4:                              ; preds = %0
  %LoadG = load i32, i32* @G, align 4
  %4 = xor i32 20, %LoadG
  store i32 %4, i32* @G, align 4
  %5 = icmp eq i32 %4, 4
  br i1 %5, label %6, label %ErrBB

6:                                                ; preds = %CFGVerificationBB_4
  store i32 %BackupG, i32* @G, align 4
  store i32 %BackupD, i32* @D, align 4
  ret i32 0

ErrBB:                                            ; preds = %ErrBB, %CFGVerificationBB_4
  call void @cfg_err_detected()
  br label %ErrBB
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @play() #0 {
CFGVerificationBB_5:
  %LoadG = load i32, i32* @G, align 4
  %0 = xor i32 6, %LoadG
  store i32 %0, i32* @G, align 4
  store i32 0, i32* @D, align 4
  %1 = icmp eq i32 %0, 5
  br i1 %1, label %2, label %ErrBB

2:                                                ; preds = %CFGVerificationBB_5
  %3 = alloca [3 x i8*], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = bitcast [3 x i8*]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([3 x i8*]* @__const.play.moves to i8*), i64 24, i1 false)
  br label %CFGVerificationBB_6

CFGVerificationBB_6:                              ; preds = %61, %2
  %LoadG9 = load i32, i32* @G, align 4
  %LoadD10 = load i32, i32* @D, align 4
  %8 = xor i32 %LoadG9, %LoadD10
  %RunTimeG11 = xor i32 3, %8
  store i32 %RunTimeG11, i32* @G, align 4
  %9 = icmp eq i32 %RunTimeG11, 6
  br i1 %9, label %10, label %ErrBB

10:                                               ; preds = %CFGVerificationBB_6
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.7, i64 0, i64 0))
  %12 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0), i32* noundef %4)
  %13 = load i32, i32* %4, align 4
  %14 = call i32 @advanced_ai_play(i32 noundef %13)
  br label %CFGVerificationBB_7

CFGVerificationBB_7:                              ; preds = %10
  %LoadG1 = load i32, i32* @G, align 4
  %15 = xor i32 17, %LoadG1
  store i32 %15, i32* @G, align 4
  %16 = icmp eq i32 %15, 7
  br i1 %16, label %17, label %ErrBB

17:                                               ; preds = %CFGVerificationBB_7
  store i32 %14, i32* %5, align 4
  %18 = load i32, i32* %5, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %CFGVerificationBB_8, label %CFGVerificationBB_9

CFGVerificationBB_8:                              ; preds = %17
  %LoadG2 = load i32, i32* @G, align 4
  %20 = xor i32 15, %LoadG2
  store i32 %20, i32* @G, align 4
  store i32 5, i32* @D, align 4
  %21 = icmp eq i32 %20, 8
  br i1 %21, label %22, label %ErrBB

22:                                               ; preds = %CFGVerificationBB_8
  %23 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0))
  br label %CFGVerificationBB_16

CFGVerificationBB_9:                              ; preds = %17
  %LoadG12 = load i32, i32* @G, align 4
  %24 = xor i32 14, %LoadG12
  store i32 %24, i32* @G, align 4
  %25 = icmp eq i32 %24, 9
  br i1 %25, label %26, label %ErrBB

26:                                               ; preds = %CFGVerificationBB_9
  %27 = load i32, i32* %4, align 4
  %28 = sub nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [3 x i8*], [3 x i8*]* %3, i64 0, i64 %29
  %31 = load i8*, i8** %30, align 8
  %32 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i64 0, i64 0), i8* noundef %31)
  %33 = load i32, i32* %5, align 4
  %34 = sub nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [3 x i8*], [3 x i8*]* %3, i64 0, i64 %35
  %37 = load i8*, i8** %36, align 8
  %38 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0), i8* noundef %37)
  %39 = load i32, i32* %4, align 4
  %40 = load i32, i32* %5, align 4
  %41 = call i32 @check_winner(i32 noundef %39, i32 noundef %40)
  br label %CFGVerificationBB_10

CFGVerificationBB_10:                             ; preds = %26
  %LoadG3 = load i32, i32* @G, align 4
  %42 = xor i32 22, %LoadG3
  store i32 %42, i32* @G, align 4
  %43 = icmp eq i32 %42, 10
  br i1 %43, label %44, label %ErrBB

44:                                               ; preds = %CFGVerificationBB_10
  store i32 %41, i32* %6, align 4
  %45 = load i32, i32* %6, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %CFGVerificationBB_11, label %CFGVerificationBB_12

CFGVerificationBB_11:                             ; preds = %44
  %LoadG5 = load i32, i32* @G, align 4
  %47 = xor i32 1, %LoadG5
  store i32 %47, i32* @G, align 4
  %48 = icmp eq i32 %47, 11
  br i1 %48, label %49, label %ErrBB

49:                                               ; preds = %CFGVerificationBB_11
  call void @you_lost()
  br label %CFGVerificationBB_14

CFGVerificationBB_12:                             ; preds = %44
  %LoadG13 = load i32, i32* @G, align 4
  %50 = xor i32 6, %LoadG13
  store i32 %50, i32* @G, align 4
  %51 = icmp eq i32 %50, 12
  br i1 %51, label %52, label %ErrBB

52:                                               ; preds = %CFGVerificationBB_12
  call void @you_won()
  br label %CFGVerificationBB_13

CFGVerificationBB_13:                             ; preds = %52
  %LoadG6 = load i32, i32* @G, align 4
  %53 = xor i32 16, %LoadG6
  store i32 %53, i32* @G, align 4
  store i32 0, i32* @D, align 4
  %54 = icmp eq i32 %53, 13
  br i1 %54, label %55, label %ErrBB

55:                                               ; preds = %CFGVerificationBB_13
  br label %CFGVerificationBB_16

CFGVerificationBB_14:                             ; preds = %49
  %LoadG7 = load i32, i32* @G, align 4
  %56 = xor i32 5, %LoadG7
  store i32 %56, i32* @G, align 4
  %57 = icmp eq i32 %56, 14
  br i1 %57, label %58, label %ErrBB

58:                                               ; preds = %CFGVerificationBB_14
  br label %CFGVerificationBB_15

CFGVerificationBB_15:                             ; preds = %58
  %LoadG8 = load i32, i32* @G, align 4
  %59 = xor i32 1, %LoadG8
  store i32 %59, i32* @G, align 4
  store i32 10, i32* @D, align 4
  %60 = icmp eq i32 %59, 15
  br i1 %60, label %61, label %ErrBB

61:                                               ; preds = %CFGVerificationBB_15
  br label %CFGVerificationBB_6

CFGVerificationBB_16:                             ; preds = %55, %22
  %LoadG4 = load i32, i32* @G, align 4
  %LoadD = load i32, i32* @D, align 4
  %62 = xor i32 %LoadG4, %LoadD
  %RunTimeG = xor i32 29, %62
  store i32 %RunTimeG, i32* @G, align 4
  %63 = icmp eq i32 %RunTimeG, 16
  br i1 %63, label %64, label %ErrBB

64:                                               ; preds = %CFGVerificationBB_16
  ret void

ErrBB:                                            ; preds = %ErrBB, %CFGVerificationBB_12, %CFGVerificationBB_9, %CFGVerificationBB_6, %CFGVerificationBB_15, %CFGVerificationBB_14, %CFGVerificationBB_13, %CFGVerificationBB_11, %CFGVerificationBB_16, %CFGVerificationBB_10, %CFGVerificationBB_8, %CFGVerificationBB_7, %CFGVerificationBB_5
  call void @cfg_err_detected()
  br label %ErrBB
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @advanced_ai_play(i32 noundef %0) #0 {
CFGVerificationBB_17:
  %LoadG = load i32, i32* @G, align 4
  %1 = xor i32 23, %LoadG
  store i32 %1, i32* @G, align 4
  %2 = icmp eq i32 %1, 17
  br i1 %2, label %3, label %ErrBB

3:                                                ; preds = %CFGVerificationBB_17
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  switch i32 %6, label %CFGVerificationBB_21 [
    i32 1, label %CFGVerificationBB_18
    i32 2, label %CFGVerificationBB_19
    i32 3, label %CFGVerificationBB_20
  ]

CFGVerificationBB_18:                             ; preds = %3
  %LoadG2 = load i32, i32* @G, align 4
  %7 = xor i32 3, %LoadG2
  store i32 %7, i32* @G, align 4
  store i32 7, i32* @D, align 4
  %8 = icmp eq i32 %7, 18
  br i1 %8, label %9, label %ErrBB

9:                                                ; preds = %CFGVerificationBB_18
  store i32 2, i32* %4, align 4
  br label %CFGVerificationBB_22

CFGVerificationBB_19:                             ; preds = %3
  %LoadG3 = load i32, i32* @G, align 4
  %10 = xor i32 2, %LoadG3
  store i32 %10, i32* @G, align 4
  store i32 6, i32* @D, align 4
  %11 = icmp eq i32 %10, 19
  br i1 %11, label %12, label %ErrBB

12:                                               ; preds = %CFGVerificationBB_19
  store i32 3, i32* %4, align 4
  br label %CFGVerificationBB_22

CFGVerificationBB_20:                             ; preds = %3
  %LoadG4 = load i32, i32* @G, align 4
  %13 = xor i32 5, %LoadG4
  store i32 %13, i32* @G, align 4
  store i32 1, i32* @D, align 4
  %14 = icmp eq i32 %13, 20
  br i1 %14, label %15, label %ErrBB

15:                                               ; preds = %CFGVerificationBB_20
  store i32 1, i32* %4, align 4
  br label %CFGVerificationBB_22

CFGVerificationBB_21:                             ; preds = %3
  %LoadG1 = load i32, i32* @G, align 4
  %16 = xor i32 4, %LoadG1
  store i32 %16, i32* @G, align 4
  store i32 0, i32* @D, align 4
  %17 = icmp eq i32 %16, 21
  br i1 %17, label %18, label %ErrBB

18:                                               ; preds = %CFGVerificationBB_21
  store i32 0, i32* %4, align 4
  br label %CFGVerificationBB_22

CFGVerificationBB_22:                             ; preds = %15, %12, %9, %18
  %LoadG5 = load i32, i32* @G, align 4
  %LoadD = load i32, i32* @D, align 4
  %19 = xor i32 %LoadG5, %LoadD
  %RunTimeG = xor i32 3, %19
  store i32 %RunTimeG, i32* @G, align 4
  %20 = icmp eq i32 %RunTimeG, 22
  br i1 %20, label %21, label %ErrBB

21:                                               ; preds = %CFGVerificationBB_22
  %22 = load i32, i32* %4, align 4
  ret i32 %22

ErrBB:                                            ; preds = %ErrBB, %CFGVerificationBB_22, %CFGVerificationBB_20, %CFGVerificationBB_19, %CFGVerificationBB_18, %CFGVerificationBB_21, %CFGVerificationBB_17
  call void @cfg_err_detected()
  br label %ErrBB
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @check_winner(i32 noundef %0, i32 noundef %1) #0 {
CFGVerificationBB_23:
  %LoadG = load i32, i32* @G, align 4
  %2 = xor i32 30, %LoadG
  store i32 %2, i32* @G, align 4
  %3 = icmp eq i32 %2, 23
  br i1 %3, label %4, label %ErrBB

4:                                                ; preds = %CFGVerificationBB_23
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  %8 = load i32, i32* %6, align 4
  switch i32 %8, label %CFGVerificationBB_27 [
    i32 1, label %CFGVerificationBB_24
    i32 2, label %CFGVerificationBB_25
    i32 3, label %CFGVerificationBB_26
  ]

CFGVerificationBB_24:                             ; preds = %4
  %LoadG3 = load i32, i32* @G, align 4
  %9 = xor i32 15, %LoadG3
  store i32 %9, i32* @G, align 4
  store i32 3, i32* @D, align 4
  %10 = icmp eq i32 %9, 24
  br i1 %10, label %11, label %ErrBB

11:                                               ; preds = %CFGVerificationBB_24
  %12 = load i32, i32* %7, align 4
  %13 = icmp eq i32 %12, 2
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %5, align 4
  br label %CFGVerificationBB_28

CFGVerificationBB_25:                             ; preds = %4
  %LoadG4 = load i32, i32* @G, align 4
  %15 = xor i32 14, %LoadG4
  store i32 %15, i32* @G, align 4
  store i32 2, i32* @D, align 4
  %16 = icmp eq i32 %15, 25
  br i1 %16, label %17, label %ErrBB

17:                                               ; preds = %CFGVerificationBB_25
  %18 = load i32, i32* %7, align 4
  %19 = icmp eq i32 %18, 3
  %20 = zext i1 %19 to i32
  store i32 %20, i32* %5, align 4
  br label %CFGVerificationBB_28

CFGVerificationBB_26:                             ; preds = %4
  %LoadG5 = load i32, i32* @G, align 4
  %21 = xor i32 13, %LoadG5
  store i32 %21, i32* @G, align 4
  store i32 1, i32* @D, align 4
  %22 = icmp eq i32 %21, 26
  br i1 %22, label %23, label %ErrBB

23:                                               ; preds = %CFGVerificationBB_26
  %24 = load i32, i32* %7, align 4
  %25 = icmp eq i32 %24, 1
  %26 = zext i1 %25 to i32
  store i32 %26, i32* %5, align 4
  br label %CFGVerificationBB_28

CFGVerificationBB_27:                             ; preds = %4
  %LoadG2 = load i32, i32* @G, align 4
  %27 = xor i32 12, %LoadG2
  store i32 %27, i32* @G, align 4
  store i32 0, i32* @D, align 4
  %28 = icmp eq i32 %27, 27
  br i1 %28, label %29, label %ErrBB

29:                                               ; preds = %CFGVerificationBB_27
  store i32 0, i32* %5, align 4
  br label %CFGVerificationBB_28

CFGVerificationBB_28:                             ; preds = %23, %17, %11, %29
  %LoadG1 = load i32, i32* @G, align 4
  %LoadD = load i32, i32* @D, align 4
  %30 = xor i32 %LoadG1, %LoadD
  %RunTimeG = xor i32 7, %30
  store i32 %RunTimeG, i32* @G, align 4
  %31 = icmp eq i32 %RunTimeG, 28
  br i1 %31, label %32, label %ErrBB

32:                                               ; preds = %CFGVerificationBB_28
  %33 = load i32, i32* %5, align 4
  ret i32 %33

ErrBB:                                            ; preds = %ErrBB, %CFGVerificationBB_26, %CFGVerificationBB_25, %CFGVerificationBB_24, %CFGVerificationBB_27, %CFGVerificationBB_28, %CFGVerificationBB_23
  call void @cfg_err_detected()
  br label %ErrBB
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @you_won() #0 {
CFGVerificationBB_29:
  %LoadG = load i32, i32* @G, align 4
  %0 = xor i32 17, %LoadG
  store i32 %0, i32* @G, align 4
  %1 = icmp eq i32 %0, 29
  br i1 %1, label %2, label %ErrBB

2:                                                ; preds = %CFGVerificationBB_29
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i64 0, i64 0))
  ret void

ErrBB:                                            ; preds = %ErrBB, %CFGVerificationBB_29
  call void @cfg_err_detected()
  br label %ErrBB
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
