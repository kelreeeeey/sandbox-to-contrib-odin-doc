package example_math

import "core:fmt"
import "base:intrinsics"

print_value_and_type :: proc(x:$T) where intrinsics.type_is_numeric(T) {
    fmt.eprintfln("\t%v // `%v`", x, typeid_of(type_of(x)))
}
