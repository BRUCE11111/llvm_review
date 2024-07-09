; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -codegenprepare -S -mtriple=x86_64-unknown-unknown < %s | FileCheck %s

define i1 @test_is_inf_or_nan(double %arg) {
; CHECK-LABEL: define i1 @test_is_inf_or_nan(
; CHECK-SAME: double [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f64(double [[ARG]], i32 519)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call double @llvm.fabs.f64(double %arg)
  %ret = fcmp ueq double %abs, 0x7FF0000000000000
  ret i1 %ret
}

define i1 @test_is_not_inf_or_nan(double %arg) {
; CHECK-LABEL: define i1 @test_is_not_inf_or_nan(
; CHECK-SAME: double [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f64(double [[ARG]], i32 504)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call double @llvm.fabs.f64(double %arg)
  %ret = fcmp one double %abs, 0x7FF0000000000000
  ret i1 %ret
}

define i1 @test_is_inf(double %arg) {
; CHECK-LABEL: define i1 @test_is_inf(
; CHECK-SAME: double [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f64(double [[ARG]], i32 516)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call double @llvm.fabs.f64(double %arg)
  %ret = fcmp oeq double %abs, 0x7FF0000000000000
  ret i1 %ret
}

define i1 @test_is_not_inf(double %arg) {
; CHECK-LABEL: define i1 @test_is_not_inf(
; CHECK-SAME: double [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f64(double [[ARG]], i32 507)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call double @llvm.fabs.f64(double %arg)
  %ret = fcmp une double %abs, 0x7FF0000000000000
  ret i1 %ret
}

define <4 x i1> @test_vec_is_inf_or_nan(<4 x double> %arg) {
; CHECK-LABEL: define <4 x i1> @test_vec_is_inf_or_nan(
; CHECK-SAME: <4 x double> [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.is.fpclass.v4f64(<4 x double> [[ARG]], i32 519)
; CHECK-NEXT:    ret <4 x i1> [[TMP1]]
;
  %abs = tail call <4 x double> @llvm.fabs.v4f64(<4 x double> %arg)
  %ret = fcmp ueq <4 x double> %abs, splat (double 0x7FF0000000000000)
  ret <4 x i1> %ret
}

define <4 x i1> @test_vec_is_not_inf_or_nan(<4 x double> %arg) {
; CHECK-LABEL: define <4 x i1> @test_vec_is_not_inf_or_nan(
; CHECK-SAME: <4 x double> [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.is.fpclass.v4f64(<4 x double> [[ARG]], i32 504)
; CHECK-NEXT:    ret <4 x i1> [[TMP1]]
;
  %abs = tail call <4 x double> @llvm.fabs.v4f64(<4 x double> %arg)
  %ret = fcmp one <4 x double> %abs, splat (double 0x7FF0000000000000)
  ret <4 x i1> %ret
}

define <4 x i1> @test_vec_is_inf(<4 x double> %arg) {
; CHECK-LABEL: define <4 x i1> @test_vec_is_inf(
; CHECK-SAME: <4 x double> [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.is.fpclass.v4f64(<4 x double> [[ARG]], i32 516)
; CHECK-NEXT:    ret <4 x i1> [[TMP1]]
;
  %abs = tail call <4 x double> @llvm.fabs.v4f64(<4 x double> %arg)
  %ret = fcmp oeq <4 x double> %abs, splat (double 0x7FF0000000000000)
  ret <4 x i1> %ret
}

define <4 x i1> @test_vec_is_not_inf(<4 x double> %arg) {
; CHECK-LABEL: define <4 x i1> @test_vec_is_not_inf(
; CHECK-SAME: <4 x double> [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.is.fpclass.v4f64(<4 x double> [[ARG]], i32 507)
; CHECK-NEXT:    ret <4 x i1> [[TMP1]]
;
  %abs = tail call <4 x double> @llvm.fabs.v4f64(<4 x double> %arg)
  %ret = fcmp une <4 x double> %abs, splat (double 0x7FF0000000000000)
  ret <4 x i1> %ret
}

define i1 @test_fp128_is_inf_or_nan(fp128 %arg) {
; CHECK-LABEL: define i1 @test_fp128_is_inf_or_nan(
; CHECK-SAME: fp128 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f128(fp128 [[ARG]], i32 519)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call fp128 @llvm.fabs.f128(fp128 %arg)
  %ret = fcmp ueq fp128 %abs, 0xL00000000000000007FFF000000000000
  ret i1 %ret
}

define i1 @test_fp128_is_not_inf_or_nan(fp128 %arg) {
; CHECK-LABEL: define i1 @test_fp128_is_not_inf_or_nan(
; CHECK-SAME: fp128 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f128(fp128 [[ARG]], i32 504)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call fp128 @llvm.fabs.f128(fp128 %arg)
  %ret = fcmp one fp128 %abs, 0xL00000000000000007FFF000000000000
  ret i1 %ret
}

define i1 @test_fp128_is_inf(fp128 %arg) {
; CHECK-LABEL: define i1 @test_fp128_is_inf(
; CHECK-SAME: fp128 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f128(fp128 [[ARG]], i32 516)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call fp128 @llvm.fabs.f128(fp128 %arg)
  %ret = fcmp oeq fp128 %abs, 0xL00000000000000007FFF000000000000
  ret i1 %ret
}

define i1 @test_fp128_is_not_inf(fp128 %arg) {
; CHECK-LABEL: define i1 @test_fp128_is_not_inf(
; CHECK-SAME: fp128 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f128(fp128 [[ARG]], i32 507)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call fp128 @llvm.fabs.f128(fp128 %arg)
  %ret = fcmp une fp128 %abs, 0xL00000000000000007FFF000000000000
  ret i1 %ret
}

define i1 @test_x86_fp80_is_inf_or_nan(x86_fp80 %arg) {
; CHECK-LABEL: define i1 @test_x86_fp80_is_inf_or_nan(
; CHECK-SAME: x86_fp80 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f80(x86_fp80 [[ARG]], i32 519)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call x86_fp80 @llvm.fabs.f80(x86_fp80 %arg)
  %ret = fcmp ueq x86_fp80 %abs, 0xK7FFF8000000000000000
  ret i1 %ret
}

define i1 @test_x86_fp80_is_not_inf_or_nan(x86_fp80 %arg) {
; CHECK-LABEL: define i1 @test_x86_fp80_is_not_inf_or_nan(
; CHECK-SAME: x86_fp80 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f80(x86_fp80 [[ARG]], i32 504)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call x86_fp80 @llvm.fabs.f80(x86_fp80 %arg)
  %ret = fcmp one x86_fp80 %abs, 0xK7FFF8000000000000000
  ret i1 %ret
}

define i1 @test_x86_fp80_is_inf(x86_fp80 %arg) {
; CHECK-LABEL: define i1 @test_x86_fp80_is_inf(
; CHECK-SAME: x86_fp80 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f80(x86_fp80 [[ARG]], i32 516)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call x86_fp80 @llvm.fabs.f80(x86_fp80 %arg)
  %ret = fcmp oeq x86_fp80 %abs, 0xK7FFF8000000000000000
  ret i1 %ret
}

define i1 @test_x86_fp80_is_not_inf(x86_fp80 %arg) {
; CHECK-LABEL: define i1 @test_x86_fp80_is_not_inf(
; CHECK-SAME: x86_fp80 [[ARG:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = call i1 @llvm.is.fpclass.f80(x86_fp80 [[ARG]], i32 507)
; CHECK-NEXT:    ret i1 [[TMP1]]
;
  %abs = tail call x86_fp80 @llvm.fabs.f80(x86_fp80 %arg)
  %ret = fcmp une x86_fp80 %abs, 0xK7FFF8000000000000000
  ret i1 %ret
}