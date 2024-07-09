; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

declare void @use32(i32)
declare void @use64(i64)

define i1 @highest_bit_test_via_lshr(i32 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_lshr(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 32, [[NBITS:%.*]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = lshr i32 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP]]
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = lshr i32 [[DATA]], 31
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 32, %nbits
  %high_bits_extracted = lshr i32 %data, %num_low_bits_to_skip
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = lshr i32 %high_bits_extracted, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use32(i32 %high_bits_extracted)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

define i1 @highest_bit_test_via_lshr_with_truncation(i64 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_lshr_with_truncation(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 64, [[NBITS:%.*]]
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP_WIDE:%.*]] = zext i32 [[NUM_LOW_BITS_TO_SKIP]] to i64
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = lshr i64 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP_WIDE]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED_NARROW:%.*]] = trunc i64 [[HIGH_BITS_EXTRACTED]] to i32
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = lshr i32 [[HIGH_BITS_EXTRACTED_NARROW]], [[SKIP_ALL_BITS_TILL_SIGNBIT]]
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use64(i64 [[NUM_LOW_BITS_TO_SKIP_WIDE]])
; CHECK-NEXT:    call void @use64(i64 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED_NARROW]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 64, %nbits
  %num_low_bits_to_skip_wide = zext i32 %num_low_bits_to_skip to i64
  %high_bits_extracted = lshr i64 %data, %num_low_bits_to_skip_wide
  %high_bits_extracted_narrow = trunc i64 %high_bits_extracted to i32
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = lshr i32 %high_bits_extracted_narrow, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use64(i64 %num_low_bits_to_skip_wide)
  call void @use64(i64 %high_bits_extracted)
  call void @use32(i32 %high_bits_extracted_narrow)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

define i1 @highest_bit_test_via_ashr(i32 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_ashr(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 32, [[NBITS:%.*]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = ashr i32 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP]]
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = ashr i32 [[DATA]], 31
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 32, %nbits
  %high_bits_extracted = ashr i32 %data, %num_low_bits_to_skip
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = ashr i32 %high_bits_extracted, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use32(i32 %high_bits_extracted)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

define i1 @highest_bit_test_via_ashr_with_truncation(i64 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_ashr_with_truncation(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 64, [[NBITS:%.*]]
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP_WIDE:%.*]] = zext i32 [[NUM_LOW_BITS_TO_SKIP]] to i64
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = ashr i64 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP_WIDE]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED_NARROW:%.*]] = trunc i64 [[HIGH_BITS_EXTRACTED]] to i32
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = ashr i32 [[HIGH_BITS_EXTRACTED_NARROW]], [[SKIP_ALL_BITS_TILL_SIGNBIT]]
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use64(i64 [[NUM_LOW_BITS_TO_SKIP_WIDE]])
; CHECK-NEXT:    call void @use64(i64 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED_NARROW]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 64, %nbits
  %num_low_bits_to_skip_wide = zext i32 %num_low_bits_to_skip to i64
  %high_bits_extracted = ashr i64 %data, %num_low_bits_to_skip_wide
  %high_bits_extracted_narrow = trunc i64 %high_bits_extracted to i32
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = ashr i32 %high_bits_extracted_narrow, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use64(i64 %num_low_bits_to_skip_wide)
  call void @use64(i64 %high_bits_extracted)
  call void @use32(i32 %high_bits_extracted_narrow)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

define i1 @highest_bit_test_via_lshr_ashr(i32 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_lshr_ashr(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 32, [[NBITS:%.*]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = lshr i32 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP]]
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = ashr i32 [[HIGH_BITS_EXTRACTED]], [[SKIP_ALL_BITS_TILL_SIGNBIT]]
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 32, %nbits
  %high_bits_extracted = lshr i32 %data, %num_low_bits_to_skip
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = ashr i32 %high_bits_extracted, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use32(i32 %high_bits_extracted)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

define i1 @highest_bit_test_via_lshr_ashe_with_truncation(i64 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_lshr_ashe_with_truncation(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 64, [[NBITS:%.*]]
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP_WIDE:%.*]] = zext i32 [[NUM_LOW_BITS_TO_SKIP]] to i64
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = lshr i64 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP_WIDE]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED_NARROW:%.*]] = trunc i64 [[HIGH_BITS_EXTRACTED]] to i32
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = ashr i32 [[HIGH_BITS_EXTRACTED_NARROW]], [[SKIP_ALL_BITS_TILL_SIGNBIT]]
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use64(i64 [[NUM_LOW_BITS_TO_SKIP_WIDE]])
; CHECK-NEXT:    call void @use64(i64 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED_NARROW]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 64, %nbits
  %num_low_bits_to_skip_wide = zext i32 %num_low_bits_to_skip to i64
  %high_bits_extracted = lshr i64 %data, %num_low_bits_to_skip_wide
  %high_bits_extracted_narrow = trunc i64 %high_bits_extracted to i32
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = ashr i32 %high_bits_extracted_narrow, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use64(i64 %num_low_bits_to_skip_wide)
  call void @use64(i64 %high_bits_extracted)
  call void @use32(i32 %high_bits_extracted_narrow)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

