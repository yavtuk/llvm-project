; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 4
; RUN: llc -mtriple=aarch64-none-linux-gnu %s -o - | FileCheck %s --check-prefixes=CHECK,CHECK-SD
; RUN: llc -mtriple=aarch64-none-linux-gnu -global-isel %s -o - | FileCheck %s --check-prefixes=CHECK,CHECK-GI

; ===== Legal Vector Types =====

define <8 x i8> @shufflevector_v8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-SD-LABEL: shufflevector_v8i8:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-SD-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-SD-NEXT:    adrp x8, .LCPI0_0
; CHECK-SD-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-SD-NEXT:    ldr d1, [x8, :lo12:.LCPI0_0]
; CHECK-SD-NEXT:    tbl v0.8b, { v0.16b }, v1.8b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v8i8:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-GI-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-GI-NEXT:    adrp x8, .LCPI0_0
; CHECK-GI-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-GI-NEXT:    ldr d1, [x8, :lo12:.LCPI0_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b }, v1.16b
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 8, i32 10, i32 12, i32 15>
    ret <8 x i8> %c
}

define <16 x i8> @shufflevector_v16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-SD-LABEL: shufflevector_v16i8:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    adrp x8, .LCPI1_0
; CHECK-SD-NEXT:    // kill: def $q1 killed $q1 killed $q0_q1 def $q0_q1
; CHECK-SD-NEXT:    ldr q2, [x8, :lo12:.LCPI1_0]
; CHECK-SD-NEXT:    // kill: def $q0 killed $q0 killed $q0_q1 def $q0_q1
; CHECK-SD-NEXT:    tbl v0.16b, { v0.16b, v1.16b }, v2.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v16i8:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    adrp x8, .LCPI1_0
; CHECK-GI-NEXT:    // kill: def $q0 killed $q0 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    ldr q2, [x8, :lo12:.LCPI1_0]
; CHECK-GI-NEXT:    // kill: def $q1 killed $q1 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b, v1.16b }, v2.16b
; CHECK-GI-NEXT:    ret
    %c = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 8, i32 10, i32 12, i32 15, i32 2, i32 4, i32 6, i32 8, i32 25, i32 30, i32 31, i32 31>
    ret <16 x i8> %c
}

define <4 x i16> @shufflevector_v4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: shufflevector_v4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uzp2 v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
    %c = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
    ret <4 x i16> %c
}

define <8 x i16> @shufflevector_v8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-SD-LABEL: shufflevector_v8i16:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    adrp x8, .LCPI3_0
; CHECK-SD-NEXT:    // kill: def $q1 killed $q1 killed $q0_q1 def $q0_q1
; CHECK-SD-NEXT:    ldr q2, [x8, :lo12:.LCPI3_0]
; CHECK-SD-NEXT:    // kill: def $q0 killed $q0 killed $q0_q1 def $q0_q1
; CHECK-SD-NEXT:    tbl v0.16b, { v0.16b, v1.16b }, v2.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v8i16:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    adrp x8, .LCPI3_0
; CHECK-GI-NEXT:    // kill: def $q0 killed $q0 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    ldr q2, [x8, :lo12:.LCPI3_0]
; CHECK-GI-NEXT:    // kill: def $q1 killed $q1 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b, v1.16b }, v2.16b
; CHECK-GI-NEXT:    ret
    %c = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 8, i32 10, i32 12, i32 15>
    ret <8 x i16> %c
}

define <2 x i32> @shufflevector_v2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: shufflevector_v2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    zip2 v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
    %c = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 3>
    ret <2 x i32> %c
}

define <4 x i32> @shufflevector_v4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: shufflevector_v4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uzp2 v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
    %c = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
    ret <4 x i32> %c
}

define <2 x i64> @shufflevector_v2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: shufflevector_v2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    zip2 v0.2d, v0.2d, v1.2d
; CHECK-NEXT:    ret
    %c = shufflevector <2 x i64> %a, <2 x i64> %b, <2 x i32> <i32 1, i32 3>
    ret <2 x i64> %c
}

