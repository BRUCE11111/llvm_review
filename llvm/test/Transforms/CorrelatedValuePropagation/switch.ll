; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt < %s -passes=correlated-propagation -S | FileCheck %s

define i32 @test_unreachable_default(i32 noundef %num) {
; CHECK-LABEL: define i32 @test_unreachable_default(
; CHECK-SAME: i32 noundef [[NUM:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SUB:%.*]] = add i32 [[NUM]], -120
; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i32 [[SUB]], 3
; CHECK-NEXT:    [[COND:%.*]] = select i1 [[CMP]], i32 [[SUB]], i32 2
; CHECK-NEXT:    switch i32 [[COND]], label [[DEFAULT_UNREACHABLE:%.*]] [
; CHECK-NEXT:      i32 0, label [[SW_BB:%.*]]
; CHECK-NEXT:      i32 1, label [[SW_BB2:%.*]]
; CHECK-NEXT:      i32 2, label [[SW_BB4:%.*]]
; CHECK-NEXT:    ]
; CHECK:       sw.bb:
; CHECK-NEXT:    [[CALL:%.*]] = call i32 @call0()
; CHECK-NEXT:    br label [[CLEANUP:%.*]]
; CHECK:       sw.bb2:
; CHECK-NEXT:    [[CALL3:%.*]] = call i32 @call1()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       sw.bb4:
; CHECK-NEXT:    [[CALL5:%.*]] = call i32 @call2()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       default.unreachable:
; CHECK-NEXT:    unreachable
; CHECK:       sw.default:
; CHECK-NEXT:    [[CALL6:%.*]] = call i32 @call3()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       cleanup:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ [[CALL6]], [[SW_DEFAULT:%.*]] ], [ [[CALL5]], [[SW_BB4]] ], [ [[CALL3]], [[SW_BB2]] ], [ [[CALL]], [[SW_BB]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_0]]
;
entry:
  %sub = add i32 %num, -120
  %cmp = icmp ult i32 %sub, 3
  %cond = select i1 %cmp, i32 %sub, i32 2
  switch i32 %cond, label %sw.default [
  i32 0, label %sw.bb
  i32 1, label %sw.bb2
  i32 2, label %sw.bb4
  ]

sw.bb:
  %call = call i32 @call0()
  br label %cleanup

sw.bb2:
  %call3 = call i32 @call1()
  br label %cleanup

sw.bb4:
  %call5 = call i32 @call2()
  br label %cleanup

sw.default:
  %call6 = call i32 @call3()
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %call6, %sw.default ], [ %call5, %sw.bb4 ], [ %call3, %sw.bb2 ], [ %call, %sw.bb ]
  ret i32 %retval.0
}

define i32 @test_unreachable_default_shared_edge(i32 noundef %num) {
; CHECK-LABEL: define i32 @test_unreachable_default_shared_edge(
; CHECK-SAME: i32 noundef [[NUM:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SUB:%.*]] = add i32 [[NUM]], -120
; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i32 [[SUB]], 3
; CHECK-NEXT:    [[COND:%.*]] = select i1 [[CMP]], i32 [[SUB]], i32 2
; CHECK-NEXT:    switch i32 [[COND]], label [[DEFAULT_UNREACHABLE:%.*]] [
; CHECK-NEXT:      i32 0, label [[SW_BB:%.*]]
; CHECK-NEXT:      i32 1, label [[SW_BB2:%.*]]
; CHECK-NEXT:      i32 2, label [[SW_BB4:%.*]]
; CHECK-NEXT:    ]
; CHECK:       sw.bb:
; CHECK-NEXT:    [[CALL:%.*]] = call i32 @call0()
; CHECK-NEXT:    br label [[CLEANUP:%.*]]
; CHECK:       sw.bb2:
; CHECK-NEXT:    [[CALL3:%.*]] = call i32 @call1()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       default.unreachable:
; CHECK-NEXT:    unreachable
; CHECK:       sw.bb4:
; CHECK-NEXT:    [[CALL5:%.*]] = call i32 @call4(i32 [[SUB]])
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       cleanup:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ [[CALL5]], [[SW_BB4]] ], [ [[CALL3]], [[SW_BB2]] ], [ [[CALL]], [[SW_BB]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_0]]
;
entry:
  %sub = add i32 %num, -120
  %cmp = icmp ult i32 %sub, 3
  %cond = select i1 %cmp, i32 %sub, i32 2
  switch i32 %cond, label %sw.bb4 [
  i32 0, label %sw.bb
  i32 1, label %sw.bb2
  i32 2, label %sw.bb4
  ]

sw.bb:
  %call = call i32 @call0()
  br label %cleanup

sw.bb2:
  %call3 = call i32 @call1()
  br label %cleanup

sw.bb4:
  %val = phi i32 [ %sub, %entry ], [ %sub, %entry ]
  %call5 = call i32 @call4(i32 %val)
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %call5, %sw.bb4 ], [ %call3, %sw.bb2 ], [ %call, %sw.bb ]
  ret i32 %retval.0
}