define i1 @highest_bit_test_via_ashr_lshr(i32 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_ashr_lshr(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 32, [[NBITS:%.*]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = ashr i32 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP]]
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = lshr i32 [[HIGH_BITS_EXTRACTED]], [[SKIP_ALL_BITS_TILL_SIGNBIT]]
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 32, %nbits
  %high_bits_extracted = ashr i32 %data, %num_low_bits_to_skip
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = lshr i32 %high_bits_extracted, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use32(i32 %high_bits_extracted)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

define i1 @highest_bit_test_via_ashr_lshr_with_truncation(i64 %data, i32 %nbits) {
; CHECK-LABEL: @highest_bit_test_via_ashr_lshr_with_truncation(
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP:%.*]] = sub i32 64, [[NBITS:%.*]]
; CHECK-NEXT:    [[NUM_LOW_BITS_TO_SKIP_WIDE:%.*]] = zext i32 [[NUM_LOW_BITS_TO_SKIP]] to i64
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED:%.*]] = ashr i64 [[DATA:%.*]], [[NUM_LOW_BITS_TO_SKIP_WIDE]]
; CHECK-NEXT:    [[HIGH_BITS_EXTRACTED_NARROW:%.*]] = trunc i64 [[HIGH_BITS_EXTRACTED]] to i32
; CHECK-NEXT:    [[SKIP_ALL_BITS_TILL_SIGNBIT:%.*]] = add i32 [[NBITS]], -1
; CHECK-NEXT:    [[SIGNBIT:%.*]] = lshr i32 [[HIGH_BITS_EXTRACTED_NARROW]], [[SKIP_ALL_BITS_TILL_SIGNBIT]]
; CHECK-NEXT:    call void @use32(i32 [[NUM_LOW_BITS_TO_SKIP]])
; CHECK-NEXT:    call void @use64(i64 [[NUM_LOW_BITS_TO_SKIP_WIDE]])
; CHECK-NEXT:    call void @use64(i64 [[HIGH_BITS_EXTRACTED]])
; CHECK-NEXT:    call void @use32(i32 [[HIGH_BITS_EXTRACTED_NARROW]])
; CHECK-NEXT:    call void @use32(i32 [[SKIP_ALL_BITS_TILL_SIGNBIT]])
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[DATA]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %num_low_bits_to_skip = sub i32 64, %nbits
  %num_low_bits_to_skip_wide = zext i32 %num_low_bits_to_skip to i64
  %high_bits_extracted = ashr i64 %data, %num_low_bits_to_skip_wide
  %high_bits_extracted_narrow = trunc i64 %high_bits_extracted to i32
  %skip_all_bits_till_signbit = sub i32 %nbits, 1
  %signbit = lshr i32 %high_bits_extracted_narrow, %skip_all_bits_till_signbit

  call void @use32(i32 %num_low_bits_to_skip)
  call void @use64(i64 %num_low_bits_to_skip_wide)
  call void @use64(i64 %high_bits_extracted)
  call void @use32(i32 %high_bits_extracted_narrow)
  call void @use32(i32 %skip_all_bits_till_signbit)
  call void @use32(i32 %signbit)

  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}

;------------------------------------------------------------------------------;

