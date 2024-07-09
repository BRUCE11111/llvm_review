// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// REQUIRES: riscv-registered-target
// RUN: %clang_cc1 -triple riscv64 -target-feature +f -target-feature +d \
// RUN:   -target-feature +v -target-feature +zfh -target-feature +zvfh \
// RUN:   -target-feature +xsfvcp \
// RUN:   -fsyntax-only -verify %s

#include <sifive_vector.h>

#define p27_26 (0b11)
#define p26    (0b1)
#define p24_20 (0b11111)
#define p11_7  (0b11111)
#define simm5  (15)

#define p27_26_overflow (0b100)
#define p26_overflow    (0b10)
#define p24_20_overflow (0b100000)
#define p11_7_overflow  (0b100001)
#define simm5_overflow  (16)

// sf_vc_x_se

void test_sf_vc_x_se_u8mf8_p27_26_not_constant(uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_x_se' must be a constant integer}}
  __riscv_sf_vc_x_se_u8mf8(index, p24_20, p11_7, rs1, vl);
}

void test_sf_vc_x_se_u8mf8_24_20_not_constant(uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_x_se' must be a constant integer}}
  __riscv_sf_vc_x_se_u8mf8(p27_26, index, p11_7, rs1, vl);
}

void test_sf_vc_x_se_u8mf8_11_7_not_constant(uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_x_se' must be a constant integer}}
  __riscv_sf_vc_x_se_u8mf8(p27_26, p24_20, index, rs1, vl);
}

void test_sf_vc_x_se_u8mf8_p27_26_overflow(uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_x_se_u8mf8(p27_26_overflow, p24_20, p11_7, rs1, vl);
}

void test_sf_vc_x_se_u8mf8_p24_20_overflow(uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 32 is outside the valid range [0, 31]}}
  __riscv_sf_vc_x_se_u8mf8(p27_26, p24_20_overflow, p11_7, rs1, vl);
}

void test_sf_vc_x_se_u8mf8_p11_7_overflow(uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 33 is outside the valid range [0, 31]}}
  __riscv_sf_vc_x_se_u8mf8(p27_26, p24_20, p11_7_overflow, rs1, vl);
}

// sf_vc_i_se

void test_sf_vc_i_se_u8mf8_p27_26_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_i_se' must be a constant integer}}
  __riscv_sf_vc_i_se_u8mf8(index, p24_20, p11_7, simm5, vl);
}

void test_sf_vc_i_se_u8mf8_24_20_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_i_se' must be a constant integer}}
  __riscv_sf_vc_i_se_u8mf8(p27_26, index, p11_7, simm5, vl);
}

void test_sf_vc_i_se_u8mf8_11_7_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_i_se' must be a constant integer}}
  __riscv_sf_vc_i_se_u8mf8(p27_26, p24_20, index, simm5, vl);
}

void test_sf_vc_i_se_u8mf8_simm5_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_i_se' must be a constant integer}}
  __riscv_sf_vc_i_se_u8mf8(p27_26, p24_20, p11_7, index, vl);
}

void test_sf_vc_i_se_u8mf8_p27_26_overflow(size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_i_se_u8mf8(p27_26_overflow, p24_20, p11_7, simm5, vl);
}

void test_sf_vc_i_se_u8mf8_p24_20_overflow(size_t vl) {
  // expected-error@+1 {{argument value 32 is outside the valid range [0, 31]}}
  __riscv_sf_vc_i_se_u8mf8(p27_26, p24_20_overflow, p11_7, simm5, vl);
}

void test_sf_vc_i_se_u8mf8_p11_7_overflow(size_t vl) {
  // expected-error@+1 {{argument value 33 is outside the valid range [0, 31]}}
  __riscv_sf_vc_i_se_u8mf8(p27_26, p24_20, p11_7_overflow, simm5, vl);
}

void test_sf_vc_i_se_u8mf8_simm5_overflow(size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  __riscv_sf_vc_i_se_u8mf8(p27_26, p24_20, p11_7, simm5_overflow, vl);
}

// sf_vc_v_x_se

