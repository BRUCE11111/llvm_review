; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 2
; RUN: opt -S -passes='print<scalar-evolution>,indvars' < %s 2>/dev/null | FileCheck %s

; We should use %invariant.op.us rather than %invariant.op for the exit
; value expansion. They have the same SCEV, but %invariant.op is more
; poisonous.
define i32 @test(i1 %c) {
; CHECK-LABEL: define i32 @test
; CHECK-SAME: (i1 [[C:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[C]], i32 33, i32 0
; CHECK-NEXT:    [[SUB_I:%.*]] = add nsw i32 [[SEL]], -68
; CHECK-NEXT:    [[SHL_I:%.*]] = shl nuw nsw i32 1, [[SUB_I]]
; CHECK-NEXT:    [[ADD:%.*]] = add nsw i32 [[SHL_I]], [[SEL]]
; CHECK-NEXT:    [[SEXT:%.*]] = shl i32 [[ADD]], 24
; CHECK-NEXT:    [[CONV2:%.*]] = ashr exact i32 [[SEXT]], 24
; CHECK-NEXT:    [[INVARIANT_OP:%.*]] = sub nsw i32 7, [[CONV2]]
; CHECK-NEXT:    call void @use(i32 [[INVARIANT_OP]])
; CHECK-NEXT:    [[SEXT_US:%.*]] = shl i32 [[SEL]], 24
; CHECK-NEXT:    [[CONV2_US:%.*]] = ashr exact i32 [[SEXT_US]], 24
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    br i1 true, label [[EXIT:%.*]], label [[LOOP]]
; CHECK:       exit:
; CHECK-NEXT:    [[INVARIANT_OP_US:%.*]] = sub nsw i32 7, [[CONV2_US]]
; CHECK-NEXT:    ret i32 [[INVARIANT_OP_US]]
;
entry:
  %sel = select i1 %c, i32 33, i32 0
  %sub.i = add nsw i32 %sel, -68
  %shl.i = shl nuw nsw i32 1, %sub.i
  %add = add nsw i32 %shl.i, %sel
  %sext = shl i32 %add, 24
  %conv2 = ashr exact i32 %sext, 24
  %invariant.op = sub nsw i32 7, %conv2
  call void @use(i32 %invariant.op)
  %sext.us = shl i32 %sel, 24
  %conv2.us = ashr exact i32 %sext.us, 24
  %invariant.op.us = sub nsw i32 7, %conv2.us
  br label %loop

loop:
  %iv = phi i32 [ %iv.next , %loop ], [ 0, %entry ]
  %iv.next = add i32 %iv, 1
  %cmp = icmp eq i32 %iv.next, %invariant.op.us
  br i1 %cmp, label %exit, label %loop

exit:
  ret i32 %iv.next
}

declare void @use(i32)