; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; Verify that strlen calls with elements of constant arrays are folded.
;
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

declare i32 @strcmp(ptr, ptr)

@a5 = constant [5 x [4 x i8]] [[4 x i8] c"123\00", [4 x i8] c"123\00", [4 x i8] c"12\00\00", [4 x i8] zeroinitializer, [4 x i8] zeroinitializer]


; Fold strcmp(a5[0], a5[1]) to '1' - '1'.

define i32 @fold_strcmp_a5i0_a5i1_to_0() {
; CHECK-LABEL: @fold_strcmp_a5i0_a5i1_to_0(
; CHECK-NEXT:    ret i32 0
;
  %q = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 1, i64 0

  %cmp = call i32 @strcmp(ptr @a5, ptr %q)
  ret i32 %cmp
}


; Do not fold strcmp(a5[0], a5[I]) where the index I is not constant.

define i32 @call_strcmp_a5i0_a5iI(i64 %I) {
; CHECK-LABEL: @call_strcmp_a5i0_a5iI(
; CHECK-NEXT:    [[Q:%.*]] = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 [[I:%.*]], i64 0
; CHECK-NEXT:    [[CMP:%.*]] = call i32 @strcmp(ptr noundef nonnull dereferenceable(4) @a5, ptr noundef nonnull dereferenceable(1) [[Q]])
; CHECK-NEXT:    ret i32 [[CMP]]
;
  %q = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 %I, i64 0

  %cmp = call i32 @strcmp(ptr @a5, ptr %q)
  ret i32 %cmp
}


; Same as above but for strcmp(a5[I], a5[0]).

define i32 @call_strcmp_a5iI_a5i0(i64 %I) {
; CHECK-LABEL: @call_strcmp_a5iI_a5i0(
; CHECK-NEXT:    [[P:%.*]] = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 [[I:%.*]], i64 0
; CHECK-NEXT:    [[CMP:%.*]] = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) [[P]], ptr noundef nonnull dereferenceable(4) @a5)
; CHECK-NEXT:    ret i32 [[CMP]]
;
  %p = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 %I, i64 0

  %cmp = call i32 @strcmp(ptr %p, ptr @a5)
  ret i32 %cmp
}


; Fold strcmp(a5[0], &a5[1][1]) to '1' - '2'.

define i32 @fold_strcmp_a5i0_a5i1_p1_to_0() {
; CHECK-LABEL: @fold_strcmp_a5i0_a5i1_p1_to_0(
; CHECK-NEXT:    ret i32 -1
;
  %q = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 1, i64 1

  %cmp = call i32 @strcmp(ptr @a5, ptr %q)
  ret i32 %cmp
}


; Do not fold strcmp(a5[0], &a5[1][I]) when the index I is not constant.

define i32 @call_strcmp_a5i0_a5i1_pI(i64 %I) {
; CHECK-LABEL: @call_strcmp_a5i0_a5i1_pI(
; CHECK-NEXT:    [[Q:%.*]] = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 1, i64 [[I:%.*]]
; CHECK-NEXT:    [[CMP:%.*]] = call i32 @strcmp(ptr noundef nonnull dereferenceable(4) @a5, ptr noundef nonnull dereferenceable(1) [[Q]])
; CHECK-NEXT:    ret i32 [[CMP]]
;
  %q = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 1, i64 %I

  %cmp = call i32 @strcmp(ptr @a5, ptr %q)
  ret i32 %cmp
}


; Fold strcmp(&a5[0][1], a5[1]) to '2' - '1'.

define i32 @fold_strcmp_a5i0_p1_a5i1_to_0() {
; CHECK-LABEL: @fold_strcmp_a5i0_p1_a5i1_to_0(
; CHECK-NEXT:    ret i32 1
;
  %p = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 0, i64 1
  %q = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 1, i64 0

  %cmp = call i32 @strcmp(ptr %p, ptr %q)
  ret i32 %cmp
}


; Fold strcmp(a5[0], a5[2]) to a5[0][2] - a5[2][2] or 1.

define i32 @fold_strcmp_a5i0_a5i2_to_0() {
; CHECK-LABEL: @fold_strcmp_a5i0_a5i2_to_0(
; CHECK-NEXT:    ret i32 1
;
  %q = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 2, i64 0

  %cmp = call i32 @strcmp(ptr @a5, ptr %q)
  ret i32 %cmp
}


; Fold strcmp(a5[2], a5[0]) to a5[0][2] - a5[2][2] or 1.

define i32 @fold_strcmp_a5i2_a5i0_to_m1() {
; CHECK-LABEL: @fold_strcmp_a5i2_a5i0_to_m1(
; CHECK-NEXT:    ret i32 -1
;
  %q = getelementptr [5 x [4 x i8]], ptr @a5, i64 0, i64 2, i64 0

  %cmp = call i32 @strcmp(ptr %q, ptr @a5)
  ret i32 %cmp
}