vuint8mf8_t test_sf_vc_v_x_se_u8mf8_p27_26_not_constant(uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_x_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_x_se_u8mf8(index, p24_20, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_x_se_u8mf8_p24_20_not_constant(uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_x_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_x_se_u8mf8(p27_26, index, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_x_se_u8mf8_p27_26_overflow(uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_x_se_u8mf8(p27_26_overflow, p24_20, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_x_se_u8mf8_p24_20_overflow(uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 32 is outside the valid range [0, 31]}}
  return __riscv_sf_vc_v_x_se_u8mf8(p27_26, p24_20_overflow, rs1, vl);
}

// sf_vc_v_x

vuint8mf8_t test_sf_vc_v_x_u8mf8_p27_26_not_constant(uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_x_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_x_u8mf8(index, p24_20, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_x_u8mf8_p24_20_not_constant(uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_x_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_x_u8mf8(p27_26, index, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_x_u8mf8_p27_26_overflow(uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_x_u8mf8(p27_26_overflow, p24_20, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_x_u8mf8_p24_20_overflow(uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 32 is outside the valid range [0, 31]}}
  return __riscv_sf_vc_v_x_u8mf8(p27_26, p24_20_overflow, rs1, vl);
}

// sf_vc_v_i_se

vuint8mf8_t test_sf_vc_v_i_se_u8mf8_p27_26_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_i_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_i_se_u8mf8(index, p24_20, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_se_u8mf8_p24_20_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_i_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_i_se_u8mf8(p27_26, index, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_se_u8mf8_simm5_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_i_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_i_se_u8mf8(p27_26, p24_20, index, vl);
}

vuint8mf8_t test_sf_vc_v_i_se_u8mf8_p27_26_overflow(size_t vl, int index) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_i_se_u8mf8(p27_26_overflow, p24_20, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_se_u8mf8_p24_20_overflow(size_t vl) {
  // expected-error@+1 {{argument value 32 is outside the valid range [0, 31]}}
  return __riscv_sf_vc_v_i_se_u8mf8(p27_26, p24_20_overflow, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_se_u8mf8_simm5_overflow(size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_i_se_u8mf8(p27_26, p24_20, simm5_overflow, vl);
}

// sf_vc_v_i

vuint8mf8_t test_sf_vc_v_i_u8mf8_p27_26_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_i_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_i_u8mf8(index, p24_20, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_u8mf8_p24_20_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_i_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_i_u8mf8(p27_26, index, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_u8mf8_simm5_not_constant(size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_i_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_i_u8mf8(p27_26, p24_20, index, vl);
}

vuint8mf8_t test_sf_vc_v_i_u8mf8_p27_26_overflow(size_t vl, int index) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_i_u8mf8(p27_26_overflow, p24_20, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_u8mf8_p24_20_overflow(size_t vl) {
  // expected-error@+1 {{argument value 32 is outside the valid range [0, 31]}}
  return __riscv_sf_vc_v_i_u8mf8(p27_26, p24_20_overflow, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_i_u8mf8_simm5_overflow(size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_i_u8mf8(p27_26, p24_20, simm5_overflow, vl);
}

// sf_vc_vv_se

void test_sf_vc_vv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_vv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_vv_se_u8mf8(index, p11_7, vs2, vs1, vl);
}

void test_sf_vc_vv_se_u8mf8_p11_7_not_constant(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_vv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_vv_se_u8mf8(p27_26, index, vs2, vs1, vl);
}

void test_sf_vc_vv_se_u8mf8_p27_26_overflow(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_vv_se_u8mf8(p27_26_overflow, p11_7, vs2, vs1, vl);
}

void test_sf_vc_vv_se_u8mf8_p11_7_overflow(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 33 is outside the valid range [0, 31]}}
  __riscv_sf_vc_vv_se_u8mf8(p27_26, p11_7_overflow, vs2, vs1, vl);
}

// sf_vc_xv_se

void test_sf_vc_xv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_xv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_xv_se_u8mf8(index, p11_7, vs2, rs1, vl);
}

void test_sf_vc_xv_se_u8mf8_p11_7_not_constant(vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_xv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_xv_se_u8mf8(p27_26, index, vs2, rs1, vl);
}

void test_sf_vc_xv_se_u8mf8_p27_26_overflow(vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_xv_se_u8mf8(p27_26_overflow, p11_7, vs2, rs1, vl);
}

void test_sf_vc_xv_se_u8mf8_p11_7_overflow(vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 33 is outside the valid range [0, 31]}}
  __riscv_sf_vc_xv_se_u8mf8(p27_26, p11_7_overflow, vs2, rs1, vl);
}

// sf_vc_iv_se

void test_sf_vc_iv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_iv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_iv_se_u8mf8(index, p11_7, vs2, simm5, vl);
}

void test_sf_vc_iv_se_u8mf8_p11_7_not_constant(vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_iv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_iv_se_u8mf8(p27_26, index, vs2, simm5, vl);
}

void test_sf_vc_iv_se_u8mf8_simm5_not_constant(vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_iv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_iv_se_u8mf8(p27_26, p11_7, vs2, index, vl);
}

void test_sf_vc_iv_se_u8mf8_p27_26_overflow(vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_iv_se_u8mf8(p27_26_overflow, p11_7, vs2, simm5, vl);
}

void test_sf_vc_iv_se_u8mf8_p11_7_overflow(vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 33 is outside the valid range [0, 31]}}
  __riscv_sf_vc_iv_se_u8mf8(p27_26, p11_7_overflow, vs2, simm5, vl);
}

void test_sf_vc_iv_se_u8mf8_simm5_overflow(vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  __riscv_sf_vc_iv_se_u8mf8(p27_26, p11_7, vs2, simm5_overflow, vl);
}

// sf_vc_fv_se

void test_sf_vc_fv_se_u16mf4_p26_not_constant(vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_fv_se_u16mf4' must be a constant integer}}
  __riscv_sf_vc_fv_se_u16mf4(index, p11_7, vs2, fs1, vl);
}

void test_sf_vc_fv_se_u16mf4_p11_7_not_constant(vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_fv_se_u16mf4' must be a constant integer}}
  __riscv_sf_vc_fv_se_u16mf4(p26, index, vs2, fs1, vl);
}

void test_sf_vc_fv_se_u16mf4_p26_overflow(vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  __riscv_sf_vc_fv_se_u16mf4(p26_overflow, p11_7, vs2, fs1, vl);
}

void test_sf_vc_fv_se_u16mf4_p11_7_overflow(vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 33 is outside the valid range [0, 31]}}
  __riscv_sf_vc_fv_se_u16mf4(p26, p11_7_overflow, vs2, fs1, vl);
}

// sf_vc_v_vv_se

vuint8mf8_t test_sf_vc_v_vv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_vv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_vv_se_u8mf8(index, vs2, vs1, vl);
}

vuint8mf8_t test_sf_vc_v_vv_se_u8mf8_p27_26_overflow(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_vv_se_u8mf8(p27_26_overflow, vs2, vs1, vl);
}

// sf_vc_v_vv

vuint8mf8_t test_sf_vc_v_vv_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_vv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_vv_u8mf8(index, vs2, vs1, vl);
}

vuint8mf8_t test_sf_vc_v_vv_u8mf8_p27_26_overflow(vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_vv_u8mf8(p27_26_overflow, vs2, vs1, vl);
}

// sf_vc_v_xv_se

vuint8mf8_t test_sf_vc_v_xv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_xv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_xv_se_u8mf8(index, vs2, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_xv_se_u8mf8_p27_26_overflow(vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_xv_se_u8mf8(p27_26_overflow, vs2, rs1, vl);
}

// sf_vc_v_xv

vuint8mf8_t test_sf_vc_v_xv_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_xv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_xv_u8mf8(index, vs2, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_xv_u8mf8_p27_26_overflow(vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_xv_u8mf8(p27_26_overflow, vs2, rs1, vl);
}

// sf_vc_v_iv_se

vuint8mf8_t test_sf_vc_v_iv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_iv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_iv_se_u8mf8(index, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_iv_se_u8mf8_simm5_not_constant(vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_iv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_iv_se_u8mf8(p27_26, vs2, index, vl);
}

vuint8mf8_t test_sf_vc_v_iv_se_u8mf8_p27_26_overflow(vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_iv_se_u8mf8(p27_26_overflow, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_iv_se_u8mf8_simm5_overflow(vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_iv_se_u8mf8(p27_26, vs2, simm5_overflow, vl);
}

// sf_vc_v_iv

vuint8mf8_t test_sf_vc_v_iv_u8mf8_p27_26_not_constant(vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_iv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_iv_u8mf8(index, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_iv_u8mf8_simm5_not_constant(vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_iv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_iv_u8mf8(p27_26, vs2, index, vl);
}

vuint8mf8_t test_sf_vc_v_iv_u8mf8_p27_26_overflow(vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_iv_u8mf8(p27_26_overflow, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_iv_u8mf8_simm5_overflow(vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_iv_u8mf8(p27_26, vs2, simm5_overflow, vl);
}

// sf_vc_v_fv_se

vuint16mf4_t test_sf_vc_v_fv_se_u16mf4_p26_not_constant(vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  //expected-error@+1 {{argument to '__riscv_sf_vc_v_fv_se_u16mf4' must be a constant integer}}
  return __riscv_sf_vc_v_fv_se_u16mf4(index, vs2, fs1, vl);
}

vuint16mf4_t test_sf_vc_v_fv_se_u16mf4_p26_overflow(vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  return __riscv_sf_vc_v_fv_se_u16mf4(p26_overflow, vs2, fs1, vl);
}

// sf_vc_v_fv

vuint16mf4_t test_sf_vc_v_fv_u16mf4_p26_not_constant(vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_fv_se_u16mf4' must be a constant integer}}
  return __riscv_sf_vc_v_fv_se_u16mf4(index, vs2, fs1, vl);
}

vuint16mf4_t test_sf_vc_v_fv_u16mf4_p26_overflow(vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  return __riscv_sf_vc_v_fv_u16mf4(p26_overflow, vs2, fs1, vl);
}

// sf_vc_vvv_se

void test_sf_vc_vvv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_vvv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_vvv_se_u8mf8(index, vd, vs2, vs1, vl);
}

void test_sf_vc_vvv_se_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_vvv_se_u8mf8(p27_26_overflow, vd, vs2, vs1, vl);
}

// sf_vc_xvv_se

void test_sf_vc_xvv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_xvv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_xvv_se_u8mf8(index, vd, vs2, rs1, vl);
}

void test_sf_vc_xvv_se_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_xvv_se_u8mf8(p27_26_overflow, vd, vs2, rs1, vl);
}

// sf_vc_ivv_se

void test_sf_vc_ivv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_ivv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_ivv_se_u8mf8(index, vd, vs2, simm5, vl);
}

void test_sf_vc_ivv_se_u8mf8_simm5_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_ivv_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_ivv_se_u8mf8(p27_26, vd, vs2, index, vl);
}

void test_sf_vc_ivv_se_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_ivv_se_u8mf8(p27_26_overflow, vd, vs2, simm5, vl);
}

void test_sf_vc_ivv_se_u8mf8_simm5_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  __riscv_sf_vc_ivv_se_u8mf8(p27_26, vd, vs2, simm5_overflow, vl);
}

// sf_vc_fvv_se

void test_sf_vc_fvv_se_u16mf4_p26_not_constant(vuint16mf4_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_fvv_se_u16mf4' must be a constant integer}}
  __riscv_sf_vc_fvv_se_u16mf4(index, vd, vs2, fs1, vl);
}

void test_sf_vc_fvv_se_u16mf4_p26_overflow(vuint16mf4_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  __riscv_sf_vc_fvv_se_u16mf4(p26_overflow, vd, vs2, fs1, vl);
}

// sf_vc_v_vvv_se

vuint8mf8_t test_sf_vc_v_vvv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_vvv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_vvv_se_u8mf8(index, vd, vs2, vs1, vl);
}

vuint8mf8_t test_sf_vc_v_vvv_se_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_vvv_se_u8mf8(p27_26_overflow, vd, vs2, vs1, vl);
}

// sf_vc_v_vvv

vuint8mf8_t test_sf_vc_v_vvv_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_vvv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_vvv_u8mf8(index, vd, vs2, vs1, vl);
}

vuint8mf8_t test_sf_vc_v_vvv_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_vvv_u8mf8(p27_26_overflow, vd, vs2, vs1, vl);
}

// sf_vc_v_xvv_se

vuint8mf8_t test_sf_vc_v_xvv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_xvv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_xvv_se_u8mf8(index, vd, vs2, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_xvv_se_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_xvv_se_u8mf8(p27_26_overflow, vd, vs2, rs1, vl);
}

// sf_vc_v_xvv

vuint8mf8_t test_sf_vc_v_xvv_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_xvv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_xvv_u8mf8(index, vd, vs2, rs1, vl);
}

