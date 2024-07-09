; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -passes=newgvn -S < %s | FileCheck %s
@y = external global i32
@z = external global i32

; Function Attrs: nounwind ssp uwtable
define void @foo(i32 %x) {
; CHECK-LABEL: define void @foo(
; CHECK-SAME: i32 [[X:%.*]]) {
; CHECK-NEXT:    [[DOTPRE:%.*]] = load i32, ptr @y, align 4
; CHECK-NEXT:    br i1 false, label [[IF_THEN:%.*]], label [[ENTRY_IF_END_CRIT_EDGE:%.*]]
; CHECK:       entry.if.end_crit_edge:
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    store i8 poison, ptr null, align 1
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    tail call void @bar(i32 [[DOTPRE]])
; CHECK-NEXT:    ret void
;

  %t = sub i32 %x, %x
  %.pre = load i32, ptr @y, align 4
  %cmp = icmp sgt i32 %t, 2
  br i1 %cmp, label %if.then, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

if.then:                                          ; preds = %entry
  %add = add nsw i32 %x, 3
  store i32 %add, ptr @y, align 4
  br label %if.end

if.end:                                           ; preds = %entry.if.end_crit_edge, %if.then
  %1 = phi i32 [ %.pre, %entry.if.end_crit_edge ], [ %add, %if.then ]
  tail call void @bar(i32 %1)
  ret void
}

define void @foo2(i32 %x) {
; CHECK-LABEL: define void @foo2(
; CHECK-SAME: i32 [[X:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[DOTPRE:%.*]] = load i32, ptr @y, align 4
; CHECK-NEXT:    br i1 false, label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    store i8 poison, ptr null, align 1
; CHECK-NEXT:    br label [[IF_END:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    store i32 1, ptr @z, align 4
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    tail call void @bar(i32 [[DOTPRE]])
; CHECK-NEXT:    ret void
;
entry:
  %t = sub i32 %x, %x
  %.pre = load i32, ptr @y, align 4
  %cmp = icmp sgt i32 %t, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %add = add nsw i32 %x, 3
  store i32 %add, ptr @y, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 1, ptr @z, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %0 = phi i32 [ %.pre, %if.else ], [ %add, %if.then ]
  tail call void @bar(i32 %0)
  ret void
}

declare void @bar(i32)