define <2 x ptr> @shufflevector_v2p0(<2 x ptr> %a, <2 x ptr> %b) {
; CHECK-LABEL: shufflevector_v2p0:
; CHECK:       // %bb.0:
; CHECK-NEXT:    zip2 v0.2d, v0.2d, v1.2d
; CHECK-NEXT:    ret
    %c = shufflevector <2 x ptr> %a, <2 x ptr> %b, <2 x i32> <i32 1, i32 3>
    ret <2 x ptr> %c
}

; ===== Legal Vector Types with Zero Masks =====

define <8 x i8> @shufflevector_v8i8_zeroes(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: shufflevector_v8i8_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    dup v0.8b, v0.b[0]
; CHECK-NEXT:    ret
    %c = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <8 x i8> %c
}

define <16 x i8> @shufflevector_v16i8_zeroes(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: shufflevector_v16i8_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.16b, v0.b[0]
; CHECK-NEXT:    ret
    %c = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <16 x i8> %c
}

define <4 x i16> @shufflevector_v4i16_zeroes(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: shufflevector_v4i16_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    dup v0.4h, v0.h[0]
; CHECK-NEXT:    ret
    %c = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
    ret <4 x i16> %c
}

define <8 x i16> @shufflevector_v8i16_zeroes(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: shufflevector_v8i16_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.8h, v0.h[0]
; CHECK-NEXT:    ret
    %c = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <8 x i16> %c
}

define <2 x i32> @shufflevector_v2i32_zeroes(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: shufflevector_v2i32_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    dup v0.2s, v0.s[0]
; CHECK-NEXT:    ret
    %c = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 0, i32 0>
    ret <2 x i32> %c
}

define <4 x i32> @shufflevector_v4i32_zeroes(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: shufflevector_v4i32_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.4s, v0.s[0]
; CHECK-NEXT:    ret
    %c = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
    ret <4 x i32> %c
}

define <2 x i64> @shufflevector_v2i64_zeroes(<2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: shufflevector_v2i64_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.2d, v0.d[0]
; CHECK-NEXT:    ret
    %c = shufflevector <2 x i64> %a, <2 x i64> %b, <2 x i32> <i32 0, i32 0>
    ret <2 x i64> %c
}

define <2 x ptr> @shufflevector_v2p0_zeroes(<2 x ptr> %a, <2 x ptr> %b) {
; CHECK-LABEL: shufflevector_v2p0_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.2d, v0.d[0]
; CHECK-NEXT:    ret
    %c = shufflevector <2 x ptr> %a, <2 x ptr> %b, <2 x i32> <i32 0, i32 0>
    ret <2 x ptr> %c
}

; ===== Smaller/Larger Width Vectors with Legal Element Sizes =====

define <2 x i1> @shufflevector_v2i1(<2 x i1> %a, <2 x i1> %b){
; CHECK-SD-LABEL: shufflevector_v2i1:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-SD-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-SD-NEXT:    mov v0.s[1], v1.s[1]
; CHECK-SD-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v2i1:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-GI-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-GI-NEXT:    mov w8, v0.s[1]
; CHECK-GI-NEXT:    mov w9, v1.s[1]
; CHECK-GI-NEXT:    mov v0.b[1], w8
; CHECK-GI-NEXT:    mov v1.b[1], w9
; CHECK-GI-NEXT:    mov v0.b[1], v1.b[1]
; CHECK-GI-NEXT:    umov w8, v0.b[0]
; CHECK-GI-NEXT:    umov w9, v0.b[1]
; CHECK-GI-NEXT:    fmov s0, w8
; CHECK-GI-NEXT:    mov v0.s[1], w9
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <2 x i1> %a, <2 x i1> %b, <2 x i32> <i32 0, i32 3>
    ret <2 x i1> %c
}

