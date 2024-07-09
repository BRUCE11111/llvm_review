; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mattr=+sve -force-streaming-compatible < %s | FileCheck %s
; RUN: llc -mattr=+sme -force-streaming < %s | FileCheck %s
; RUN: llc -force-streaming-compatible < %s | FileCheck %s --check-prefix=NONEON-NOSVE


; Test we can code generater patterns of the form:
;   fixed_length_vector = ISD::EXTRACT_SUBVECTOR scalable_vector, 0
;   scalable_vector = ISD::INSERT_SUBVECTOR scalable_vector, fixed_length_vector, 0
;
; NOTE: Currently shufflevector does not support scalable vectors so it cannot
; be used to model the above operations.  Instead these tests rely on knowing
; how fixed length operation are lowered to scalable ones, with multiple blocks
; ensuring insert/extract sequences are not folded away.

target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; i8
define void @subvector_v4i8(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v4i8:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ptrue p0.h, vl4
; CHECK-NEXT:    ld1b { z0.h }, p0/z, [x0]
; CHECK-NEXT:    st1b { z0.h }, p0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v4i8:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldrh w8, [x0, #2]
; NONEON-NOSVE-NEXT:    ldrb w9, [x0, #1]
; NONEON-NOSVE-NEXT:    ldrb w10, [x0]
; NONEON-NOSVE-NEXT:    strh w8, [x1, #2]
; NONEON-NOSVE-NEXT:    strb w9, [x1, #1]
; NONEON-NOSVE-NEXT:    strb w10, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x i8>, ptr %in
  br label %bb1

bb1:
  store <4 x i8> %a, ptr %out
  ret void
}

define void @subvector_v8i8(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v8i8:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr d0, [x0]
; CHECK-NEXT:    str d0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v8i8:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr d0, [x0]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <8 x i8>, ptr %in
  br label %bb1

bb1:
  store <8 x i8> %a, ptr %out
  ret void
}

define void @subvector_v16i8(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v16i8:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v16i8:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <16 x i8>, ptr %in
  br label %bb1

bb1:
  store <16 x i8> %a, ptr %out
  ret void
}

define void @subvector_v32i8(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v32i8:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    stp q0, q1, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v32i8:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldp q0, q1, [x0]
; NONEON-NOSVE-NEXT:    stp q0, q1, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <32 x i8>, ptr %in
  br label %bb1

bb1:
  store <32 x i8> %a, ptr %out
  ret void
}

; i16
define void @subvector_v2i16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v2i16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ptrue p0.s, vl2
; CHECK-NEXT:    ld1h { z0.s }, p0/z, [x0]
; CHECK-NEXT:    st1h { z0.s }, p0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v2i16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr w8, [x0]
; NONEON-NOSVE-NEXT:    str w8, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x i16>, ptr %in
  br label %bb1

bb1:
  store <2 x i16> %a, ptr %out
  ret void
}

define void @subvector_v4i16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v4i16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr d0, [x0]
; CHECK-NEXT:    str d0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v4i16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr d0, [x0]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x i16>, ptr %in
  br label %bb1

bb1:
  store <4 x i16> %a, ptr %out
  ret void
}

define void @subvector_v8i16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v8i16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v8i16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <8 x i16>, ptr %in
  br label %bb1

bb1:
  store <8 x i16> %a, ptr %out
  ret void
}

define void @subvector_v16i16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v16i16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    stp q0, q1, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v16i16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldp q0, q1, [x0]
; NONEON-NOSVE-NEXT:    stp q0, q1, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <16 x i16>, ptr %in
  br label %bb1

bb1:
  store <16 x i16> %a, ptr %out
  ret void
}

; i32
define void @subvector_v2i32(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v2i32:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr d0, [x0]
; CHECK-NEXT:    str d0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v2i32:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr d0, [x0]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x i32>, ptr %in
  br label %bb1

bb1:
  store <2 x i32> %a, ptr %out
  ret void
}

define void @subvector_v4i32(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v4i32:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v4i32:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x i32>, ptr %in
  br label %bb1

bb1:
  store <4 x i32> %a, ptr %out
  ret void
}

define void @subvector_v8i32(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v8i32:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    stp q0, q1, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v8i32:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldp q0, q1, [x0]
; NONEON-NOSVE-NEXT:    stp q0, q1, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <8 x i32>, ptr %in
  br label %bb1

bb1:
  store <8 x i32> %a, ptr %out
  ret void
}

; i64
define void @subvector_v2i64(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v2i64:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v2i64:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x i64>, ptr %in
  br label %bb1

bb1:
  store <2 x i64> %a, ptr %out
  ret void
}

define void @subvector_v4i64(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v4i64:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    stp q0, q1, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v4i64:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldp q0, q1, [x0]
; NONEON-NOSVE-NEXT:    stp q0, q1, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x i64>, ptr %in
  br label %bb1

bb1:
  store <4 x i64> %a, ptr %out
  ret void
}

; f16
define void @subvector_v2f16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v2f16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr w8, [x0]
; CHECK-NEXT:    str w8, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v2f16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr w8, [x0]
; NONEON-NOSVE-NEXT:    str w8, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x half>, ptr %in
  br label %bb1

bb1:
  store <2 x half> %a, ptr %out
  ret void
}

define void @subvector_v4f16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v4f16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr d0, [x0]
; CHECK-NEXT:    str d0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v4f16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr d0, [x0]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x half>, ptr %in
  br label %bb1

bb1:
  store <4 x half> %a, ptr %out
  ret void
}

define void @subvector_v8f16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v8f16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v8f16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <8 x half>, ptr %in
  br label %bb1

bb1:
  store <8 x half> %a, ptr %out
  ret void
}

define void @subvector_v16f16(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v16f16:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    stp q0, q1, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v16f16:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldp q0, q1, [x0]
; NONEON-NOSVE-NEXT:    stp q0, q1, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <16 x half>, ptr %in
  br label %bb1

bb1:
  store <16 x half> %a, ptr %out
  ret void
}

; f32
define void @subvector_v2f32(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v2f32:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr d0, [x0]
; CHECK-NEXT:    str d0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v2f32:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr d0, [x0]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x float>, ptr %in
  br label %bb1

bb1:
  store <2 x float> %a, ptr %out
  ret void
}

define void @subvector_v4f32(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v4f32:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v4f32:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x float>, ptr %in
  br label %bb1

bb1:
  store <4 x float> %a, ptr %out
  ret void
}

define void @subvector_v8f32(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v8f32:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    stp q0, q1, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v8f32:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldp q0, q1, [x0]
; NONEON-NOSVE-NEXT:    stp q0, q1, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <8 x float>,ptr %in
  br label %bb1

bb1:
  store <8 x float> %a, ptr %out
  ret void
}

; f64
define void @subvector_v2f64(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v2f64:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v2f64:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x double>, ptr %in
  br label %bb1

bb1:
  store <2 x double> %a, ptr %out
  ret void
}

define void @subvector_v4f64(ptr %in, ptr %out) {
; CHECK-LABEL: subvector_v4f64:
; CHECK:       // %bb.0: // %bb1
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    stp q0, q1, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: subvector_v4f64:
; NONEON-NOSVE:       // %bb.0: // %bb1
; NONEON-NOSVE-NEXT:    ldp q0, q1, [x0]
; NONEON-NOSVE-NEXT:    stp q0, q1, [x1]
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x double>, ptr %in
  br label %bb1

bb1:
  store <4 x double> %a, ptr %out
  ret void
}