vuint8mf8_t test_sf_vc_v_xvv_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_xvv_u8mf8(p27_26_overflow, vd, vs2, rs1, vl);
}

// sf_vc_v_ivv_se

vuint8mf8_t test_sf_vc_v_ivv_se_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivv_se_u8mf8(index, vd, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_ivv_se_u8mf8_simm5_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivv_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivv_se_u8mf8(p27_26, vd, vs2, index, vl);
}

vuint8mf8_t test_sf_vc_v_ivv_se_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_ivv_se_u8mf8(p27_26_overflow, vd, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_ivv_se_u8mf8_simm5_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_ivv_se_u8mf8(p27_26, vd, vs2, simm5_overflow, vl);
}

// sf_vc_v_ivv

vuint8mf8_t test_sf_vc_v_ivv_u8mf8_p27_26_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivv_u8mf8(index, vd, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_ivv_u8mf8_simm5_not_constant(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivv_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivv_u8mf8(p27_26, vd, vs2, index, vl);
}

vuint8mf8_t test_sf_vc_v_ivv_u8mf8_p27_26_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_ivv_u8mf8(p27_26_overflow, vd, vs2, simm5, vl);
}

vuint8mf8_t test_sf_vc_v_ivv_u8mf8_simm5_overflow(vuint8mf8_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_ivv_u8mf8(p27_26, vd, vs2, simm5_overflow, vl);
}

