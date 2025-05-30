; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 5
; RUN: opt -p loop-unroll -unroll-full-max-count=0 -S %s | FileCheck %s

declare void @foo()

define void @test_peel_last_pointer_induction(ptr %src, i64 %offset) {
; CHECK-LABEL: define void @test_peel_last_pointer_induction(
; CHECK-SAME: ptr [[SRC:%.*]], i64 [[OFFSET:%.*]]) {
; CHECK-NEXT:  [[ENTRY:.*]]:
; CHECK-NEXT:    [[END:%.*]] = getelementptr i8, ptr [[SRC]], i64 [[OFFSET]]
; CHECK-NEXT:    br label %[[LOOP_HEADER:.*]]
; CHECK:       [[LOOP_HEADER]]:
; CHECK-NEXT:    [[PTR_IV:%.*]] = phi ptr [ [[SRC]], %[[ENTRY]] ], [ [[PTR_IV_NEXT:%.*]], %[[LOOP_LATCH:.*]] ]
; CHECK-NEXT:    [[PTR_IV_NEXT]] = getelementptr nusw i8, ptr [[PTR_IV]], i64 1
; CHECK-NEXT:    [[CMP3_NOT:%.*]] = icmp eq ptr [[PTR_IV_NEXT]], [[END]]
; CHECK-NEXT:    br i1 [[CMP3_NOT]], label %[[LOOP_LATCH]], label %[[THEN:.*]]
; CHECK:       [[THEN]]:
; CHECK-NEXT:    call void @foo()
; CHECK-NEXT:    br label %[[LOOP_LATCH]]
; CHECK:       [[LOOP_LATCH]]:
; CHECK-NEXT:    [[EC:%.*]] = icmp eq ptr [[PTR_IV_NEXT]], [[END]]
; CHECK-NEXT:    br i1 [[EC]], label %[[EXIT:.*]], label %[[LOOP_HEADER]]
; CHECK:       [[EXIT]]:
; CHECK-NEXT:    ret void
;
entry:
  %end = getelementptr i8, ptr %src, i64 %offset
  br label %loop.header

loop.header:
  %ptr.iv = phi ptr [ %src, %entry ], [ %ptr.iv.next, %loop.latch ]
  %ptr.iv.next = getelementptr nusw i8, ptr %ptr.iv, i64 1
  %cmp3.not = icmp eq ptr %ptr.iv.next, %end
  br i1 %cmp3.not, label %loop.latch, label %then

then:
  call void @foo()
  br label %loop.latch

loop.latch:
  %ec = icmp eq ptr %ptr.iv.next, %end
  br i1 %ec, label %exit, label %loop.header

exit:
  ret void
}
