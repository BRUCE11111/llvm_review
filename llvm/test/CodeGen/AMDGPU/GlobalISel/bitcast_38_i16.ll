; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 4
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx900 -verify-machineinstrs < %s | FileCheck -check-prefixes=GCN,GPRIDX %s
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=fiji -verify-machineinstrs < %s | FileCheck -check-prefixes=GCN,MOVREL %s
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx1010 -verify-machineinstrs < %s | FileCheck -check-prefixes=GFX10PLUS,GFX10 %s
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx1100 -amdgpu-enable-delay-alu=0 -verify-machineinstrs < %s | FileCheck -check-prefixes=GFX10PLUS,GFX11 %s
define void @main(<19 x i32> %arg) {
; GCN-LABEL: main:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GCN-NEXT:    s_mov_b32 s4, 0
; GCN-NEXT:    s_mov_b32 s12, s4
; GCN-NEXT:    v_cmp_eq_u16_e32 vcc, 0, v0
; GCN-NEXT:    v_mov_b32_e32 v1, 0
; GCN-NEXT:    s_mov_b32 s13, s4
; GCN-NEXT:    v_mov_b32_e32 v4, s12
; GCN-NEXT:    s_mov_b32 s5, s4
; GCN-NEXT:    s_mov_b32 s6, s4
; GCN-NEXT:    s_mov_b32 s7, s4
; GCN-NEXT:    s_mov_b32 s8, s4
; GCN-NEXT:    s_mov_b32 s9, s4
; GCN-NEXT:    s_mov_b32 s10, s4
; GCN-NEXT:    s_mov_b32 s11, s4
; GCN-NEXT:    v_cndmask_b32_e64 v0, 0, 1, vcc
; GCN-NEXT:    v_mov_b32_e32 v2, v1
; GCN-NEXT:    v_mov_b32_e32 v3, v1
; GCN-NEXT:    v_mov_b32_e32 v5, s13
; GCN-NEXT:    image_store v[0:3], v[4:5], s[4:11] unorm
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: main:
; GFX10:       ; %bb.0: ; %bb
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_mov_b32 s4, 0
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    v_cmp_eq_u16_e32 vcc_lo, 0, v0
; GFX10-NEXT:    s_mov_b32 s10, s4
; GFX10-NEXT:    s_mov_b32 s11, s4
; GFX10-NEXT:    v_mov_b32_e32 v4, s10
; GFX10-NEXT:    v_mov_b32_e32 v2, v1
; GFX10-NEXT:    v_cndmask_b32_e64 v0, 0, 1, vcc_lo
; GFX10-NEXT:    v_mov_b32_e32 v3, v1
; GFX10-NEXT:    v_mov_b32_e32 v5, s11
; GFX10-NEXT:    s_mov_b32 s5, s4
; GFX10-NEXT:    s_mov_b32 s6, s4
; GFX10-NEXT:    s_mov_b32 s7, s4
; GFX10-NEXT:    s_mov_b32 s8, s4
; GFX10-NEXT:    s_mov_b32 s9, s4
; GFX10-NEXT:    image_store v[0:3], v[4:5], s[4:11] dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: main:
; GFX11:       ; %bb.0: ; %bb
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_mov_b32 s0, 0
; GFX11-NEXT:    v_cmp_eq_u16_e32 vcc_lo, 0, v0
; GFX11-NEXT:    s_mov_b32 s6, s0
; GFX11-NEXT:    s_mov_b32 s7, s0
; GFX11-NEXT:    v_dual_mov_b32 v1, 0 :: v_dual_mov_b32 v4, s6
; GFX11-NEXT:    v_cndmask_b32_e64 v0, 0, 1, vcc_lo
; GFX11-NEXT:    v_mov_b32_e32 v5, s7
; GFX11-NEXT:    s_mov_b32 s1, s0
; GFX11-NEXT:    v_mov_b32_e32 v2, v1
; GFX11-NEXT:    v_mov_b32_e32 v3, v1
; GFX11-NEXT:    s_mov_b32 s2, s0
; GFX11-NEXT:    s_mov_b32 s3, s0
; GFX11-NEXT:    s_mov_b32 s4, s0
; GFX11-NEXT:    s_mov_b32 s5, s0
; GFX11-NEXT:    image_store v[0:3], v[4:5], s[0:7] dim:SQ_RSRC_IMG_2D unorm
; GFX11-NEXT:    s_setpc_b64 s[30:31]
bb:
  %i = bitcast <19 x i32> %arg to <38 x i16>
  %i1 = extractelement <38 x i16> %i, i64 0
  %i2 = icmp eq i16 %i1, 0
  %i3 = zext i1 %i2 to i32
  %i4 = bitcast i32 %i3 to float
  %i5 = insertelement <4 x float> zeroinitializer, float %i4, i64 0
  call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %i5, i32 0, i32 0, i32 0, <8 x i32> zeroinitializer, i32 0, i32 0)
  ret void
}
declare void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg)
;; NOTE: These prefixes are unused and the list is autogenerated. Do not add tests below this line:
; GFX10PLUS: {{.*}}
; GPRIDX: {{.*}}
; MOVREL: {{.*}}