// sf_vc_v_fvv_se

vuint16mf4_t test_sf_vc_v_fvv_se_u16mf4_p26_not_constant(vuint16mf4_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_fvv_se_u16mf4' must be a constant integer}}
  return __riscv_sf_vc_v_fvv_se_u16mf4(index, vd, vs2, fs1, vl);
}

vuint16mf4_t test_sf_vc_v_fvv_se_u16mf4_p26_overflow(vuint16mf4_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  return __riscv_sf_vc_v_fvv_se_u16mf4(p26_overflow, vd, vs2, fs1, vl);
}

// sf_vc_v_fvv

vuint16mf4_t test_sf_vc_v_fvv_u16mf4_p26_not_constant(vuint16mf4_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_fvv_u16mf4' must be a constant integer}}
  return __riscv_sf_vc_v_fvv_u16mf4(index, vd, vs2, fs1, vl);
}

vuint16mf4_t test_sf_vc_v_fvv_u16mf4_p26_overflow(vuint16mf4_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  return __riscv_sf_vc_v_fvv_u16mf4(p26_overflow, vd, vs2, fs1, vl);
}

// sf_vc_vvw_se

void test_sf_vc_vvw_se_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_vvw_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_vvw_se_u8mf8(index, vd, vs2, vs1, vl);
}

