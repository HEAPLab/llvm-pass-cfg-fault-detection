; ModuleID = 'tests/rockpaperscissors/rockpaperscissors.c'
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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @cfg_err_detected() #0 {
  %1 = call i32 @puts(i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 noundef 0) #4
  unreachable
}

declare i32 @puts(i8* noundef) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @you_lost() #0 {
  %1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @.str.1, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0))
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([163 x i8], [163 x i8]* @.str.3, i64 0, i64 0))
  call void @play()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @play() #0 {
  %1 = alloca [3 x i8*], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = bitcast [3 x i8*]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 16 bitcast ([3 x i8*]* @__const.play.moves to i8*), i64 24, i1 false)
  br label %6

6:                                                ; preds = %0, %36
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.7, i64 0, i64 0))
  %8 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0), i32* noundef %2)
  %9 = load i32, i32* %2, align 4
  %10 = call i32 @advanced_ai_play(i32 noundef %9)
  store i32 %10, i32* %3, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %6
  %14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0))
  br label %37

15:                                               ; preds = %6
  %16 = load i32, i32* %2, align 4
  %17 = sub nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [3 x i8*], [3 x i8*]* %1, i64 0, i64 %18
  %20 = load i8*, i8** %19, align 8
  %21 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i64 0, i64 0), i8* noundef %20)
  %22 = load i32, i32* %3, align 4
  %23 = sub nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [3 x i8*], [3 x i8*]* %1, i64 0, i64 %24
  %26 = load i8*, i8** %25, align 8
  %27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0), i8* noundef %26)
  %28 = load i32, i32* %2, align 4
  %29 = load i32, i32* %3, align 4
  %30 = call i32 @check_winner(i32 noundef %28, i32 noundef %29)
  store i32 %30, i32* %4, align 4
  %31 = load i32, i32* %4, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

33:                                               ; preds = %15
  call void @you_lost()
  br label %35

34:                                               ; preds = %15
  call void @you_won()
  br label %37

35:                                               ; preds = %33
  br label %36

36:                                               ; preds = %35
  br label %6

37:                                               ; preds = %34, %13
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @advanced_ai_play(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  switch i32 %4, label %8 [
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
  ]

5:                                                ; preds = %1
  store i32 2, i32* %2, align 4
  br label %9

6:                                                ; preds = %1
  store i32 3, i32* %2, align 4
  br label %9

7:                                                ; preds = %1
  store i32 1, i32* %2, align 4
  br label %9

8:                                                ; preds = %1
  store i32 0, i32* %2, align 4
  br label %9

9:                                                ; preds = %8, %7, %6, %5
  %10 = load i32, i32* %2, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @check_winner(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %4, align 4
  switch i32 %6, label %19 [
    i32 1, label %7
    i32 2, label %11
    i32 3, label %15
  ]

7:                                                ; preds = %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp eq i32 %8, 2
  %10 = zext i1 %9 to i32
  store i32 %10, i32* %3, align 4
  br label %20

11:                                               ; preds = %2
  %12 = load i32, i32* %5, align 4
  %13 = icmp eq i32 %12, 3
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %3, align 4
  br label %20

15:                                               ; preds = %2
  %16 = load i32, i32* %5, align 4
  %17 = icmp eq i32 %16, 1
  %18 = zext i1 %17 to i32
  store i32 %18, i32* %3, align 4
  br label %20

19:                                               ; preds = %2
  store i32 0, i32* %3, align 4
  br label %20

20:                                               ; preds = %19, %15, %11, %7
  %21 = load i32, i32* %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @you_won() #0 {
  %1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i64 0, i64 0))
  ret void
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
