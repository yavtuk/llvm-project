; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -mtriple=aarch64 -passes="print<cost-model>" -cost-kind=all 2>&1 -disable-output | FileCheck %s

; Verify the cost of scalar ctlz instructions.

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"

define i64 @test_ctlz_i64(i64 %a) {
;
; CHECK-LABEL: 'test_ctlz_i64'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call i64 @llvm.ctlz.i64(i64 %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret i64 %ctlz
;
  %ctlz = call i64 @llvm.ctlz.i64(i64 %a)
  ret i64 %ctlz
}

define i32 @test_ctlz_i32(i32 %a) {
;
; CHECK-LABEL: 'test_ctlz_i32'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call i32 @llvm.ctlz.i32(i32 %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret i32 %ctlz
;
  %ctlz = call i32 @llvm.ctlz.i32(i32 %a)
  ret i32 %ctlz
}

define i16 @test_ctlz_i16(i16 %a) {
;
; CHECK-LABEL: 'test_ctlz_i16'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call i16 @llvm.ctlz.i16(i16 %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret i16 %ctlz
;
  %ctlz = call i16 @llvm.ctlz.i16(i16 %a)
  ret i16 %ctlz
}

define i8 @test_ctlz_i8(i8 %a) {
;
; CHECK-LABEL: 'test_ctlz_i8'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call i8 @llvm.ctlz.i8(i8 %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret i8 %ctlz
;
  %ctlz = call i8 @llvm.ctlz.i8(i8 %a)
  ret i8 %ctlz
}

declare i64 @llvm.ctlz.i64(i64)
declare i32 @llvm.ctlz.i32(i32)
declare i16 @llvm.ctlz.i16(i16)
declare i8 @llvm.ctlz.i8(i8)

; Verify the cost of vector ctlz instructions.

define <2 x i64> @test_ctlz_v2i64(<2 x i64> %a) {
;
; CHECK-LABEL: 'test_ctlz_v2i64'
; CHECK-NEXT:  Cost Model: Found costs of RThru:10 CodeSize:6 Lat:10 SizeLat:10 for: %ctlz = call <2 x i64> @llvm.ctlz.v2i64(<2 x i64> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <2 x i64> %ctlz
;
  %ctlz = call <2 x i64> @llvm.ctlz.v2i64(<2 x i64> %a, i1 false)
  ret <2 x i64> %ctlz
}

define <2 x i32> @test_ctlz_v2i32(<2 x i32> %a) {
;
; CHECK-LABEL: 'test_ctlz_v2i32'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <2 x i32> %ctlz
;
  %ctlz = call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %a, i1 false)
  ret <2 x i32> %ctlz
}

define <4 x i32> @test_ctlz_v4i32(<4 x i32> %a) {
;
; CHECK-LABEL: 'test_ctlz_v4i32'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <4 x i32> %ctlz
;
  %ctlz = call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %a, i1 false)
  ret <4 x i32> %ctlz
}

define <2 x i16> @test_ctlz_v2i16(<2 x i16> %a) {
;
; CHECK-LABEL: 'test_ctlz_v2i16'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <2 x i16> @llvm.ctlz.v2i16(<2 x i16> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <2 x i16> %ctlz
;
  %ctlz = call <2 x i16> @llvm.ctlz.v2i16(<2 x i16> %a, i1 false)
  ret <2 x i16> %ctlz
}

define <4 x i16> @test_ctlz_v4i16(<4 x i16> %a) {
;
; CHECK-LABEL: 'test_ctlz_v4i16'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <4 x i16> %ctlz
;
  %ctlz = call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %a, i1 false)
  ret <4 x i16> %ctlz
}

define <8 x i16> @test_ctlz_v8i16(<8 x i16> %a) {
;
; CHECK-LABEL: 'test_ctlz_v8i16'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <8 x i16> %ctlz
;
  %ctlz = call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %a, i1 false)
  ret <8 x i16> %ctlz
}

define <2 x i8> @test_ctlz_v2i8(<2 x i8> %a) {
;
; CHECK-LABEL: 'test_ctlz_v2i8'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <2 x i8> @llvm.ctlz.v2i8(<2 x i8> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <2 x i8> %ctlz
;
  %ctlz = call <2 x i8> @llvm.ctlz.v2i8(<2 x i8> %a, i1 false)
  ret <2 x i8> %ctlz
}

define <4 x i8> @test_ctlz_v4i8(<4 x i8> %a) {
;
; CHECK-LABEL: 'test_ctlz_v4i8'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <4 x i8> @llvm.ctlz.v4i8(<4 x i8> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <4 x i8> %ctlz
;
  %ctlz = call <4 x i8> @llvm.ctlz.v4i8(<4 x i8> %a, i1 false)
  ret <4 x i8> %ctlz
}

define <8 x i8> @test_ctlz_v8i8(<8 x i8> %a) {
;
; CHECK-LABEL: 'test_ctlz_v8i8'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <8 x i8> %ctlz
;
  %ctlz = call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %a, i1 false)
  ret <8 x i8> %ctlz
}

define <16 x i8> @test_ctlz_v16i8(<16 x i8> %a) {
;
; CHECK-LABEL: 'test_ctlz_v16i8'
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %ctlz = call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <16 x i8> %ctlz
;
  %ctlz = call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %a, i1 false)
  ret <16 x i8> %ctlz
}

define <4 x i64> @test_ctlz_v4i64(<4 x i64> %a) {
; CHECK-LABEL: 'test_ctlz_v4i64'
; CHECK-NEXT:  Cost Model: Found costs of RThru:20 CodeSize:12 Lat:20 SizeLat:20 for: %ctlz = call <4 x i64> @llvm.ctlz.v4i64(<4 x i64> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <4 x i64> %ctlz
;
  %ctlz = call <4 x i64> @llvm.ctlz.v4i64(<4 x i64> %a, i1 false)
  ret <4 x i64> %ctlz
}

define <8 x i32> @test_ctlz_v8i32(<8 x i32> %a) {
; CHECK-LABEL: 'test_ctlz_v8i32'
; CHECK-NEXT:  Cost Model: Found costs of 4 for: %ctlz = call <8 x i32> @llvm.ctlz.v8i32(<8 x i32> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <8 x i32> %ctlz
;
  %ctlz = call <8 x i32> @llvm.ctlz.v8i32(<8 x i32> %a, i1 false)
  ret <8 x i32> %ctlz
}

define <16 x i16> @test_ctlz_v16i16(<16 x i16> %a) {
; CHECK-LABEL: 'test_ctlz_v16i16'
; CHECK-NEXT:  Cost Model: Found costs of 4 for: %ctlz = call <16 x i16> @llvm.ctlz.v16i16(<16 x i16> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <16 x i16> %ctlz
;
  %ctlz = call <16 x i16> @llvm.ctlz.v16i16(<16 x i16> %a, i1 false)
  ret <16 x i16> %ctlz
}

define <32 x i8> @test_ctlz_v32i8(<32 x i8> %a) {
; CHECK-LABEL: 'test_ctlz_v32i8'
; CHECK-NEXT:  Cost Model: Found costs of 4 for: %ctlz = call <32 x i8> @llvm.ctlz.v32i8(<32 x i8> %a, i1 false)
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret <32 x i8> %ctlz
;
  %ctlz = call <32 x i8> @llvm.ctlz.v32i8(<32 x i8> %a, i1 false)
  ret <32 x i8> %ctlz
}

declare <2 x i64> @llvm.ctlz.v2i64(<2 x i64>, i1)
declare <2 x i32> @llvm.ctlz.v2i32(<2 x i32>, i1)
declare <4 x i32> @llvm.ctlz.v4i32(<4 x i32>, i1)
declare <2 x i16> @llvm.ctlz.v2i16(<2 x i16>, i1)
declare <4 x i16> @llvm.ctlz.v4i16(<4 x i16>, i1)
declare <8 x i16> @llvm.ctlz.v8i16(<8 x i16>, i1)
declare <2 x i8> @llvm.ctlz.v2i8(<2 x i8>, i1)
declare <4 x i8> @llvm.ctlz.v4i8(<4 x i8>, i1)
declare <8 x i8> @llvm.ctlz.v8i8(<8 x i8>, i1)
declare <16 x i8> @llvm.ctlz.v16i8(<16 x i8>, i1)

declare <4 x i64> @llvm.ctlz.v4i64(<4 x i64>, i1)
declare <8 x i32> @llvm.ctlz.v8i32(<8 x i32>, i1)
declare <16 x i16> @llvm.ctlz.v16i16(<16 x i16>, i1)
declare <32 x i8> @llvm.ctlz.v32i8(<32 x i8>, i1)

