; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 5
; RUN: opt < %s -passes=msan -S | FileCheck %s
;
; Forked from llvm/test/CodeGen/AArch64/arm64-vmovn.ll

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64--linux-android9001"

define <8 x i8> @xtn8b(<8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i8> @xtn8b(
; CHECK-SAME: <8 x i16> [[A:%.*]]) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = trunc <8 x i16> [[TMP1]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = trunc <8 x i16> [[A]] to <8 x i8>
; CHECK-NEXT:    store <8 x i8> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i8> [[TMP3]]
;
  %tmpvar3 = trunc <8 x i16> %A to <8 x i8>
  ret <8 x i8> %tmpvar3
}

define <4 x i16> @xtn4h(<4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i16> @xtn4h(
; CHECK-SAME: <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = trunc <4 x i32> [[TMP1]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = trunc <4 x i32> [[A]] to <4 x i16>
; CHECK-NEXT:    store <4 x i16> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i16> [[TMP3]]
;
  %tmpvar3 = trunc <4 x i32> %A to <4 x i16>
  ret <4 x i16> %tmpvar3
}

define <2 x i32> @xtn2s(<2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <2 x i32> @xtn2s(
; CHECK-SAME: <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = trunc <2 x i64> [[TMP1]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = trunc <2 x i64> [[A]] to <2 x i32>
; CHECK-NEXT:    store <2 x i32> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <2 x i32> [[TMP3]]
;
  %tmpvar3 = trunc <2 x i64> %A to <2 x i32>
  ret <2 x i32> %tmpvar3
}

define <16 x i8> @xtn2_16b(<8 x i8> %ret, <8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <16 x i8> @xtn2_16b(
; CHECK-SAME: <8 x i8> [[RET:%.*]], <8 x i16> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <8 x i8>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = trunc <8 x i16> [[TMP1]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = trunc <8 x i16> [[A]] to <8 x i8>
; CHECK-NEXT:    [[_MSPROP1:%.*]] = shufflevector <8 x i8> [[TMP2]], <8 x i8> [[_MSPROP]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <8 x i8> [[RET]], <8 x i8> [[TMP3]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    store <16 x i8> [[_MSPROP1]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <16 x i8> [[RES]]
;
  %tmpvar3 = trunc <8 x i16> %A to <8 x i8>
  %res = shufflevector <8 x i8> %ret, <8 x i8> %tmpvar3, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <16 x i8> %res
}

define <8 x i16> @xtn2_8h(<4 x i16> %ret, <4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i16> @xtn2_8h(
; CHECK-SAME: <4 x i16> [[RET:%.*]], <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <4 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = trunc <4 x i32> [[TMP1]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = trunc <4 x i32> [[A]] to <4 x i16>
; CHECK-NEXT:    [[_MSPROP1:%.*]] = shufflevector <4 x i16> [[TMP2]], <4 x i16> [[_MSPROP]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <4 x i16> [[RET]], <4 x i16> [[TMP3]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    store <8 x i16> [[_MSPROP1]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i16> [[RES]]
;
  %tmpvar3 = trunc <4 x i32> %A to <4 x i16>
  %res = shufflevector <4 x i16> %ret, <4 x i16> %tmpvar3, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %res
}

define <4 x i32> @xtn2_4s(<2 x i32> %ret, <2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i32> @xtn2_4s(
; CHECK-SAME: <2 x i32> [[RET:%.*]], <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = trunc <2 x i64> [[TMP1]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = trunc <2 x i64> [[A]] to <2 x i32>
; CHECK-NEXT:    [[_MSPROP1:%.*]] = shufflevector <2 x i32> [[TMP2]], <2 x i32> [[_MSPROP]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <2 x i32> [[RET]], <2 x i32> [[TMP3]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    store <4 x i32> [[_MSPROP1]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i32> [[RES]]
;
  %tmpvar3 = trunc <2 x i64> %A to <2 x i32>
  %res = shufflevector <2 x i32> %ret, <2 x i32> %tmpvar3, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i32> %res
}

define <8 x i8> @sqxtn8b(<8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i8> @sqxtn8b(
; CHECK-SAME: <8 x i16> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <8 x i16> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <8 x i16> [[_MSPROP]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = call <8 x i8> @llvm.aarch64.neon.sqxtn.v8i8(<8 x i16> [[A]])
; CHECK-NEXT:    store <8 x i8> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i8> [[TMP3]]
;
  %tmpvar3 = call <8 x i8> @llvm.aarch64.neon.sqxtn.v8i8(<8 x i16> %A)
  ret <8 x i8> %tmpvar3
}

define <4 x i16> @sqxtn4h(<4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i16> @sqxtn4h(
; CHECK-SAME: <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <4 x i32> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <4 x i32> [[_MSPROP]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = call <4 x i16> @llvm.aarch64.neon.sqxtn.v4i16(<4 x i32> [[A]])
; CHECK-NEXT:    store <4 x i16> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i16> [[TMP3]]
;
  %tmpvar3 = call <4 x i16> @llvm.aarch64.neon.sqxtn.v4i16(<4 x i32> %A)
  ret <4 x i16> %tmpvar3
}

define <2 x i32> @sqxtn2s(<2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <2 x i32> @sqxtn2s(
; CHECK-SAME: <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <2 x i64> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <2 x i64> [[_MSPROP]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i32> @llvm.aarch64.neon.sqxtn.v2i32(<2 x i64> [[A]])
; CHECK-NEXT:    store <2 x i32> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <2 x i32> [[TMP3]]
;
  %tmpvar3 = call <2 x i32> @llvm.aarch64.neon.sqxtn.v2i32(<2 x i64> %A)
  ret <2 x i32> %tmpvar3
}

define <16 x i8> @sqxtn2_16b(<8 x i8> %ret, <8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <16 x i8> @sqxtn2_16b(
; CHECK-SAME: <8 x i8> [[RET:%.*]], <8 x i16> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <8 x i8>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <8 x i16> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP5:%.*]] = trunc <8 x i16> [[_MSPROP1]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = call <8 x i8> @llvm.aarch64.neon.sqxtn.v8i8(<8 x i16> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <8 x i8> [[TMP2]], <8 x i8> [[TMP5]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <8 x i8> [[RET]], <8 x i8> [[TMP3]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    store <16 x i8> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <16 x i8> [[RES]]
;
  %tmpvar3 = call <8 x i8> @llvm.aarch64.neon.sqxtn.v8i8(<8 x i16> %A)
  %res = shufflevector <8 x i8> %ret, <8 x i8> %tmpvar3, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <16 x i8> %res
}

define <8 x i16> @sqxtn2_8h(<4 x i16> %ret, <4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i16> @sqxtn2_8h(
; CHECK-SAME: <4 x i16> [[RET:%.*]], <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <4 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <4 x i32> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP5:%.*]] = trunc <4 x i32> [[_MSPROP1]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = call <4 x i16> @llvm.aarch64.neon.sqxtn.v4i16(<4 x i32> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <4 x i16> [[TMP2]], <4 x i16> [[TMP5]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <4 x i16> [[RET]], <4 x i16> [[TMP3]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    store <8 x i16> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i16> [[RES]]
;
  %tmpvar3 = call <4 x i16> @llvm.aarch64.neon.sqxtn.v4i16(<4 x i32> %A)
  %res = shufflevector <4 x i16> %ret, <4 x i16> %tmpvar3, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %res
}

define <4 x i32> @sqxtn2_4s(<2 x i32> %ret, <2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i32> @sqxtn2_4s(
; CHECK-SAME: <2 x i32> [[RET:%.*]], <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <2 x i64> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <2 x i64> [[_MSPROP1]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i32> @llvm.aarch64.neon.sqxtn.v2i32(<2 x i64> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <2 x i32> [[TMP2]], <2 x i32> [[TMP4]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <2 x i32> [[RET]], <2 x i32> [[TMP3]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    store <4 x i32> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i32> [[RES]]
;
  %tmpvar3 = call <2 x i32> @llvm.aarch64.neon.sqxtn.v2i32(<2 x i64> %A)
  %res = shufflevector <2 x i32> %ret, <2 x i32> %tmpvar3, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i32> %res
}

declare <8 x i8>  @llvm.aarch64.neon.sqxtn.v8i8(<8 x i16>) nounwind readnone
declare <4 x i16> @llvm.aarch64.neon.sqxtn.v4i16(<4 x i32>) nounwind readnone
declare <2 x i32> @llvm.aarch64.neon.sqxtn.v2i32(<2 x i64>) nounwind readnone

define <8 x i8> @uqxtn8b(<8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i8> @uqxtn8b(
; CHECK-SAME: <8 x i16> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <8 x i16> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <8 x i16> [[_MSPROP]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = call <8 x i8> @llvm.aarch64.neon.uqxtn.v8i8(<8 x i16> [[A]])
; CHECK-NEXT:    store <8 x i8> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i8> [[TMP3]]
;
  %tmpvar3 = call <8 x i8> @llvm.aarch64.neon.uqxtn.v8i8(<8 x i16> %A)
  ret <8 x i8> %tmpvar3
}

define <4 x i16> @uqxtn4h(<4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i16> @uqxtn4h(
; CHECK-SAME: <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <4 x i32> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <4 x i32> [[_MSPROP]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = call <4 x i16> @llvm.aarch64.neon.uqxtn.v4i16(<4 x i32> [[A]])
; CHECK-NEXT:    store <4 x i16> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i16> [[TMP3]]
;
  %tmpvar3 = call <4 x i16> @llvm.aarch64.neon.uqxtn.v4i16(<4 x i32> %A)
  ret <4 x i16> %tmpvar3
}

define <2 x i32> @uqxtn2s(<2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <2 x i32> @uqxtn2s(
; CHECK-SAME: <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <2 x i64> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <2 x i64> [[_MSPROP]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i32> @llvm.aarch64.neon.uqxtn.v2i32(<2 x i64> [[A]])
; CHECK-NEXT:    store <2 x i32> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <2 x i32> [[TMP3]]
;
  %tmpvar3 = call <2 x i32> @llvm.aarch64.neon.uqxtn.v2i32(<2 x i64> %A)
  ret <2 x i32> %tmpvar3
}

define <16 x i8> @uqxtn2_16b(<8 x i8> %ret, <8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <16 x i8> @uqxtn2_16b(
; CHECK-SAME: <8 x i8> [[RET:%.*]], <8 x i16> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <8 x i8>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <8 x i16> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP5:%.*]] = trunc <8 x i16> [[_MSPROP1]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = call <8 x i8> @llvm.aarch64.neon.uqxtn.v8i8(<8 x i16> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <8 x i8> [[TMP2]], <8 x i8> [[TMP5]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <8 x i8> [[RET]], <8 x i8> [[TMP3]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    store <16 x i8> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <16 x i8> [[RES]]
;
  %tmpvar3 = call <8 x i8> @llvm.aarch64.neon.uqxtn.v8i8(<8 x i16> %A)
  %res = shufflevector <8 x i8> %ret, <8 x i8> %tmpvar3, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <16 x i8> %res
}

define <8 x i16> @uqxtn2_8h(<4 x i16> %ret, <4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i16> @uqxtn2_8h(
; CHECK-SAME: <4 x i16> [[RET:%.*]], <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <4 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <4 x i32> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP5:%.*]] = trunc <4 x i32> [[_MSPROP1]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = call <4 x i16> @llvm.aarch64.neon.uqxtn.v4i16(<4 x i32> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <4 x i16> [[TMP2]], <4 x i16> [[TMP5]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <4 x i16> [[RET]], <4 x i16> [[TMP3]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    store <8 x i16> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i16> [[RES]]
;
  %tmpvar3 = call <4 x i16> @llvm.aarch64.neon.uqxtn.v4i16(<4 x i32> %A)
  %res = shufflevector <4 x i16> %ret, <4 x i16> %tmpvar3, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %res
}

define <4 x i32> @uqxtn2_4s(<2 x i32> %ret, <2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i32> @uqxtn2_4s(
; CHECK-SAME: <2 x i32> [[RET:%.*]], <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <2 x i64> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <2 x i64> [[_MSPROP1]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i32> @llvm.aarch64.neon.uqxtn.v2i32(<2 x i64> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <2 x i32> [[TMP2]], <2 x i32> [[TMP4]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <2 x i32> [[RET]], <2 x i32> [[TMP3]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    store <4 x i32> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i32> [[RES]]
;
  %tmpvar3 = call <2 x i32> @llvm.aarch64.neon.uqxtn.v2i32(<2 x i64> %A)
  %res = shufflevector <2 x i32> %ret, <2 x i32> %tmpvar3, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i32> %res
}

declare <8 x i8>  @llvm.aarch64.neon.uqxtn.v8i8(<8 x i16>) nounwind readnone
declare <4 x i16> @llvm.aarch64.neon.uqxtn.v4i16(<4 x i32>) nounwind readnone
declare <2 x i32> @llvm.aarch64.neon.uqxtn.v2i32(<2 x i64>) nounwind readnone

define <8 x i8> @sqxtun8b(<8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i8> @sqxtun8b(
; CHECK-SAME: <8 x i16> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <8 x i16> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <8 x i16> [[_MSPROP]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = call <8 x i8> @llvm.aarch64.neon.sqxtun.v8i8(<8 x i16> [[A]])
; CHECK-NEXT:    store <8 x i8> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i8> [[TMP3]]
;
  %tmpvar3 = call <8 x i8> @llvm.aarch64.neon.sqxtun.v8i8(<8 x i16> %A)
  ret <8 x i8> %tmpvar3
}

define <4 x i16> @sqxtun4h(<4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i16> @sqxtun4h(
; CHECK-SAME: <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <4 x i32> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <4 x i32> [[_MSPROP]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = call <4 x i16> @llvm.aarch64.neon.sqxtun.v4i16(<4 x i32> [[A]])
; CHECK-NEXT:    store <4 x i16> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i16> [[TMP3]]
;
  %tmpvar3 = call <4 x i16> @llvm.aarch64.neon.sqxtun.v4i16(<4 x i32> %A)
  ret <4 x i16> %tmpvar3
}

define <2 x i32> @sqxtun2s(<2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <2 x i32> @sqxtun2s(
; CHECK-SAME: <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP:%.*]] = or <2 x i64> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <2 x i64> [[_MSPROP]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i32> @llvm.aarch64.neon.sqxtun.v2i32(<2 x i64> [[A]])
; CHECK-NEXT:    store <2 x i32> [[TMP4]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <2 x i32> [[TMP3]]
;
  %tmpvar3 = call <2 x i32> @llvm.aarch64.neon.sqxtun.v2i32(<2 x i64> %A)
  ret <2 x i32> %tmpvar3
}

define <16 x i8> @sqxtun2_16b(<8 x i8> %ret, <8 x i16> %A) nounwind #0 {
; CHECK-LABEL: define <16 x i8> @sqxtun2_16b(
; CHECK-SAME: <8 x i8> [[RET:%.*]], <8 x i16> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <8 x i8>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <8 x i16> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP5:%.*]] = trunc <8 x i16> [[_MSPROP1]] to <8 x i8>
; CHECK-NEXT:    [[TMP3:%.*]] = call <8 x i8> @llvm.aarch64.neon.sqxtun.v8i8(<8 x i16> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <8 x i8> [[TMP2]], <8 x i8> [[TMP5]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <8 x i8> [[RET]], <8 x i8> [[TMP3]], <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:    store <16 x i8> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <16 x i8> [[RES]]
;
  %tmpvar3 = call <8 x i8> @llvm.aarch64.neon.sqxtun.v8i8(<8 x i16> %A)
  %res = shufflevector <8 x i8> %ret, <8 x i8> %tmpvar3, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <16 x i8> %res
}

define <8 x i16> @sqxtun2_8h(<4 x i16> %ret, <4 x i32> %A) nounwind #0 {
; CHECK-LABEL: define <8 x i16> @sqxtun2_8h(
; CHECK-SAME: <4 x i16> [[RET:%.*]], <4 x i32> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <4 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <4 x i32> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP5:%.*]] = trunc <4 x i32> [[_MSPROP1]] to <4 x i16>
; CHECK-NEXT:    [[TMP3:%.*]] = call <4 x i16> @llvm.aarch64.neon.sqxtun.v4i16(<4 x i32> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <4 x i16> [[TMP2]], <4 x i16> [[TMP5]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <4 x i16> [[RET]], <4 x i16> [[TMP3]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    store <8 x i16> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <8 x i16> [[RES]]
;
  %tmpvar3 = call <4 x i16> @llvm.aarch64.neon.sqxtun.v4i16(<4 x i32> %A)
  %res = shufflevector <4 x i16> %ret, <4 x i16> %tmpvar3, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %res
}

define <4 x i32> @sqxtun2_4s(<2 x i32> %ret, <2 x i64> %A) nounwind #0 {
; CHECK-LABEL: define <4 x i32> @sqxtun2_4s(
; CHECK-SAME: <2 x i32> [[RET:%.*]], <2 x i64> [[A:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSPROP1:%.*]] = or <2 x i64> [[TMP1]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = trunc <2 x i64> [[_MSPROP1]] to <2 x i32>
; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i32> @llvm.aarch64.neon.sqxtun.v2i32(<2 x i64> [[A]])
; CHECK-NEXT:    [[_MSPROP:%.*]] = shufflevector <2 x i32> [[TMP2]], <2 x i32> [[TMP4]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[RES:%.*]] = shufflevector <2 x i32> [[RET]], <2 x i32> [[TMP3]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    store <4 x i32> [[_MSPROP]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <4 x i32> [[RES]]
;
  %tmpvar3 = call <2 x i32> @llvm.aarch64.neon.sqxtun.v2i32(<2 x i64> %A)
  %res = shufflevector <2 x i32> %ret, <2 x i32> %tmpvar3, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i32> %res
}

declare <8 x i8>  @llvm.aarch64.neon.sqxtun.v8i8(<8 x i16>) nounwind readnone
declare <4 x i16> @llvm.aarch64.neon.sqxtun.v4i16(<4 x i32>) nounwind readnone
declare <2 x i32> @llvm.aarch64.neon.sqxtun.v2i32(<2 x i64>) nounwind readnone

attributes #0 = { sanitize_memory }