; Negative tests

define i32 @test_reachable_default(i32 noundef %num) {
; CHECK-LABEL: define i32 @test_reachable_default(
; CHECK-SAME: i32 noundef [[NUM:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SUB:%.*]] = add i32 [[NUM]], -120
; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i32 [[SUB]], 3
; CHECK-NEXT:    [[COND:%.*]] = select i1 [[CMP]], i32 [[SUB]], i32 4
; CHECK-NEXT:    switch i32 [[COND]], label [[SW_DEFAULT:%.*]] [
; CHECK-NEXT:      i32 0, label [[SW_BB:%.*]]
; CHECK-NEXT:      i32 1, label [[SW_BB2:%.*]]
; CHECK-NEXT:      i32 2, label [[SW_BB4:%.*]]
; CHECK-NEXT:    ]
; CHECK:       sw.bb:
; CHECK-NEXT:    [[CALL:%.*]] = call i32 @call0()
; CHECK-NEXT:    br label [[CLEANUP:%.*]]
; CHECK:       sw.bb2:
; CHECK-NEXT:    [[CALL3:%.*]] = call i32 @call1()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       sw.bb4:
; CHECK-NEXT:    [[CALL5:%.*]] = call i32 @call2()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       sw.default:
; CHECK-NEXT:    [[CALL6:%.*]] = call i32 @call3()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       cleanup:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ [[CALL6]], [[SW_DEFAULT]] ], [ [[CALL5]], [[SW_BB4]] ], [ [[CALL3]], [[SW_BB2]] ], [ [[CALL]], [[SW_BB]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_0]]
;
entry:
  %sub = add i32 %num, -120
  %cmp = icmp ult i32 %sub, 3
  %cond = select i1 %cmp, i32 %sub, i32 4
  switch i32 %cond, label %sw.default [
  i32 0, label %sw.bb
  i32 1, label %sw.bb2
  i32 2, label %sw.bb4
  ]

sw.bb:
  %call = call i32 @call0()
  br label %cleanup

sw.bb2:
  %call3 = call i32 @call1()
  br label %cleanup

sw.bb4:
  %call5 = call i32 @call2()
  br label %cleanup

sw.default:
  %call6 = call i32 @call3()
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %call6, %sw.default ], [ %call5, %sw.bb4 ], [ %call3, %sw.bb2 ], [ %call, %sw.bb ]
  ret i32 %retval.0
}

