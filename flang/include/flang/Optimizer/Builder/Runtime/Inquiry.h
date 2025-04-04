//===-- Inquiry.h - generate inquiry runtime API calls ----------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef FORTRAN_OPTIMIZER_BUILDER_RUNTIME_INQUIRY_H
#define FORTRAN_OPTIMIZER_BUILDER_RUNTIME_INQUIRY_H

namespace mlir {
class Value;
class Location;
} // namespace mlir

namespace fir {
class FirOpBuilder;
}

namespace fir::runtime {

/// Generate call to `LboundDim` runtime routine.
mlir::Value genLboundDim(fir::FirOpBuilder &builder, mlir::Location loc,
                         mlir::Value array, mlir::Value dim);

/// Generate call to Lbound` runtime routine.
void genLbound(fir::FirOpBuilder &builder, mlir::Location loc,
               mlir::Value resultAddr, mlir::Value arrayt, mlir::Value kind);

/// Generate call to general `Ubound` runtime routine.  Calls to UBOUND
/// with a DIM argument get transformed into an expression equivalent to
/// SIZE() + LBOUND() - 1, so they don't have an intrinsic in the runtime.
void genUbound(fir::FirOpBuilder &builder, mlir::Location loc,
               mlir::Value resultBox, mlir::Value array, mlir::Value kind);

/// Generate call to `Shape` runtime routine.
/// First argument is a raw pointer to the result array storage that
/// must be allocated by the caller.
void genShape(fir::FirOpBuilder &builder, mlir::Location loc,
              mlir::Value resultAddr, mlir::Value arrayt, mlir::Value kind);

/// Generate call to `Size` runtime routine. This routine is a specialized
/// version when the DIM argument is not specified by the user.
mlir::Value genSize(fir::FirOpBuilder &builder, mlir::Location loc,
                    mlir::Value array);

/// Generate call to general `SizeDim` runtime routine.  This version is for
/// when the user specifies a DIM argument.
mlir::Value genSizeDim(fir::FirOpBuilder &builder, mlir::Location loc,
                       mlir::Value array, mlir::Value dim);

/// Generate call to `IsContiguous` runtime routine.
mlir::Value genIsContiguous(fir::FirOpBuilder &builder, mlir::Location loc,
                            mlir::Value array);

/// Generate call to `IsContiguousUpTo` runtime routine.
/// \p dim specifies the dimension up to which contiguity
/// needs to be checked (not exceeding the actual rank of the array).
mlir::Value genIsContiguousUpTo(fir::FirOpBuilder &builder, mlir::Location loc,
                                mlir::Value array, mlir::Value dim);

} // namespace fir::runtime
#endif // FORTRAN_OPTIMIZER_BUILDER_RUNTIME_INQUIRY_H
