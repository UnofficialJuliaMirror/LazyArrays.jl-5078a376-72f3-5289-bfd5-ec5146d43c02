module LazyArrays
using Base, Base.Broadcast, LinearAlgebra, FillArrays, StaticArrays, MacroTools
import LinearAlgebra.BLAS

import Base: AbstractArray, AbstractMatrix, AbstractVector, 
        ReinterpretArray, ReshapedArray, AbstractCartesianIndex, Slice,
             RangeIndex, BroadcastStyle, copyto!, length, broadcastable, axes,
             getindex, eltype, tail, IndexStyle, IndexLinear,
             *, +, -, /, \, ==, isinf, isfinite, sign, angle, show, isless,
         fld, cld, div, min, max, minimum, maximum, mod,
         <, ≤, >, ≥, promote_rule, convert, copy,
         size, step, isempty, length, first, last, ndims,
         getindex, setindex!, OneTo, intersect, @_inline_meta, inv,
         sort, sort!, issorted, sortperm, diff, cumsum, sum, in, broadcast,
         eltype, parent, real, imag,
         conj, transpose, adjoint,
         exp, log, sqrt, cos, sin, tan, csc, sec, cot,
                   cosh, sinh, tanh, csch, sech, coth,
                   acos, asin, atan, acsc, asec, acot,
                   acosh, asinh, atanh, acsch, asech, acoth, (:),
         AbstractMatrix, AbstractArray, checkindex, unsafe_length, OneTo,
        to_shape, _sub2ind, print_matrix, print_matrix_row, print_matrix_vdots,
      checkindex, Slice, @propagate_inbounds, @_propagate_inbounds_meta,
      _in_range, _range, _rangestyle, Ordered,
      ArithmeticWraps, floatrange, reverse, unitrange_last,
      AbstractArray, AbstractVector, axes, (:), _sub2ind_recurse, broadcast, promote_eltypeof,
      similar, @_gc_preserve_end, @_gc_preserve_begin,
      @nexprs, @ncall, @ntuple

import Base.Broadcast: BroadcastStyle, AbstractArrayStyle, Broadcasted, broadcasted,
                        combine_eltypes, DefaultArrayStyle, instantiate, materialize,
                        materialize!, eltypes

import LinearAlgebra: AbstractTriangular, checksquare, pinv

import LinearAlgebra.BLAS: BlasFloat, BlasReal, BlasComplex

import FillArrays: AbstractFill

import StaticArrays: StaticArrayStyle

if VERSION < v"1.2-"
    import Base: has_offset_axes
    require_one_based_indexing(A...) = !has_offset_axes(A...) || throw(ArgumentError("offset arrays are not supported but got an array with index other than 1"))
else
    import Base: require_one_based_indexing    
end             

export Mul, MulArray, MulVector, MulMatrix, InvMatrix, PInvMatrix,
        Hcat, Vcat, Kron, BroadcastArray, cache, Ldiv, Inv, PInv, Diff, Cumsum,
        applied, materialize, ApplyArray, apply, ⋆

include("memorylayout.jl")
include("cache.jl")
include("lazyapplying.jl")
include("lazybroadcasting.jl")
include("lazyconcat.jl")
include("linalg/linalg.jl")
include("lazysetoperations.jl")
include("lazyoperations.jl")

end # module