void test_sf_vc_vvw_se_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_vvw_se_u8mf8(p27_26_overflow, vd, vs2, vs1, vl);
}

// sf_vc_xvw_se

void test_sf_vc_xvw_se_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_xvw_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_xvw_se_u8mf8(index, vd, vs2, rs1, vl);
}

void test_sf_vc_xvw_se_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_xvw_se_u8mf8(p27_26_overflow, vd, vs2, rs1, vl);
}

// sf_vc_ivw_se

void test_sf_vc_ivw_se_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_ivw_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_ivw_se_u8mf8(index, vd, vs2, simm5, vl);
}

void test_sf_vc_ivw_se_u8mf8_simm5_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_ivw_se_u8mf8' must be a constant integer}}
  __riscv_sf_vc_ivw_se_u8mf8(p27_26, vd, vs2, index, vl);
}

void test_sf_vc_ivw_se_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  __riscv_sf_vc_ivw_se_u8mf8(p27_26_overflow, vd, vs2, simm5, vl);
}

void test_sf_vc_ivw_se_u8mf8_simm5_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  __riscv_sf_vc_ivw_se_u8mf8(p27_26, vd, vs2, simm5_overflow, vl);
}

// sf_vc_fvw_se

void test_sf_vc_fvw_se_u16mf4_p26_not_constant(vuint32mf2_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_fvw_se_u16mf4' must be a constant integer}}
  __riscv_sf_vc_fvw_se_u16mf4(index, vd, vs2, fs1, vl);
}

void test_sf_vc_fvw_se_u16mf4_p26_overflow(vuint32mf2_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  __riscv_sf_vc_fvw_se_u16mf4(p26_overflow, vd, vs2, fs1, vl);
}

// sf_vc_v_vvw_se

vuint16mf4_t test_sf_vc_v_vvw_se_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_vvw_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_vvw_se_u8mf8(index, vd, vs2, vs1, vl);
}

vuint16mf4_t test_sf_vc_v_vvw_se_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_vvw_se_u8mf8(p27_26_overflow, vd, vs2, vs1, vl);
}