define i32 @test_unreachable_default_cond_may_be_undef(i32 %num) {
; CHECK-LABEL: define i32 @test_unreachable_default_cond_may_be_undef(
; CHECK-SAME: i32 [[NUM:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SUB:%.*]] = add i32 [[NUM]], -120
; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i32 [[SUB]], 3
; CHECK-NEXT:    [[COND:%.*]] = select i1 [[CMP]], i32 [[SUB]], i32 2
; CHECK-NEXT:    switch i32 [[COND]], label [[SW_DEFAULT:%.*]] [
; CHECK-NEXT:      i32 0, label [[SW_BB:%.*]]
; CHECK-NEXT:      i32 1, label [[SW_BB2:%.*]]
; CHECK-NEXT:      i32 2, label [[SW_BB4:%.*]]
; CHECK-NEXT:    ]
; CHECK:       sw.bb:
; CHECK-NEXT:    [[CALL:%.*]] = call i32 @call0()
; CHECK-NEXT:    br label [[CLEANUP:%.*]]
; CHECK:       sw.bb2:
; CHECK-NEXT:    [[CALL3:%.*]] = call i32 @call1()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       sw.bb4:
; CHECK-NEXT:    [[CALL5:%.*]] = call i32 @call2()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       sw.default:
; CHECK-NEXT:    [[CALL6:%.*]] = call i32 @call3()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       cleanup:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ [[CALL6]], [[SW_DEFAULT]] ], [ [[CALL5]], [[SW_BB4]] ], [ [[CALL3]], [[SW_BB2]] ], [ [[CALL]], [[SW_BB]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_0]]
;
entry:
  %sub = add i32 %num, -120
  %cmp = icmp ult i32 %sub, 3
  %cond = select i1 %cmp, i32 %sub, i32 2
  switch i32 %cond, label %sw.default [
  i32 0, label %sw.bb
  i32 1, label %sw.bb2
  i32 2, label %sw.bb4
  ]

sw.bb:
  %call = call i32 @call0()
  br label %cleanup

sw.bb2:
  %call3 = call i32 @call1()
  br label %cleanup

sw.bb4:
  %call5 = call i32 @call2()
  br label %cleanup

sw.default:
  %call6 = call i32 @call3()
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %call6, %sw.default ], [ %call5, %sw.bb4 ], [ %call3, %sw.bb2 ], [ %call, %sw.bb ]
  ret i32 %retval.0
}

define i32 @test_default_is_already_unreachable(i32 %num) {
; CHECK-LABEL: define i32 @test_default_is_already_unreachable(
; CHECK-SAME: i32 [[NUM:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SUB:%.*]] = add i32 [[NUM]], -120
; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i32 [[SUB]], 3
; CHECK-NEXT:    [[COND:%.*]] = select i1 [[CMP]], i32 [[SUB]], i32 2
; CHECK-NEXT:    switch i32 [[COND]], label [[SW_DEFAULT:%.*]] [
; CHECK-NEXT:      i32 0, label [[SW_BB:%.*]]
; CHECK-NEXT:      i32 1, label [[SW_BB2:%.*]]
; CHECK-NEXT:      i32 2, label [[SW_BB4:%.*]]
; CHECK-NEXT:    ]
; CHECK:       sw.bb:
; CHECK-NEXT:    [[CALL:%.*]] = call i32 @call0()
; CHECK-NEXT:    br label [[CLEANUP:%.*]]
; CHECK:       sw.bb2:
; CHECK-NEXT:    [[CALL3:%.*]] = call i32 @call1()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       sw.bb4:
; CHECK-NEXT:    [[CALL5:%.*]] = call i32 @call2()
; CHECK-NEXT:    br label [[CLEANUP]]
; CHECK:       sw.default:
; CHECK-NEXT:    unreachable
; CHECK:       cleanup:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ [[CALL5]], [[SW_BB4]] ], [ [[CALL3]], [[SW_BB2]] ], [ [[CALL]], [[SW_BB]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_0]]
;
entry:
  %sub = add i32 %num, -120
  %cmp = icmp ult i32 %sub, 3
  %cond = select i1 %cmp, i32 %sub, i32 2
  switch i32 %cond, label %sw.default [
  i32 0, label %sw.bb
  i32 1, label %sw.bb2
  i32 2, label %sw.bb4
  ]

sw.bb:
  %call = call i32 @call0()
  br label %cleanup

sw.bb2:
  %call3 = call i32 @call1()
  br label %cleanup

sw.bb4:
  %call5 = call i32 @call2()
  br label %cleanup

sw.default:
  unreachable

cleanup:
  %retval.0 = phi i32 [ %call5, %sw.bb4 ], [ %call3, %sw.bb2 ], [ %call, %sw.bb ]
  ret i32 %retval.0
}

declare i32 @call0()
declare i32 @call1()
declare i32 @call2()
declare i32 @call3()
declare i32 @call4(i32)