define i32 @shufflevector_v4i8(<4 x i8> %a, <4 x i8> %b){
; CHECK-SD-LABEL: shufflevector_v4i8:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    sub sp, sp, #16
; CHECK-SD-NEXT:    .cfi_def_cfa_offset 16
; CHECK-SD-NEXT:    ext v0.8b, v1.8b, v0.8b, #6
; CHECK-SD-NEXT:    zip1 v1.4h, v1.4h, v0.4h
; CHECK-SD-NEXT:    ext v0.8b, v0.8b, v1.8b, #4
; CHECK-SD-NEXT:    uzp1 v0.8b, v0.8b, v0.8b
; CHECK-SD-NEXT:    fmov w0, s0
; CHECK-SD-NEXT:    add sp, sp, #16
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v4i8:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    uzp1 v0.8b, v0.8b, v0.8b
; CHECK-GI-NEXT:    adrp x8, .LCPI17_0
; CHECK-GI-NEXT:    uzp1 v1.8b, v1.8b, v0.8b
; CHECK-GI-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-GI-NEXT:    ldr d1, [x8, :lo12:.LCPI17_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b }, v1.16b
; CHECK-GI-NEXT:    fmov w0, s0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <4 x i8> %a, <4 x i8> %b, <4 x i32> <i32 1, i32 2, i32 4, i32 7>
    %d = bitcast <4 x i8> %c to i32
    ret i32 %d
}

define <32 x i8> @shufflevector_v32i8(<32 x i8> %a, <32 x i8> %b){
; CHECK-SD-LABEL: shufflevector_v32i8:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    // kill: def $q2 killed $q2 def $q1_q2
; CHECK-SD-NEXT:    adrp x8, .LCPI18_0
; CHECK-SD-NEXT:    adrp x9, .LCPI18_1
; CHECK-SD-NEXT:    mov v1.16b, v0.16b
; CHECK-SD-NEXT:    ldr q3, [x8, :lo12:.LCPI18_0]
; CHECK-SD-NEXT:    ldr q4, [x9, :lo12:.LCPI18_1]
; CHECK-SD-NEXT:    tbl v0.16b, { v1.16b, v2.16b }, v3.16b
; CHECK-SD-NEXT:    tbl v1.16b, { v1.16b, v2.16b }, v4.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v32i8:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    mov v3.16b, v0.16b
; CHECK-GI-NEXT:    adrp x8, .LCPI18_1
; CHECK-GI-NEXT:    adrp x9, .LCPI18_0
; CHECK-GI-NEXT:    mov v4.16b, v2.16b
; CHECK-GI-NEXT:    ldr q0, [x8, :lo12:.LCPI18_1]
; CHECK-GI-NEXT:    ldr q1, [x9, :lo12:.LCPI18_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v3.16b, v4.16b }, v0.16b
; CHECK-GI-NEXT:    tbl v1.16b, { v3.16b, v4.16b }, v1.16b
; CHECK-GI-NEXT:    ret
    %c = shufflevector <32 x i8> %a, <32 x i8> %b, <32 x i32> <i32 0, i32 32, i32 32, i32 32, i32 1, i32 32, i32 32, i32 32, i32 2, i32 32, i32 32, i32 32, i32 3, i32 32, i32 32, i32 32, i32 4, i32 32, i32 32, i32 32, i32 5, i32 32, i32 32, i32 32, i32 6, i32 32, i32 32, i32 32, i32 7, i32 32, i32 32, i32 32>
    ret <32 x i8> %c
}

