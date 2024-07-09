; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+zfh,+zfa,+zvfh,+v -target-abi ilp32d -verify-machineinstrs < %s \
; RUN:   | FileCheck %s --check-prefixes=CHECK
; RUN: llc -mtriple=riscv64 -mattr=+zfh,+zfa,+zvfh,+v -target-abi lp64d -verify-machineinstrs < %s \
; RUN:   | FileCheck %s --check-prefixes=CHECK

define <vscale x 8 x half> @vsplat_f16_0p625() {
; CHECK-LABEL: vsplat_f16_0p625:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa5, 0.625
; CHECK-NEXT:    vsetvli a0, zero, e16, m2, ta, ma
; CHECK-NEXT:    vfmv.v.f v8, fa5
; CHECK-NEXT:    ret
  ret <vscale x 8 x half> splat (half 0.625)
}

define <vscale x 8 x float> @vsplat_f32_0p75() {
; CHECK-LABEL: vsplat_f32_0p75:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.s fa5, 0.75
; CHECK-NEXT:    vsetvli a0, zero, e32, m4, ta, ma
; CHECK-NEXT:    vfmv.v.f v8, fa5
; CHECK-NEXT:    ret
  ret <vscale x 8 x float> splat (float 0.75)
}

define <vscale x 8 x double> @vsplat_f64_neg1() {
; CHECK-LABEL: vsplat_f64_neg1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.d fa5, -1.0
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, ma
; CHECK-NEXT:    vfmv.v.f v8, fa5
; CHECK-NEXT:    ret
  ret <vscale x 8 x double> splat (double -1.0)
}