// sf_vc_v_vvw

vuint16mf4_t test_sf_vc_v_vvw_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_vvw_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_vvw_u8mf8(index, vd, vs2, vs1, vl);
}

vuint16mf4_t test_sf_vc_v_vvw_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, vuint8mf8_t vs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_vvw_u8mf8(p27_26_overflow, vd, vs2, vs1, vl);
}

// sf_vc_v_xvw_se

vuint16mf4_t test_sf_vc_v_xvw_se_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_xvw_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_xvw_se_u8mf8(index, vd, vs2, rs1, vl);
}

vuint16mf4_t test_sf_vc_v_xvw_se_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_xvw_se_u8mf8(p27_26_overflow, vd, vs2, rs1, vl);
}

// sf_vc_v_xvw

vuint16mf4_t test_sf_vc_v_xvw_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_xvw_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_xvw_u8mf8(index, vd, vs2, rs1, vl);
}

vuint16mf4_t test_sf_vc_v_xvw_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, uint8_t rs1, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_xvw_u8mf8(p27_26_overflow, vd, vs2, rs1, vl);
}

// sf_vc_v_ivw_se

vuint16mf4_t test_sf_vc_v_ivw_se_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivw_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivw_se_u8mf8(index, vd, vs2, simm5, vl);
}

vuint16mf4_t test_sf_vc_v_ivw_se_u8mf8_simm5_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivw_se_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivw_se_u8mf8(p27_26, vd, vs2, index, vl);
}

vuint16mf4_t test_sf_vc_v_ivw_se_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_ivw_se_u8mf8(p27_26_overflow, vd, vs2, simm5, vl);
}

vuint16mf4_t test_sf_vc_v_ivw_se_u8mf8_simm5_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_ivw_se_u8mf8(p27_26, vd, vs2, simm5_overflow, vl);
}

// sf_vc_v_ivw

vuint16mf4_t test_sf_vc_v_ivw_u8mf8_p27_26_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivw_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivw_u8mf8(index, vd, vs2, simm5, vl);
}

vuint16mf4_t test_sf_vc_v_ivw_u8mf8_simm5_not_constant(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_ivw_u8mf8' must be a constant integer}}
  return __riscv_sf_vc_v_ivw_u8mf8(p27_26, vd, vs2, index, vl);
}

vuint16mf4_t test_sf_vc_v_ivw_u8mf8_p27_26_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 4 is outside the valid range [0, 3]}}
  return __riscv_sf_vc_v_ivw_u8mf8(p27_26_overflow, vd, vs2, simm5, vl);
}

vuint16mf4_t test_sf_vc_v_ivw_u8mf8_simm5_overflow(vuint16mf4_t vd, vuint8mf8_t vs2, size_t vl) {
  // expected-error@+1 {{argument value 16 is outside the valid range [-16, 15]}}
  return __riscv_sf_vc_v_ivw_u8mf8(p27_26, vd, vs2, simm5_overflow, vl);
}

// sf_vc_v_fvw_se

vuint32mf2_t test_sf_vc_v_fvw_se_u16mf4_p26_not_constant(vuint32mf2_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_fvw_se_u16mf4' must be a constant integer}}
  return __riscv_sf_vc_v_fvw_se_u16mf4(index, vd, vs2, fs1, vl);
}

vuint32mf2_t test_sf_vc_v_fvw_se_u16mf4_p26_overflow(vuint32mf2_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  return __riscv_sf_vc_v_fvw_se_u16mf4(p26_overflow, vd, vs2, fs1, vl);
}

// sf_vc_v_fvw

vuint32mf2_t test_sf_vc_v_fvw_u16mf4_p26_not_constant(vuint32mf2_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl, int index) {
  // expected-error@+1 {{argument to '__riscv_sf_vc_v_fvw_u16mf4' must be a constant integer}}
  return __riscv_sf_vc_v_fvw_u16mf4(index, vd, vs2, fs1, vl);
}

vuint32mf2_t test_sf_vc_v_fvw_u16mf4_p26_overflow(vuint32mf2_t vd, vuint16mf4_t vs2, _Float16 fs1, size_t vl) {
  // expected-error@+1 {{argument value 2 is outside the valid range [0, 1]}}
  return __riscv_sf_vc_v_fvw_u16mf4(p26_overflow, vd, vs2, fs1, vl);
}