define i32 @shufflevector_v2i16(<2 x i16> %a, <2 x i16> %b){
; CHECK-SD-LABEL: shufflevector_v2i16:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    sub sp, sp, #16
; CHECK-SD-NEXT:    .cfi_def_cfa_offset 16
; CHECK-SD-NEXT:    ext v0.8b, v0.8b, v1.8b, #4
; CHECK-SD-NEXT:    mov s1, v0.s[1]
; CHECK-SD-NEXT:    str h0, [sp, #12]
; CHECK-SD-NEXT:    str h1, [sp, #14]
; CHECK-SD-NEXT:    ldr w0, [sp, #12]
; CHECK-SD-NEXT:    add sp, sp, #16
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v2i16:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    uzp1 v0.4h, v0.4h, v0.4h
; CHECK-GI-NEXT:    adrp x8, .LCPI19_0
; CHECK-GI-NEXT:    uzp1 v1.4h, v1.4h, v0.4h
; CHECK-GI-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-GI-NEXT:    ldr d1, [x8, :lo12:.LCPI19_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b }, v1.16b
; CHECK-GI-NEXT:    fmov w0, s0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <2 x i16> %a, <2 x i16> %b, <2 x i32> <i32 1, i32 2>
    %d = bitcast <2 x i16> %c to i32
    ret i32 %d
}

define <16 x i16> @shufflevector_v16i16(<16 x i16> %a, <16 x i16> %b){
; CHECK-SD-LABEL: shufflevector_v16i16:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    // kill: def $q2 killed $q2 def $q1_q2
; CHECK-SD-NEXT:    adrp x8, .LCPI20_0
; CHECK-SD-NEXT:    adrp x9, .LCPI20_1
; CHECK-SD-NEXT:    mov v1.16b, v0.16b
; CHECK-SD-NEXT:    ldr q3, [x8, :lo12:.LCPI20_0]
; CHECK-SD-NEXT:    ldr q4, [x9, :lo12:.LCPI20_1]
; CHECK-SD-NEXT:    tbl v0.16b, { v1.16b, v2.16b }, v3.16b
; CHECK-SD-NEXT:    tbl v1.16b, { v1.16b, v2.16b }, v4.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v16i16:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    mov v3.16b, v0.16b
; CHECK-GI-NEXT:    adrp x8, .LCPI20_1
; CHECK-GI-NEXT:    adrp x9, .LCPI20_0
; CHECK-GI-NEXT:    mov v4.16b, v2.16b
; CHECK-GI-NEXT:    ldr q0, [x8, :lo12:.LCPI20_1]
; CHECK-GI-NEXT:    ldr q1, [x9, :lo12:.LCPI20_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v3.16b, v4.16b }, v0.16b
; CHECK-GI-NEXT:    tbl v1.16b, { v3.16b, v4.16b }, v1.16b
; CHECK-GI-NEXT:    ret
    %c = shufflevector <16 x i16> %a, <16 x i16> %b, <16 x i32> <i32 0, i32 16, i32 16, i32 16, i32 1, i32 16, i32 16, i32 16, i32 1, i32 16, i32 16, i32 16, i32 3, i32 16, i32 16, i32 16>
    ret <16 x i16> %c
}

define <1 x i32> @shufflevector_v1i32(<1 x i32> %a, <1 x i32> %b) {
; CHECK-LABEL: shufflevector_v1i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmov d0, d1
; CHECK-NEXT:    ret
    %c = shufflevector <1 x i32> %a, <1 x i32> %b, <1 x i32> <i32 1>
    ret <1 x i32> %c
}

define <8 x i32> @shufflevector_v8i32(<8 x i32> %a, <8 x i32> %b) {
; CHECK-SD-LABEL: shufflevector_v8i32:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    uzp1 v2.4s, v2.4s, v3.4s
; CHECK-SD-NEXT:    uzp2 v0.4s, v0.4s, v1.4s
; CHECK-SD-NEXT:    mov v2.s[3], v3.s[3]
; CHECK-SD-NEXT:    mov v1.16b, v2.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v8i32:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    adrp x8, .LCPI22_0
; CHECK-GI-NEXT:    // kill: def $q2 killed $q2 killed $q2_q3 def $q2_q3
; CHECK-GI-NEXT:    uzp2 v0.4s, v0.4s, v1.4s
; CHECK-GI-NEXT:    ldr q4, [x8, :lo12:.LCPI22_0]
; CHECK-GI-NEXT:    // kill: def $q3 killed $q3 killed $q2_q3 def $q2_q3
; CHECK-GI-NEXT:    tbl v1.16b, { v2.16b, v3.16b }, v4.16b
; CHECK-GI-NEXT:    ret
    %c = shufflevector <8 x i32> %a, <8 x i32> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 8, i32 10, i32 12, i32 15>
    ret <8 x i32> %c
}

define <4 x i64> @shufflevector_v4i64(<4 x i64> %a, <4 x i64> %b) {
; CHECK-SD-LABEL: shufflevector_v4i64:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    zip2 v2.2d, v2.2d, v3.2d
; CHECK-SD-NEXT:    zip2 v0.2d, v0.2d, v1.2d
; CHECK-SD-NEXT:    mov v1.16b, v2.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v4i64:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    zip2 v0.2d, v0.2d, v1.2d
; CHECK-GI-NEXT:    zip2 v1.2d, v2.2d, v3.2d
; CHECK-GI-NEXT:    ret
    %c = shufflevector <4 x i64> %a, <4 x i64> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
    ret <4 x i64> %c
}

define <3 x ptr> @shufflevector_v3p0(<3 x ptr> %a, <3 x ptr> %b) {
; CHECK-SD-LABEL: shufflevector_v3p0:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    fmov d2, d5
; CHECK-SD-NEXT:    fmov d0, d1
; CHECK-SD-NEXT:    fmov d1, d3
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v3p0:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    fmov x8, d1
; CHECK-GI-NEXT:    fmov x9, d4
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-GI-NEXT:    // kill: def $d3 killed $d3 def $q3
; CHECK-GI-NEXT:    // kill: def $d5 killed $d5 def $q5
; CHECK-GI-NEXT:    dup v2.2d, v5.d[0]
; CHECK-GI-NEXT:    mov v0.d[1], x8
; CHECK-GI-NEXT:    mov v3.d[1], x9
; CHECK-GI-NEXT:    ext v0.16b, v0.16b, v3.16b, #8
; CHECK-GI-NEXT:    mov d1, v0.d[1]
; CHECK-GI-NEXT:    ret
    %c = shufflevector <3 x ptr> %a, <3 x ptr> %b, <3 x i32> <i32 1, i32 3, i32 5>
    ret <3 x ptr> %c
}

define <4 x ptr> @shufflevector_v4p0(<4 x ptr> %a, <4 x ptr> %b) {
; CHECK-SD-LABEL: shufflevector_v4p0:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    zip2 v2.2d, v2.2d, v3.2d
; CHECK-SD-NEXT:    zip2 v0.2d, v0.2d, v1.2d
; CHECK-SD-NEXT:    mov v1.16b, v2.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v4p0:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    zip2 v0.2d, v0.2d, v1.2d
; CHECK-GI-NEXT:    zip2 v1.2d, v2.2d, v3.2d
; CHECK-GI-NEXT:    ret
    %c = shufflevector <4 x ptr> %a, <4 x ptr> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
    ret <4 x ptr> %c
}

; ===== Smaller/Larger Width Vectors with Zero Masks =====

define <2 x i1> @shufflevector_v2i1_zeroes(<2 x i1> %a, <2 x i1> %b){
; CHECK-SD-LABEL: shufflevector_v2i1_zeroes:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-SD-NEXT:    dup v0.2s, v0.s[0]
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v2i1_zeroes:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-GI-NEXT:    mov w8, v0.s[1]
; CHECK-GI-NEXT:    mov v0.b[1], w8
; CHECK-GI-NEXT:    dup v0.8b, v0.b[0]
; CHECK-GI-NEXT:    umov w8, v0.b[0]
; CHECK-GI-NEXT:    umov w9, v0.b[1]
; CHECK-GI-NEXT:    fmov s0, w8
; CHECK-GI-NEXT:    mov v0.s[1], w9
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <2 x i1> %a, <2 x i1> %b, <2 x i32> <i32 0, i32 0>
    ret <2 x i1> %c
}

define i32 @shufflevector_v4i8_zeroes(<4 x i8> %a, <4 x i8> %b){
; CHECK-SD-LABEL: shufflevector_v4i8_zeroes:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    sub sp, sp, #16
; CHECK-SD-NEXT:    .cfi_def_cfa_offset 16
; CHECK-SD-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-SD-NEXT:    dup v0.4h, v0.h[0]
; CHECK-SD-NEXT:    uzp1 v0.8b, v0.8b, v0.8b
; CHECK-SD-NEXT:    fmov w0, s0
; CHECK-SD-NEXT:    add sp, sp, #16
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v4i8_zeroes:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    uzp1 v0.8b, v0.8b, v0.8b
; CHECK-GI-NEXT:    dup v0.8b, v0.b[0]
; CHECK-GI-NEXT:    fmov w0, s0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <4 x i8> %a, <4 x i8> %b, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
    %d = bitcast <4 x i8> %c to i32
    ret i32 %d
}

define <32 x i8> @shufflevector_v32i8_zeroes(<32 x i8> %a, <32 x i8> %b){
; CHECK-LABEL: shufflevector_v32i8_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.16b, v0.b[0]
; CHECK-NEXT:    mov v1.16b, v0.16b
; CHECK-NEXT:    ret
    %c = shufflevector <32 x i8> %a, <32 x i8> %b, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <32 x i8> %c
}

define i32 @shufflevector_v2i16_zeroes(<2 x i16> %a, <2 x i16> %b){
; CHECK-SD-LABEL: shufflevector_v2i16_zeroes:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    sub sp, sp, #16
; CHECK-SD-NEXT:    .cfi_def_cfa_offset 16
; CHECK-SD-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-SD-NEXT:    dup v1.2s, v0.s[0]
; CHECK-SD-NEXT:    str h0, [sp, #12]
; CHECK-SD-NEXT:    mov s1, v1.s[1]
; CHECK-SD-NEXT:    str h1, [sp, #14]
; CHECK-SD-NEXT:    ldr w0, [sp, #12]
; CHECK-SD-NEXT:    add sp, sp, #16
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v2i16_zeroes:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    uzp1 v0.4h, v0.4h, v0.4h
; CHECK-GI-NEXT:    dup v0.4h, v0.h[0]
; CHECK-GI-NEXT:    fmov w0, s0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <2 x i16> %a, <2 x i16> %b, <2 x i32> <i32 0, i32 0>
    %d = bitcast <2 x i16> %c to i32
    ret i32 %d
}

define <16 x i16> @shufflevector_v16i16_zeroes(<16 x i16> %a, <16 x i16> %b){
; CHECK-LABEL: shufflevector_v16i16_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.8h, v0.h[0]
; CHECK-NEXT:    mov v1.16b, v0.16b
; CHECK-NEXT:    ret
    %c = shufflevector <16 x i16> %a, <16 x i16> %b, <16 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <16 x i16> %c
}

define <1 x i32> @shufflevector_v1i32_zeroes(<1 x i32> %a, <1 x i32> %b) {
; CHECK-LABEL: shufflevector_v1i32_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ret
    %c = shufflevector <1 x i32> %a, <1 x i32> %b, <1 x i32> <i32 0>
    ret <1 x i32> %c
}

define <8 x i32> @shufflevector_v8i32_zeroes(<8 x i32> %a, <8 x i32> %b) {
; CHECK-LABEL: shufflevector_v8i32_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.4s, v0.s[0]
; CHECK-NEXT:    mov v1.16b, v0.16b
; CHECK-NEXT:    ret
    %c = shufflevector <8 x i32> %a, <8 x i32> %b, <8 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <8 x i32> %c
}

define <4 x i64> @shufflevector_v4i64_zeroes(<4 x i64> %a, <4 x i64> %b) {
; CHECK-LABEL: shufflevector_v4i64_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.2d, v0.d[0]
; CHECK-NEXT:    mov v1.16b, v0.16b
; CHECK-NEXT:    ret
    %c = shufflevector <4 x i64> %a, <4 x i64> %b, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
    ret <4 x i64> %c
}

define <4 x ptr> @shufflevector_v4p0_zeroes(<4 x ptr> %a, <4 x ptr> %b) {
; CHECK-LABEL: shufflevector_v4p0_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.2d, v0.d[0]
; CHECK-NEXT:    mov v1.16b, v0.16b
; CHECK-NEXT:    ret
    %c = shufflevector <4 x ptr> %a, <4 x ptr> %b, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
    ret <4 x ptr> %c
}

; ===== Vectors with Non-Pow 2 Widths =====

define <3 x i8> @shufflevector_v3i8(<3 x i8> %a, <3 x i8> %b) {
; CHECK-SD-LABEL: shufflevector_v3i8:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    mov w0, w1
; CHECK-SD-NEXT:    mov w1, w2
; CHECK-SD-NEXT:    mov w2, w4
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v3i8:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    fmov s0, w0
; CHECK-GI-NEXT:    fmov s1, w3
; CHECK-GI-NEXT:    adrp x8, .LCPI35_0
; CHECK-GI-NEXT:    mov v0.b[1], w1
; CHECK-GI-NEXT:    mov v1.b[1], w4
; CHECK-GI-NEXT:    mov v0.b[2], w2
; CHECK-GI-NEXT:    mov v1.b[2], w5
; CHECK-GI-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-GI-NEXT:    ldr d1, [x8, :lo12:.LCPI35_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b }, v1.16b
; CHECK-GI-NEXT:    umov w0, v0.b[0]
; CHECK-GI-NEXT:    umov w1, v0.b[1]
; CHECK-GI-NEXT:    umov w2, v0.b[2]
; CHECK-GI-NEXT:    ret
    %c = shufflevector <3 x i8> %a, <3 x i8> %b, <3 x i32> <i32 1, i32 2, i32 4>
    ret <3 x i8> %c
}

define <7 x i8> @shufflevector_v7i8(<7 x i8> %a, <7 x i8> %b) {
; CHECK-SD-LABEL: shufflevector_v7i8:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-SD-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-SD-NEXT:    adrp x8, .LCPI36_0
; CHECK-SD-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-SD-NEXT:    ldr d1, [x8, :lo12:.LCPI36_0]
; CHECK-SD-NEXT:    tbl v0.8b, { v0.16b }, v1.8b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v7i8:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-GI-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-GI-NEXT:    adrp x8, .LCPI36_0
; CHECK-GI-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-GI-NEXT:    ldr d1, [x8, :lo12:.LCPI36_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b }, v1.16b
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <7 x i8> %a, <7 x i8> %b, <7 x i32> <i32 1, i32 3, i32 5, i32 7, i32 8, i32 10, i32 12>
    ret <7 x i8> %c
}

define <3 x i16> @shufflevector_v3i16(<3 x i16> %a, <3 x i16> %b) {
; CHECK-SD-LABEL: shufflevector_v3i16:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    zip1 v1.4h, v0.4h, v1.4h
; CHECK-SD-NEXT:    zip2 v0.4h, v1.4h, v0.4h
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v3i16:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-GI-NEXT:    // kill: def $d1 killed $d1 def $q1
; CHECK-GI-NEXT:    adrp x8, .LCPI37_0
; CHECK-GI-NEXT:    mov v0.d[1], v1.d[0]
; CHECK-GI-NEXT:    ldr d1, [x8, :lo12:.LCPI37_0]
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b }, v1.16b
; CHECK-GI-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-GI-NEXT:    ret
    %c = shufflevector <3 x i16> %a, <3 x i16> %b, <3 x i32> <i32 1, i32 2, i32 4>
    ret <3 x i16> %c
}

define <7 x i16> @shufflevector_v7i16(<7 x i16> %a, <7 x i16> %b) {
; CHECK-SD-LABEL: shufflevector_v7i16:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    adrp x8, .LCPI38_0
; CHECK-SD-NEXT:    // kill: def $q1 killed $q1 killed $q0_q1 def $q0_q1
; CHECK-SD-NEXT:    ldr q2, [x8, :lo12:.LCPI38_0]
; CHECK-SD-NEXT:    // kill: def $q0 killed $q0 killed $q0_q1 def $q0_q1
; CHECK-SD-NEXT:    tbl v0.16b, { v0.16b, v1.16b }, v2.16b
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v7i16:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    adrp x8, .LCPI38_0
; CHECK-GI-NEXT:    // kill: def $q0 killed $q0 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    ldr q2, [x8, :lo12:.LCPI38_0]
; CHECK-GI-NEXT:    // kill: def $q1 killed $q1 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b, v1.16b }, v2.16b
; CHECK-GI-NEXT:    ret
    %c = shufflevector <7 x i16> %a, <7 x i16> %b, <7 x i32> <i32 1, i32 3, i32 5, i32 7, i32 8, i32 10, i32 12>
    ret <7 x i16> %c
}

define <3 x i32> @shufflevector_v3i32(<3 x i32> %a, <3 x i32> %b) {
; CHECK-SD-LABEL: shufflevector_v3i32:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    zip1 v1.4s, v0.4s, v1.4s
; CHECK-SD-NEXT:    zip2 v0.4s, v1.4s, v0.4s
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v3i32:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    adrp x8, .LCPI39_0
; CHECK-GI-NEXT:    // kill: def $q0 killed $q0 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    ldr q2, [x8, :lo12:.LCPI39_0]
; CHECK-GI-NEXT:    // kill: def $q1 killed $q1 killed $q0_q1 def $q0_q1
; CHECK-GI-NEXT:    tbl v0.16b, { v0.16b, v1.16b }, v2.16b
; CHECK-GI-NEXT:    ret
    %c = shufflevector <3 x i32> %a, <3 x i32> %b, <3 x i32> <i32 1, i32 2, i32 4>
    ret <3 x i32> %c
}

; ===== Vectors with Non-Pow 2 Widths with Zero Masks =====

define <3 x i8> @shufflevector_v3i8_zeroes(<3 x i8> %a, <3 x i8> %b) {
; CHECK-SD-LABEL: shufflevector_v3i8_zeroes:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    mov w1, w0
; CHECK-SD-NEXT:    mov w2, w0
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: shufflevector_v3i8_zeroes:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    fmov s0, w0
; CHECK-GI-NEXT:    mov v0.b[1], w1
; CHECK-GI-NEXT:    mov v0.b[2], w2
; CHECK-GI-NEXT:    dup v0.8b, v0.b[0]
; CHECK-GI-NEXT:    umov w0, v0.b[0]
; CHECK-GI-NEXT:    umov w1, v0.b[1]
; CHECK-GI-NEXT:    umov w2, v0.b[2]
; CHECK-GI-NEXT:    ret
    %c = shufflevector <3 x i8> %a, <3 x i8> %b, <3 x i32> <i32 0, i32 0, i32 0>
    ret <3 x i8> %c
}

define <7 x i8> @shufflevector_v7i8_zeroes(<7 x i8> %a, <7 x i8> %b) {
; CHECK-LABEL: shufflevector_v7i8_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    dup v0.8b, v0.b[0]
; CHECK-NEXT:    ret
    %c = shufflevector <7 x i8> %a, <7 x i8> %b, <7 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <7 x i8> %c
}

define <3 x i16> @shufflevector_v3i16_zeroes(<3 x i16> %a, <3 x i16> %b) {
; CHECK-LABEL: shufflevector_v3i16_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    dup v0.4h, v0.h[0]
; CHECK-NEXT:    ret
    %c = shufflevector <3 x i16> %a, <3 x i16> %b, <3 x i32> <i32 0, i32 0, i32 0>
    ret <3 x i16> %c
}

define <7 x i16> @shufflevector_v7i16_zeroes(<7 x i16> %a, <7 x i16> %b) {
; CHECK-LABEL: shufflevector_v7i16_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.8h, v0.h[0]
; CHECK-NEXT:    ret
    %c = shufflevector <7 x i16> %a, <7 x i16> %b, <7 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
    ret <7 x i16> %c
}

define <3 x i32> @shufflevector_v3i32_zeroes(<3 x i32> %a, <3 x i32> %b) {
; CHECK-LABEL: shufflevector_v3i32_zeroes:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup v0.4s, v0.s[0]
; CHECK-NEXT:    ret
    %c = shufflevector <3 x i32> %a, <3 x i32> %b, <3 x i32> <i32 0, i32 0, i32 0>
    ret <3 x i32> %c
}
