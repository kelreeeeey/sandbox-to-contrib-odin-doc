package example_math

import "core:math"
import "core:fmt"

/* utility function to print result and it's type

import "base:intrinsics"
import "core:fmt"

print_value_and_type :: proc(x:$T) where intrinsics.type_is_numeric(T) {
    fmt.eprintfln("\t%v // `%v`", x, typeid_of(type_of(x)))
}

*/

ex_sqrt_floats :: proc() {

    fmt.eprintln("/*")
    fmt.eprintln(`Return square root of given input.

**Only accept floats**
    `)

    fmt.eprintln(`Inputs:
- x: input value of type floats
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input
`)
    x_float :      = 4.0    ;    sqrt_x_float   := math.sqrt(x_float) // using default type of f16
    x_f16   :f16   = 30.90  ;    sqrt_x_f16     := math.sqrt(x_f16)
    x_f16le :f16le = 50.0   ;    sqrt_x_f16le   := math.sqrt(x_f16le)
    x_f16be :f16be = 100    ;    sqrt_x_f16be   := math.sqrt(x_f16be)
    x_f32   :f32   = 4.89   ;    sqrt_x_f32     := math.sqrt(x_f32)
    x_f32le :f32le = 3.14   ;    sqrt_x_f32le   := math.sqrt(x_f32le)
    x_f32be :f32be = 2.0    ;    sqrt_x_f32be   := math.sqrt(x_f32be)
    x_f64   :f64   = 0.0578 ;    sqrt_x_f64     := math.sqrt(x_f64)
    x_f64le :f64le = 1000.6 ;    sqrt_x_f64le   := math.sqrt(x_f64le)
    x_f64be :f64be = 89.98  ;    sqrt_x_f64be   := math.sqrt(x_f64be)

    fmt.eprintln(`Example:
        x_float :      = 4.0    ;    sqrt_x_float   := math.sqrt(x_float) // using default type of f16
        x_f16   :f16   = 30.90  ;    sqrt_x_f16     := math.sqrt(x_f16)
        x_f16le :f16le = 50.0   ;    sqrt_x_f16le   := math.sqrt(x_f16le)
        x_f16be :f16be = 100    ;    sqrt_x_f16be   := math.sqrt(x_f16be)
        x_f32   :f32   = 4.89   ;    sqrt_x_f32     := math.sqrt(x_f32)
        x_f32le :f32le = 3.14   ;    sqrt_x_f32le   := math.sqrt(x_f32le)
        x_f32be :f32be = 2.0    ;    sqrt_x_f32be   := math.sqrt(x_f32be)
        x_f64   :f64   = 0.0578 ;    sqrt_x_f64     := math.sqrt(x_f64)
        x_f64le :f64le = 1000.6 ;    sqrt_x_f64le   := math.sqrt(x_f64le)
        x_f64be :f64be = 89.98  ;    sqrt_x_f64be   := math.sqrt(x_f64be)
    `)

    fmt.eprintln(`
Output:`)
    print_value_and_type(sqrt_x_float)
    print_value_and_type(sqrt_x_f16)
    print_value_and_type(sqrt_x_f16le)
    print_value_and_type(sqrt_x_f16be)
    print_value_and_type(sqrt_x_f32)
    print_value_and_type(sqrt_x_f32le)
    print_value_and_type(sqrt_x_f32be)
    print_value_and_type(sqrt_x_f64)
    print_value_and_type(sqrt_x_f64le)
    print_value_and_type(sqrt_x_f64be)

    fmt.eprintln("*/")

}
