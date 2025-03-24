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

    fmt.eprintln("\n================================================\n")
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
    x_float: f64   = 4.0;    sqrt_x_float := math.sqrt(x_float) // using default type of f64
    x_f16:   f16   = 30.90;  sqrt_x_f16   := math.sqrt(x_f16)
    x_f16le: f16le = 50.0;   sqrt_x_f16le := math.sqrt(x_f16le)
    x_f16be: f16be = 100;    sqrt_x_f16be := math.sqrt(x_f16be)
    x_f32:   f32   = 4.89;   sqrt_x_f32   := math.sqrt(x_f32)
    x_f32le: f32le = 3.14;   sqrt_x_f32le := math.sqrt(x_f32le)
    x_f32be: f32be = 2.0;    sqrt_x_f32be := math.sqrt(x_f32be)
    x_f64le: f64le = 1000.0; sqrt_x_f64le := math.sqrt(x_f64le)
    x_f64be: f64be = 89.98;  sqrt_x_f64be := math.sqrt(x_f64be)

    y_f64_pos_zero: f64 = +0.0;             sqrt_y_f64_pos_zero := math.sqrt(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             sqrt_y_f32_neg_zero := math.sqrt(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); sqrt_y_f16_pos_inf  := math.sqrt(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  sqrt_y_f32_zero_inf := math.sqrt(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); sqrt_y_f64_neg_inf  := math.sqrt(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); sqrt_y_f64be_nan    := math.sqrt(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); sqrt_y_f16le_nan    := math.sqrt(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        x_float: f64   = 4.0;    sqrt_x_float := math.sqrt(x_float) // using default type of f64
        x_f16:   f16   = 30.90;  sqrt_x_f16   := math.sqrt(x_f16)
        x_f16le: f16le = 50.0;   sqrt_x_f16le := math.sqrt(x_f16le)
        x_f16be: f16be = 100;    sqrt_x_f16be := math.sqrt(x_f16be)
        x_f32:   f32   = 4.89;   sqrt_x_f32   := math.sqrt(x_f32)
        x_f32le: f32le = 3.14;   sqrt_x_f32le := math.sqrt(x_f32le)
        x_f32be: f32be = 2.0;    sqrt_x_f32be := math.sqrt(x_f32be)
        x_f64le: f64le = 1000.0; sqrt_x_f64le := math.sqrt(x_f64le)
        x_f64be: f64be = 89.98;  sqrt_x_f64be := math.sqrt(x_f64be)

        // special cases, (see Float_Class and math.classfiy)
        y_f64_pos_zero: f64 = +0.0;             sqrt_y_f64_pos_zero := math.sqrt(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             sqrt_y_f32_neg_zero := math.sqrt(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); sqrt_y_f16_pos_inf  := math.sqrt(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  sqrt_y_f32_zero_inf := math.sqrt(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); sqrt_y_f64_neg_inf  := math.sqrt(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); sqrt_y_f64be_nan    := math.sqrt(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); sqrt_y_f16le_nan    := math.sqrt(y_f16le_nan)    // NaN
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
    print_value_and_type(sqrt_x_f64le)
    print_value_and_type(sqrt_x_f64be)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(sqrt_y_f64_pos_zero)
    print_value_and_type(sqrt_y_f32_neg_zero)
    print_value_and_type(sqrt_y_f16_pos_inf)
    print_value_and_type(sqrt_y_f32_zero_inf)
    print_value_and_type(sqrt_y_f64_neg_inf)
    print_value_and_type(sqrt_y_f64be_nan)
    print_value_and_type(sqrt_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_sin :: proc() {

    fmt.eprintln("\n========== math.sin() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return sine of given input in radian.

**Only accept floats**

math.sin assumes input in radians.
    `)

    fmt.eprintln(`Inputs:
- x: input value of type floats in radians
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in radians
`)

    x90_f16    :f16   = 90.0
    x30_f16    :f16   = 30.0

    sin_x90_f16       := math.sin(f16(x90_f16))
    sin_x90_f64_rad   := math.sin(math.to_radians(f64(x90_f16)))

    sin_x2_f16       := math.sin(f16(x30_f16))
    sin_x2_f64_rad   := math.sin(math.to_radians(f64(x30_f16)))

    fmt.eprintln(`Example:
        math.sin(f16(30.0))
        math.sin(math.to_radians(f64(30.0)))
        math.sin(f16(90.0))
        math.sin(math.to_radians(f64(90.0)))
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(sin_x2_f16)
    print_value_and_type(sin_x2_f64_rad)
    print_value_and_type(sin_x90_f16)
    print_value_and_type(sin_x90_f64_rad)

    fmt.eprintln("*/")

}

ex_cos :: proc() {

    fmt.eprintln("\n========== math.cos() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return cosine of given input in radian.

**Only accept floats**

math.cos assumes input in radians.
    `)

    fmt.eprintln(`Inputs:
- x: input value of type floats in radians
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in radians
`)

    x60_f16    :f16   = 60.0
    x30_f16    :f16   = 30.0

    cos_x60_f16       := math.cos(f16(x60_f16))
    cos_x60_f64_rad   := math.cos(math.to_radians(f64(x60_f16)))

    cos_x2_f16       := math.cos(f16(x30_f16))
    cos_x2_f64_rad   := math.cos(math.to_radians(f64(x30_f16)))

    fmt.eprintln(`Example:
        math.cos(f16(30.0))
        math.cos(math.to_radians(f64(30.0)))
        math.cos(f16(60.0))
        math.cos(math.to_radians(f64(60.0)))
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(cos_x2_f16)
    print_value_and_type(cos_x2_f64_rad)
    print_value_and_type(cos_x60_f16)
    print_value_and_type(cos_x60_f64_rad)

    fmt.eprintln("*/")

}

ex_tan :: proc() {

    fmt.eprintln("\n========== math.tan() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return tangent of given input in radian.

**Only accept floats**

math.tan assumes input in radians.
    `)

    fmt.eprintln(`Inputs:
- x: input value of type floats in radians
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in radians
`)

    x60_f16    :f16   = 60.0
    x30_f16    :f16   = 30.0

    tan_x60_f16       := math.tan(f16(x60_f16))
    tan_x60_f64_rad   := math.tan(math.to_radians(f64(x60_f16)))

    tan_x2_f16       := math.tan(f16(x30_f16))
    tan_x2_f64_rad   := math.tan(math.to_radians(f64(x30_f16)))

    fmt.eprintln(`Example:
        math.tan(f16(30.0))
        math.tan(math.to_radians(f64(30.0)))
        math.tan(f16(60.0))
        math.tan(math.to_radians(f64(60.0)))
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(tan_x2_f16)
    print_value_and_type(tan_x2_f64_rad)
    print_value_and_type(tan_x60_f16)
    print_value_and_type(tan_x60_f64_rad)

    fmt.eprintln("*/")

}

ex_to_radians :: proc() {

    fmt.eprintln("\n========== math.to_radians() ==================================\n")
    fmt.eprintln("/*")
    fmt.println("Convert given input to radians.\n")
    fmt.println("**Only accept floats**.\n")
    fmt.println("Convertion is implemented by multipication of input and constant `math.RAD_PER_DEG`.\n")
    fmt.printfln("`math.RAD_PER_DEG` = %v.\n", math.RAD_PER_DEG)

    fmt.eprintln(`Inputs:
- degrees: input value of type floats.
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in radians
`)

    //x60_f16    :f16   = 60.0
    //x30_f16    :f16   = 30.0

    x60_f16_rad   := math.to_radians(f16(60.0))
    x60_f64_rad   := math.to_radians(f64(60.0))

    x30_f16_rad   := math.to_radians(f16(30.0))
    x30_f64_rad   := math.to_radians(f64(30.0))

    fmt.eprintln(`Example:
        math.to_radians(f16(30.0))
        math.to_radians(f64(30.0))
        math.to_radians(f16(60.0))
        math.to_radians(f64(60.0))
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(x30_f16_rad)
    print_value_and_type(x30_f64_rad)
    print_value_and_type(x60_f16_rad)
    print_value_and_type(x60_f64_rad)

    fmt.eprintln("*/")

}

ex_to_degrees :: proc() {

    fmt.eprintln("\n========== math.to_degrees() ==================================\n")
    fmt.eprintln("/*")
    fmt.println("Convert given input to degrees.\n")
    fmt.println("**Only accept floats**.\n")
    fmt.println("Convertion is implemented by multipication of input and constant `math.DEG_PER_RAD`.\n")
    fmt.printfln("`math.DEG_PER_RAD` = %v.\n", math.DEG_PER_RAD)

    fmt.eprintln(`Inputs:
- radians: input value of type floats.
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in degrees
`)

    x60_f16_rad   := math.to_degrees(f16(1.047197))
    x60_f64_rad   := math.to_degrees(f64(1.047197))

    x30_f16_rad   := math.to_degrees(f16(0.523598))
    x30_f64_rad   := math.to_degrees(f64(0.523598))

    fmt.eprintln(`Example:
        math.to_degrees(f16(0.523598))
        math.to_degrees(f64(0.523598))
        math.to_degrees(f16(1.047197))
        math.to_degrees(f64(1.047197))
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(x30_f16_rad)
    print_value_and_type(x30_f64_rad)
    print_value_and_type(x60_f16_rad)
    print_value_and_type(x60_f64_rad)

    fmt.eprintln("*/")

}
