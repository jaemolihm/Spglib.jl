module Spglib

if VERSION >= v"1.3.0"
    using spglib_jll: libsymspg
else
    using Libdl
    # Load in `deps.jl`, complaining if it does not exist
    const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
    if !isfile(depsjl_path)
        error(
            "Spglib not installed properly, run Pkg.build(\"Spglib\"), restart Julia and try again",
        )
    end
    include(depsjl_path)

    # Module initialization function
    function __init__()
        # Always check your dependencies from `deps.jl`
        check_deps()
    end
end
using UnPack: @unpack

# All public methods
export get_symmetry,
    get_symmetry!,
    get_symmetry_with_collinear_spin,
    get_symmetry_with_collinear_spin!,
    get_hall_number_from_symmetry,
    get_dataset,
    get_spacegroup_type,
    get_international,
    get_schoenflies,
    standardize_cell,
    find_primitive,
    refine_cell,
    niggli_reduce,
    delaunay_reduce,
    get_multiplicity,
    get_ir_reciprocal_mesh,
    get_stabilized_reciprocal_mesh,
    get_version

include("model.jl")
include("symmetry.jl")
include("standardize.jl")
include("reduce.jl")
include("reciprocal.jl")

end
