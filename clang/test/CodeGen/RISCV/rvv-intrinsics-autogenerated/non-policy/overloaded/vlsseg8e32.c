// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py UTC_ARGS: --version 2
// REQUIRES: riscv-registered-target
// RUN: %clang_cc1 -triple riscv64 -target-feature +v -target-feature +zfh \
// RUN:   -target-feature +zvfh -disable-O0-optnone  \
// RUN:   -emit-llvm %s -o - | opt -S -passes=mem2reg | \
// RUN:   FileCheck --check-prefix=CHECK-RV64 %s

#include <riscv_vector.h>

// CHECK-RV64-LABEL: define dso_local { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @test_vlsseg8e32_v_f32mf2x8_m
// CHECK-RV64-SAME: (<vscale x 1 x i1> [[MASK:%.*]], ptr noundef [[BASE:%.*]], i64 noundef [[BSTRIDE:%.*]], i64 noundef [[VL:%.*]]) #[[ATTR0:[0-9]+]] {
// CHECK-RV64-NEXT:  entry:
// CHECK-RV64-NEXT:    [[TMP0:%.*]] = call { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @llvm.riscv.vlsseg8.mask.nxv1f32.i64(<vscale x 1 x float> poison, <vscale x 1 x float> poison, <vscale x 1 x float> poison, <vscale x 1 x float> poison, <vscale x 1 x float> poison, <vscale x 1 x float> poison, <vscale x 1 x float> poison, <vscale x 1 x float> poison, ptr [[BASE]], i64 [[BSTRIDE]], <vscale x 1 x i1> [[MASK]], i64 [[VL]], i64 3)
// CHECK-RV64-NEXT:    ret { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } [[TMP0]]
//
vfloat32mf2x8_t test_vlsseg8e32_v_f32mf2x8_m(vbool64_t mask, const float *base, ptrdiff_t bstride, size_t vl) {
  return __riscv_vlsseg8e32(mask, base, bstride, vl);
}

// CHECK-RV64-LABEL: define dso_local { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @test_vlsseg8e32_v_f32m1x8_m
// CHECK-RV64-SAME: (<vscale x 2 x i1> [[MASK:%.*]], ptr noundef [[BASE:%.*]], i64 noundef [[BSTRIDE:%.*]], i64 noundef [[VL:%.*]]) #[[ATTR0]] {
// CHECK-RV64-NEXT:  entry:
// CHECK-RV64-NEXT:    [[TMP0:%.*]] = call { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @llvm.riscv.vlsseg8.mask.nxv2f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> poison, <vscale x 2 x float> poison, <vscale x 2 x float> poison, <vscale x 2 x float> poison, <vscale x 2 x float> poison, <vscale x 2 x float> poison, <vscale x 2 x float> poison, ptr [[BASE]], i64 [[BSTRIDE]], <vscale x 2 x i1> [[MASK]], i64 [[VL]], i64 3)
// CHECK-RV64-NEXT:    ret { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } [[TMP0]]
//
vfloat32m1x8_t test_vlsseg8e32_v_f32m1x8_m(vbool32_t mask, const float *base, ptrdiff_t bstride, size_t vl) {
  return __riscv_vlsseg8e32(mask, base, bstride, vl);
}

// CHECK-RV64-LABEL: define dso_local { <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32> } @test_vlsseg8e32_v_i32mf2x8_m
// CHECK-RV64-SAME: (<vscale x 1 x i1> [[MASK:%.*]], ptr noundef [[BASE:%.*]], i64 noundef [[BSTRIDE:%.*]], i64 noundef [[VL:%.*]]) #[[ATTR0]] {
// CHECK-RV64-NEXT:  entry:
// CHECK-RV64-NEXT:    [[TMP0:%.*]] = call { <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32> } @llvm.riscv.vlsseg8.mask.nxv1i32.i64(<vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, ptr [[BASE]], i64 [[BSTRIDE]], <vscale x 1 x i1> [[MASK]], i64 [[VL]], i64 3)
// CHECK-RV64-NEXT:    ret { <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32> } [[TMP0]]
//
vint32mf2x8_t test_vlsseg8e32_v_i32mf2x8_m(vbool64_t mask, const int32_t *base, ptrdiff_t bstride, size_t vl) {
  return __riscv_vlsseg8e32(mask, base, bstride, vl);
}

// CHECK-RV64-LABEL: define dso_local { <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32> } @test_vlsseg8e32_v_i32m1x8_m
// CHECK-RV64-SAME: (<vscale x 2 x i1> [[MASK:%.*]], ptr noundef [[BASE:%.*]], i64 noundef [[BSTRIDE:%.*]], i64 noundef [[VL:%.*]]) #[[ATTR0]] {
// CHECK-RV64-NEXT:  entry:
// CHECK-RV64-NEXT:    [[TMP0:%.*]] = call { <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32> } @llvm.riscv.vlsseg8.mask.nxv2i32.i64(<vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, ptr [[BASE]], i64 [[BSTRIDE]], <vscale x 2 x i1> [[MASK]], i64 [[VL]], i64 3)
// CHECK-RV64-NEXT:    ret { <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32> } [[TMP0]]
//
vint32m1x8_t test_vlsseg8e32_v_i32m1x8_m(vbool32_t mask, const int32_t *base, ptrdiff_t bstride, size_t vl) {
  return __riscv_vlsseg8e32(mask, base, bstride, vl);
}

// CHECK-RV64-LABEL: define dso_local { <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32> } @test_vlsseg8e32_v_u32mf2x8_m
// CHECK-RV64-SAME: (<vscale x 1 x i1> [[MASK:%.*]], ptr noundef [[BASE:%.*]], i64 noundef [[BSTRIDE:%.*]], i64 noundef [[VL:%.*]]) #[[ATTR0]] {
// CHECK-RV64-NEXT:  entry:
// CHECK-RV64-NEXT:    [[TMP0:%.*]] = call { <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32> } @llvm.riscv.vlsseg8.mask.nxv1i32.i64(<vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, <vscale x 1 x i32> poison, ptr [[BASE]], i64 [[BSTRIDE]], <vscale x 1 x i1> [[MASK]], i64 [[VL]], i64 3)
// CHECK-RV64-NEXT:    ret { <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32> } [[TMP0]]
//
vuint32mf2x8_t test_vlsseg8e32_v_u32mf2x8_m(vbool64_t mask, const uint32_t *base, ptrdiff_t bstride, size_t vl) {
  return __riscv_vlsseg8e32(mask, base, bstride, vl);
}

// CHECK-RV64-LABEL: define dso_local { <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32> } @test_vlsseg8e32_v_u32m1x8_m
// CHECK-RV64-SAME: (<vscale x 2 x i1> [[MASK:%.*]], ptr noundef [[BASE:%.*]], i64 noundef [[BSTRIDE:%.*]], i64 noundef [[VL:%.*]]) #[[ATTR0]] {
// CHECK-RV64-NEXT:  entry:
// CHECK-RV64-NEXT:    [[TMP0:%.*]] = call { <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32> } @llvm.riscv.vlsseg8.mask.nxv2i32.i64(<vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, <vscale x 2 x i32> poison, ptr [[BASE]], i64 [[BSTRIDE]], <vscale x 2 x i1> [[MASK]], i64 [[VL]], i64 3)
// CHECK-RV64-NEXT:    ret { <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32> } [[TMP0]]
//
vuint32m1x8_t test_vlsseg8e32_v_u32m1x8_m(vbool32_t mask, const uint32_t *base, ptrdiff_t bstride, size_t vl) {
  return __riscv_vlsseg8e32(mask, base, bstride, vl);
}