define i1 @unsigned_sign_bit_extract(i32 %x) {
; CHECK-LABEL: @unsigned_sign_bit_extract(
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[X:%.*]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signbit = lshr i32 %x, 31
  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}
define i1 @unsigned_sign_bit_extract_extrause(i32 %x) {
; CHECK-LABEL: @unsigned_sign_bit_extract_extrause(
; CHECK-NEXT:    [[SIGNBIT:%.*]] = lshr i32 [[X:%.*]], 31
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[X]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signbit = lshr i32 %x, 31
  call void @use32(i32 %signbit)
  %isneg = icmp ne i32 %signbit, 0
  ret i1 %isneg
}
define i1 @unsigned_sign_bit_extract_extrause__ispositive(i32 %x) {
; CHECK-LABEL: @unsigned_sign_bit_extract_extrause__ispositive(
; CHECK-NEXT:    [[SIGNBIT:%.*]] = lshr i32 [[X:%.*]], 31
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp sgt i32 [[X]], -1
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signbit = lshr i32 %x, 31
  call void @use32(i32 %signbit)
  %isneg = icmp eq i32 %signbit, 0
  ret i1 %isneg
}
define i1 @signed_sign_bit_extract(i32 %x) {
; CHECK-LABEL: @signed_sign_bit_extract(
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[X:%.*]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signsmear = ashr i32 %x, 31
  %isneg = icmp ne i32 %signsmear, 0
  ret i1 %isneg
}
define i1 @signed_sign_bit_extract_extrause(i32 %x) {
; CHECK-LABEL: @signed_sign_bit_extract_extrause(
; CHECK-NEXT:    [[SIGNSMEAR:%.*]] = ashr i32 [[X:%.*]], 31
; CHECK-NEXT:    call void @use32(i32 [[SIGNSMEAR]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i32 [[X]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signsmear = ashr i32 %x, 31
  call void @use32(i32 %signsmear)
  %isneg = icmp ne i32 %signsmear, 0
  ret i1 %isneg
}
define i1 @unsigned_sign_bit_extract_with_trunc(i64 %x) {
; CHECK-LABEL: @unsigned_sign_bit_extract_with_trunc(
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[X:%.*]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signbit = lshr i64 %x, 63
  %signbit_narrow = trunc i64 %signbit to i32
  %isneg = icmp ne i32 %signbit_narrow, 0
  ret i1 %isneg
}
define i1 @unsigned_sign_bit_extract_with_trunc_extrause(i64 %x) {
; CHECK-LABEL: @unsigned_sign_bit_extract_with_trunc_extrause(
; CHECK-NEXT:    [[SIGNBIT:%.*]] = lshr i64 [[X:%.*]], 63
; CHECK-NEXT:    call void @use64(i64 [[SIGNBIT]])
; CHECK-NEXT:    [[SIGNBIT_NARROW:%.*]] = trunc nuw nsw i64 [[SIGNBIT]] to i32
; CHECK-NEXT:    call void @use32(i32 [[SIGNBIT_NARROW]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[X]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signbit = lshr i64 %x, 63
  call void @use64(i64 %signbit)
  %signbit_narrow = trunc i64 %signbit to i32
  call void @use32(i32 %signbit_narrow)
  %isneg = icmp ne i32 %signbit_narrow, 0
  ret i1 %isneg
}
define i1 @signed_sign_bit_extract_trunc(i64 %x) {
; CHECK-LABEL: @signed_sign_bit_extract_trunc(
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[X:%.*]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signsmear = ashr i64 %x, 63
  %signsmear_narrow = trunc i64 %signsmear to i32
  %isneg = icmp ne i32 %signsmear_narrow, 0
  ret i1 %isneg
}
define i1 @signed_sign_bit_extract_trunc_extrause(i64 %x) {
; CHECK-LABEL: @signed_sign_bit_extract_trunc_extrause(
; CHECK-NEXT:    [[SIGNSMEAR:%.*]] = ashr i64 [[X:%.*]], 63
; CHECK-NEXT:    call void @use64(i64 [[SIGNSMEAR]])
; CHECK-NEXT:    [[SIGNSMEAR_NARROW:%.*]] = trunc nsw i64 [[SIGNSMEAR]] to i32
; CHECK-NEXT:    call void @use32(i32 [[SIGNSMEAR_NARROW]])
; CHECK-NEXT:    [[ISNEG:%.*]] = icmp slt i64 [[X]], 0
; CHECK-NEXT:    ret i1 [[ISNEG]]
;
  %signsmear = ashr i64 %x, 63
  call void @use64(i64 %signsmear)
  %signsmear_narrow = trunc i64 %signsmear to i32
  call void @use32(i32 %signsmear_narrow)
  %isneg = icmp ne i32 %signsmear_narrow, 0
  ret i1 %isneg
}