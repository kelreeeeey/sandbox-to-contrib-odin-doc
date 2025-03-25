package example_math

import "base:intrinsics"
import "core:math"
import "core:fmt"

/* utility function to print result and it's type

import "base:intrinsics"
import "core:fmt"

print_value_and_type :: proc(x:$T) where intrinsics.type_is_numeric(T) {
    fmt.eprintfln("\t%v // `%v`", x, typeid_of(type_of(x)))
}

*/

helper :: proc(x: $T) where intrinsics.type_is_float(T) {
        x_rad := math.to_radians(x)
        fmt.printfln("// x: %v", x)
        fmt.printfln("// x in radians: %v\n", x_rad)

        {
            fmt.printfln("// Without converting to radians\n")
            cos_deg         := math.cos(x)
            acos_deg_no_rad := math.acos(cos_deg)
            x_back          := math.to_degrees(acos_deg_no_rad)
            fmt.printfln("\tcos(x)=%v", cos_deg)
            fmt.printfln("\tacos(cos_deg)=%v", acos_deg_no_rad)
            fmt.printfln("\tmath.to_degrees(acos(cos_deg))=%v\n", x_back)
        }

        {
            fmt.printfln("// Converting to radians\n")
            cos_deg         := math.cos(x_rad)
            acos_deg_no_rad := math.acos(cos_deg)
            x_back          := math.to_degrees(acos_deg_no_rad)
            fmt.printfln("\tcos(x_rad)=%v", cos_deg)
            fmt.printfln("\tacos(cos_deg)=%v", acos_deg_no_rad)
            fmt.printfln("\tmath.to_degrees(acos(cos_deg))=%v\n", x_back)
        }
    }

ex_sqrt_floats :: proc() {

    fmt.eprintln("\n================================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return square root of given input.

**Only accept floats**

The return value always be a positive real value, except for special cases (see examples).
For example, sqrt(4.0) will always return +2.0, even if mathematically it has 2 roots, -2.0 and +2.0.
    `)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

    fmt.eprintln(`Inputs:
- x: input value of type floats
`)

    fmt.eprintln(`Output:
- x: positive root with same type of the input
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
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

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

    y_f64_pos_zero: f64 = +0.0;             sin_y_f64_pos_zero := math.sin(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             sin_y_f32_neg_zero := math.sin(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); sin_y_f16_pos_inf  := math.sin(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  sin_y_f32_zero_inf := math.sin(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); sin_y_f64_neg_inf  := math.sin(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); sin_y_f64be_nan    := math.sin(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); sin_y_f16le_nan    := math.sin(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        math.sin(f16(30.0))
        math.sin(math.to_radians(f64(30.0)))
        math.sin(f16(90.0))
        math.sin(math.to_radians(f64(90.0)))

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             sin_y_f64_pos_zero := math.sin(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             sin_y_f32_neg_zero := math.sin(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); sin_y_f16_pos_inf  := math.sin(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  sin_y_f32_zero_inf := math.sin(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); sin_y_f64_neg_inf  := math.sin(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); sin_y_f64be_nan    := math.sin(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); sin_y_f16le_nan    := math.sin(y_f16le_nan)    // NaN

        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(sin_x2_f16)
    print_value_and_type(sin_x2_f64_rad)
    print_value_and_type(sin_x90_f16)
    print_value_and_type(sin_x90_f64_rad)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(sin_y_f64_pos_zero)
    print_value_and_type(sin_y_f32_neg_zero)
    print_value_and_type(sin_y_f16_pos_inf)
    print_value_and_type(sin_y_f32_zero_inf)
    print_value_and_type(sin_y_f64_neg_inf)
    print_value_and_type(sin_y_f64be_nan)
    print_value_and_type(sin_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_asin :: proc() {

    fmt.eprintln("\n========== math.asin() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return inverse of sine (arcsin) of given input.

**Only accept floats**

Relation with math.sin:

    x = sin(y)
    y = asin(x)

    For real result, x should be in domain of [-1, 1],
    resulting single value that lies in following range(s)

        [  -π/2,   π/2] (in radians)
        [-90°/2, 90°/2] (in degrees)

Note:
   Implementation of asin was developed at SunSoft, a Sun Microsystems, Inc. (1993).
   For detail implementation, see source code, at asin_f64 procedure.
    `)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

    fmt.eprintln(`Inputs:
- x: input value of type floats in radians
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in radians
`)

    x30_f32:     f32 = 30.0;                     sin_x30_f32     := math.sin(x30_f32);     asin_x30_f32     := math.asin(sin_x30_f32)     // without converting to radians
    x30_f32_rad: f32 = math.to_radians(x30_f32); sin_x30_f32_rad := math.sin(x30_f32_rad); asin_x30_f32_rad := math.asin(sin_x30_f32_rad) // convert to radians first

    invers_asin_x30:       f32 = math.to_degrees(asin_x30_f32)
    invers_asin_x30_rad:   f32 = math.to_degrees(asin_x30_f32_rad)

    x60_f64le:     f64le = 60.0;                       sin_x60_f64le     := math.sin(x60_f64le);     asin_x60_f64le     := math.asin(sin_x60_f64le)     // without converting to radians
    x60_f64le_rad: f64le = math.to_radians(x60_f64le); sin_x60_f64le_rad := math.sin(x60_f64le_rad); asin_x60_f64le_rad := math.asin(sin_x60_f64le_rad) // convert to radians first

    invers_asin_x60:     f64le = math.to_degrees(asin_x60_f64le)
    invers_asin_x60_rad: f64le = math.to_degrees(asin_x60_f64le_rad)

    y_f64_pos_zero: f64 = +0.0;             asin_y_f64_pos_zero := math.asin(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             asin_y_f32_neg_zero := math.asin(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); asin_y_f16_pos_inf  := math.asin(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  asin_y_f32_zero_inf := math.asin(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); asin_y_f64_neg_inf  := math.asin(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); asin_y_f64be_nan    := math.asin(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); asin_y_f16le_nan    := math.asin(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        x30_f32:     f32 = 30.0;                     sin_x30_f32     := math.sin(x30_f32);     asin_x30_f32     := math.asin(sin_x30_f32)     // without converting to radians
        x30_f32_rad: f32 = math.to_radians(x30_f32); sin_x30_f32_rad := math.sin(x30_f32_rad); asin_x30_f32_rad := math.asin(sin_x30_f32_rad) // convert to radians first

            // convert asin() back to degrees
            invers_asin_x30:       f32 = math.to_degrees(asin_x30_f32)
            invers_asin_x30_rad:   f32 = math.to_degrees(asin_x30_f32_rad)

        x60_f64le:     f64le = 60.0;                       sin_x60_f64le     := math.sin(x60_f64le);     asin_x60_f64le     := math.asin(sin_x60_f64le)     // without converting to radians
        x60_f64le_rad: f64le = math.to_radians(x60_f64le); sin_x60_f64le_rad := math.sin(x60_f64le_rad); asin_x60_f64le_rad := math.asin(sin_x60_f64le_rad) // convert to radians first

            // convert asin() back to degrees
            invers_asin_x60:     f64le = math.to_degrees(asin_x60_f64le)
            invers_asin_x60_rad: f64le = math.to_degrees(asin_x60_f64le_rad)

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             asin_y_f64_pos_zero := math.asin(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             asin_y_f32_neg_zero := math.asin(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); asin_y_f16_pos_inf  := math.asin(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  asin_y_f32_zero_inf := math.asin(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); asin_y_f64_neg_inf  := math.asin(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); asin_y_f64be_nan    := math.asin(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); asin_y_f16le_nan    := math.asin(y_f16le_nan)    // NaN

        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(x30_f32, sin_x30_f32, asin_x30_f32)
    print_value_and_type(x30_f32_rad, sin_x30_f32_rad, asin_x30_f32_rad)

    fmt.println("")
    fmt.println("\t\t// convert asin() back to degrees")
    print_value_and_type_t(invers_asin_x30, tab=2)
    print_value_and_type_t(invers_asin_x30_rad, tab=2)

    fmt.println("")
    print_value_and_type(x60_f64le, sin_x60_f64le, asin_x60_f64le)
    print_value_and_type(x60_f64le_rad, sin_x60_f64le_rad, asin_x60_f64le_rad)

    fmt.println("")
    fmt.println("\t\t// convert asin() back to degrees")
    print_value_and_type_t(invers_asin_x60, tab=2)
    print_value_and_type_t(invers_asin_x60_rad, tab=2)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(asin_y_f64_pos_zero)
    print_value_and_type(asin_y_f32_neg_zero)
    print_value_and_type(asin_y_f16_pos_inf)
    print_value_and_type(asin_y_f32_zero_inf)
    print_value_and_type(asin_y_f64_neg_inf)
    print_value_and_type(asin_y_f64be_nan)
    print_value_and_type(asin_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_cos :: proc() {

    fmt.eprintln("\n========== math.cos() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return cosine of given input in radian.

**Only accept floats**

math.cos assumes input in radians.
    `)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

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

    y_f64_pos_zero: f64 = +0.0;             cos_y_f64_pos_zero := math.cos(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             cos_y_f32_neg_zero := math.cos(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); cos_y_f16_pos_inf  := math.cos(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  cos_y_f32_zero_inf := math.cos(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); cos_y_f64_neg_inf  := math.cos(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); cos_y_f64be_nan    := math.cos(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); cos_y_f16le_nan    := math.cos(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        math.cos(f16(30.0))
        math.cos(math.to_radians(f64(30.0)))
        math.cos(f16(60.0))
        math.cos(math.to_radians(f64(60.0)))

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             cos_y_f64_pos_zero := math.cos(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             cos_y_f32_neg_zero := math.cos(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); cos_y_f16_pos_inf  := math.cos(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  cos_y_f32_zero_inf := math.cos(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); cos_y_f64_neg_inf  := math.cos(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); cos_y_f64be_nan    := math.cos(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); cos_y_f16le_nan    := math.cos(y_f16le_nan)    // NaN
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(cos_x2_f16)
    print_value_and_type(cos_x2_f64_rad)
    print_value_and_type(cos_x60_f16)
    print_value_and_type(cos_x60_f64_rad)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(cos_y_f64_pos_zero)
    print_value_and_type(cos_y_f32_neg_zero)
    print_value_and_type(cos_y_f16_pos_inf)
    print_value_and_type(cos_y_f32_zero_inf)
    print_value_and_type(cos_y_f64_neg_inf)
    print_value_and_type(cos_y_f64be_nan)
    print_value_and_type(cos_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_acos :: proc() {

    fmt.eprintln("\n========== math.acos() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return inverse of cosine (arccos) of given input.

**Only accept floats**

Relation with math.cos:

    x = cos(y)
    y = acos(x)

    For real result, x should be in domain of [-1, 1],
    resulting single value that lies in following range(s)

        [ 0,   π] (in radians)
        [ 0, 180] (in degrees)

Note:
   Implementation of asin was developed at SunSoft, a Sun Microsystems, Inc. (1993).
   For detail implementation, see source code, at acos_f64 procedure.
    `)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

    fmt.eprintln(`Inputs:
- x: input value of type floats in radians
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in radians
`)

    x30_f32:     f32 = 30.0;                     cos_x30_f32     := math.cos(x30_f32);     acos_x30_f32     := math.acos(cos_x30_f32)     // without converting to radians
    x30_f32_rad: f32 = math.to_radians(x30_f32); cos_x30_f32_rad := math.cos(x30_f32_rad); acos_x30_f32_rad := math.acos(cos_x30_f32_rad) // convert to radians first

    invers_acos_x30:       f32 = math.to_degrees(acos_x30_f32)
    invers_acos_x30_rad:   f32 = math.to_degrees(acos_x30_f32_rad)

    x60_f64le:     f64le = 60.0;                       cos_x60_f64le     := math.cos(x60_f64le);     acos_x60_f64le     := math.acos(cos_x60_f64le)     // without converting to radians
    x60_f64le_rad: f64le = math.to_radians(x60_f64le); cos_x60_f64le_rad := math.cos(x60_f64le_rad); acos_x60_f64le_rad := math.acos(cos_x60_f64le_rad) // convert to radians first

    invers_acos_x60:     f64le = math.to_degrees(acos_x60_f64le)
    invers_acos_x60_rad: f64le = math.to_degrees(acos_x60_f64le_rad)

    y_f64_pos_zero: f64 = +0.0;             acos_y_f64_pos_zero := math.acos(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             acos_y_f32_neg_zero := math.acos(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); acos_y_f16_pos_inf  := math.acos(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  acos_y_f32_zero_inf := math.acos(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); acos_y_f64_neg_inf  := math.acos(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); acos_y_f64be_nan    := math.acos(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); acos_y_f16le_nan    := math.acos(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        x30_f32:     f32 = 30.0;                     cos_x30_f32     := math.cos(x30_f32);     acos_x30_f32     := math.acos(cos_x30_f32)     // without converting to radians
        x30_f32_rad: f32 = math.to_radians(x30_f32); cos_x30_f32_rad := math.cos(x30_f32_rad); acos_x30_f32_rad := math.acos(cos_x30_f32_rad) // convert to radians first

            // convert acos() back to degrees
            invers_acos_x30:       f32 = math.to_degrees(acos_x30_f32)
            invers_acos_x30_rad:   f32 = math.to_degrees(acos_x30_f32_rad)

        x60_f64le:     f64le = 60.0;                       cos_x60_f64le     := math.cos(x60_f64le);     acos_x60_f64le     := math.acos(cos_x60_f64le)     // without converting to radians
        x60_f64le_rad: f64le = math.to_radians(x60_f64le); cos_x60_f64le_rad := math.cos(x60_f64le_rad); acos_x60_f64le_rad := math.acos(cos_x60_f64le_rad) // convert to radians first

            // convert acos() back to degrees
            invers_acos_x60:     f64le = math.to_degrees(acos_x60_f64le)
            invers_acos_x60_rad: f64le = math.to_degrees(acos_x60_f64le_rad)

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             acos_y_f64_pos_zero := math.acos(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             acos_y_f32_neg_zero := math.acos(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); acos_y_f16_pos_inf  := math.acos(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  acos_y_f32_zero_inf := math.acos(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); acos_y_f64_neg_inf  := math.acos(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); acos_y_f64be_nan    := math.acos(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); acos_y_f16le_nan    := math.acos(y_f16le_nan)    // NaN

        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(x30_f32, cos_x30_f32, acos_x30_f32)
    print_value_and_type(x30_f32_rad, cos_x30_f32_rad, acos_x30_f32_rad)

    fmt.println("")
    fmt.println("\t\t// convert acos() back to degrees")
    print_value_and_type_t(invers_acos_x30, tab=2)
    print_value_and_type_t(invers_acos_x30_rad, tab=2)

    fmt.println("")
    print_value_and_type(x60_f64le, cos_x60_f64le, acos_x60_f64le)
    print_value_and_type(x60_f64le_rad, cos_x60_f64le_rad, acos_x60_f64le_rad)

    fmt.println("")
    fmt.println("\t\t// convert acos() back to degrees")
    print_value_and_type_t(invers_acos_x60, tab=2)
    print_value_and_type_t(invers_acos_x60_rad, tab=2)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(acos_y_f64_pos_zero)
    print_value_and_type(acos_y_f32_neg_zero)
    print_value_and_type(acos_y_f16_pos_inf)
    print_value_and_type(acos_y_f32_zero_inf)
    print_value_and_type(acos_y_f64_neg_inf)
    print_value_and_type(acos_y_f64be_nan)
    print_value_and_type(acos_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_tan :: proc() {

    fmt.eprintln("\n========== math.tan() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return tangent of given input in radian.

**Only accept floats**

math.tan assumes input in radians.
    `)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

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

    y_f64_pos_zero: f64 = +0.0;             tan_y_f64_pos_zero := math.tan(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             tan_y_f32_neg_zero := math.tan(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); tan_y_f16_pos_inf  := math.tan(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  tan_y_f32_zero_inf := math.tan(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); tan_y_f64_neg_inf  := math.tan(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); tan_y_f64be_nan    := math.tan(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); tan_y_f16le_nan    := math.tan(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        math.tan(f16(30.0))
        math.tan(math.to_radians(f64(30.0)))
        math.tan(f16(60.0))
        math.tan(math.to_radians(f64(60.0)))

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             tan_y_f64_pos_zero := math.tan(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             tan_y_f32_neg_zero := math.tan(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); tan_y_f16_pos_inf  := math.tan(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  tan_y_f32_zero_inf := math.tan(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); tan_y_f64_neg_inf  := math.tan(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); tan_y_f64be_nan    := math.tan(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); tan_y_f16le_nan    := math.tan(y_f16le_nan)    // NaN
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(tan_x2_f16)
    print_value_and_type(tan_x2_f64_rad)
    print_value_and_type(tan_x60_f16)
    print_value_and_type(tan_x60_f64_rad)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(tan_y_f64_pos_zero)
    print_value_and_type(tan_y_f32_neg_zero)
    print_value_and_type(tan_y_f16_pos_inf)
    print_value_and_type(tan_y_f32_zero_inf)
    print_value_and_type(tan_y_f64_neg_inf)
    print_value_and_type(tan_y_f64be_nan)
    print_value_and_type(tan_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_atan :: proc() {

    fmt.eprintln("\n========== math.atan() ==================================\n")
    fmt.eprintln("/*")
    fmt.eprintln(`Return inverse of tangent (arctan) of given input.

**Only accept floats**

Relation with math.tan:

    x = tan(y)
    y = atan(x)

    For real result, x could be any real numbers,
    resulting single value that lies in following range(s)

        [-π/2, π/2] (in radians)
        [ -90,  90] (in degrees)

Note:
    Implementation of math.atan using math.atan2(y,x) where y is the input value,
    and x is set to 1. See math.atan2 for detail.
    `)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("For special cases related to math.atan2(x, 1)")
    fmt.eprintln(`
    atan2(  0, 1) = 0
    atan2( -0, 1) = - 0
    atan2(  ∞, 1) = π/2
    atan2( +∞, 1) = + π/2
    atan2( -∞, 1) = - π/2
    atan2(NaN, 1) = NaN
    `)

    fmt.eprintln(`Inputs:
- x: input value of type floats in radians
`)

    fmt.eprintln(`Output:
- x: ouput value that with same type of the input in radians
`)

    x30_f32:     f32 = 30.0;                     tan_x30_f32     := math.tan(x30_f32);     atan_x30_f32     := math.atan(tan_x30_f32)     // without converting to radians
    x30_f32_rad: f32 = math.to_radians(x30_f32); tan_x30_f32_rad := math.tan(x30_f32_rad); atan_x30_f32_rad := math.atan(tan_x30_f32_rad) // convert to radians first

    invers_atan_x30:       f32 = math.to_degrees(atan_x30_f32)
    invers_atan_x30_rad:   f32 = math.to_degrees(atan_x30_f32_rad)

    x60_f64le:     f64le = 60.0;                       tan_x60_f64le     := math.tan(x60_f64le);     atan_x60_f64le     := math.atan(tan_x60_f64le)     // without converting to radians
    x60_f64le_rad: f64le = math.to_radians(x60_f64le); tan_x60_f64le_rad := math.tan(x60_f64le_rad); atan_x60_f64le_rad := math.atan(tan_x60_f64le_rad) // convert to radians first

    invers_atan_x60:     f64le = math.to_degrees(atan_x60_f64le)
    invers_atan_x60_rad: f64le = math.to_degrees(atan_x60_f64le_rad)

    y_f64_pos_zero: f64 = +0.0;             atan_y_f64_pos_zero := math.atan(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             atan_y_f32_neg_zero := math.atan(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); atan_y_f16_pos_inf  := math.atan(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  atan_y_f32_zero_inf := math.atan(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); atan_y_f64_neg_inf  := math.atan(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); atan_y_f64be_nan    := math.atan(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); atan_y_f16le_nan    := math.atan(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        x30_f32:     f32 = 30.0;                     tan_x30_f32     := math.tan(x30_f32);     atan_x30_f32     := math.atan(tan_x30_f32)     // without converting to radians
        x30_f32_rad: f32 = math.to_radians(x30_f32); tan_x30_f32_rad := math.tan(x30_f32_rad); atan_x30_f32_rad := math.atan(tan_x30_f32_rad) // convert to radians first

            // convert atan() back to degrees
            invers_atan_x30:       f32 = math.to_degrees(atan_x30_f32)
            invers_atan_x30_rad:   f32 = math.to_degrees(atan_x30_f32_rad)

        x60_f64le:     f64le = 60.0;                       tan_x60_f64le     := math.tan(x60_f64le);     atan_x60_f64le     := math.atan(tan_x60_f64le)     // without converting to radians
        x60_f64le_rad: f64le = math.to_radians(x60_f64le); tan_x60_f64le_rad := math.tan(x60_f64le_rad); atan_x60_f64le_rad := math.atan(tan_x60_f64le_rad) // convert to radians first

            // convert atan() back to degrees
            invers_atan_x60:     f64le = math.to_degrees(atan_x60_f64le)
            invers_atan_x60_rad: f64le = math.to_degrees(atan_x60_f64le_rad)

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             atan_y_f64_pos_zero := math.atan(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             atan_y_f32_neg_zero := math.atan(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); atan_y_f16_pos_inf  := math.atan(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  atan_y_f32_zero_inf := math.atan(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); atan_y_f64_neg_inf  := math.atan(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); atan_y_f64be_nan    := math.atan(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); atan_y_f16le_nan    := math.atan(y_f16le_nan)    // NaN

        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(x30_f32, tan_x30_f32, atan_x30_f32)
    print_value_and_type(x30_f32_rad, tan_x30_f32_rad, atan_x30_f32_rad)

    fmt.println("")
    fmt.println("\t\t// convert atan() back to degrees")
    print_value_and_type_t(invers_atan_x30, tab=2)
    print_value_and_type_t(invers_atan_x30_rad, tab=2)

    fmt.println("")
    print_value_and_type(x60_f64le, tan_x60_f64le, atan_x60_f64le)
    print_value_and_type(x60_f64le_rad, tan_x60_f64le_rad, atan_x60_f64le_rad)

    fmt.println("")
    fmt.println("\t\t// convert atan() back to degrees")
    print_value_and_type_t(invers_atan_x60, tab=2)
    print_value_and_type_t(invers_atan_x60_rad, tab=2)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(atan_y_f64_pos_zero)
    print_value_and_type(atan_y_f32_neg_zero)
    print_value_and_type(atan_y_f16_pos_inf)
    print_value_and_type(atan_y_f32_zero_inf)
    print_value_and_type(atan_y_f64_neg_inf)
    print_value_and_type(atan_y_f64be_nan)
    print_value_and_type(atan_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_to_radians :: proc() {

    fmt.eprintln("\n========== math.to_radians() ==================================\n")
    fmt.eprintln("/*")
    fmt.println("Convert given input to radians.\n")
    fmt.println("**Only accept floats**.\n")
    fmt.println("Convertion is implemented by multipication of input and constant `math.RAD_PER_DEG`.\n")
    fmt.printfln("`math.RAD_PER_DEG` = %v.\n", math.RAD_PER_DEG)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

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

    y_f64_pos_zero: f64 = +0.0;             rad_y_f64_pos_zero := math.to_radians(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             rad_y_f32_neg_zero := math.to_radians(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); rad_y_f16_pos_inf  := math.to_radians(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  rad_y_f32_zero_inf := math.to_radians(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); rad_y_f64_neg_inf  := math.to_radians(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); rad_y_f64be_nan    := math.to_radians(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); rad_y_f16le_nan    := math.to_radians(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        math.to_radians(f16(30.0))
        math.to_radians(f64(30.0))
        math.to_radians(f16(60.0))
        math.to_radians(f64(60.0))

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             rad_y_f64_pos_zero := math.to_radians(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             rad_y_f32_neg_zero := math.to_radians(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); rad_y_f16_pos_inf  := math.to_radians(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  rad_y_f32_zero_inf := math.to_radians(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); rad_y_f64_neg_inf  := math.to_radians(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); rad_y_f64be_nan    := math.to_radians(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); rad_y_f16le_nan    := math.to_radians(y_f16le_nan)    // NaN
        `)

    fmt.eprintln(`Output:`)
    print_value_and_type(x30_f16_rad)
    print_value_and_type(x30_f64_rad)
    print_value_and_type(x60_f16_rad)
    print_value_and_type(x60_f64_rad)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(rad_y_f64_pos_zero)
    print_value_and_type(rad_y_f32_neg_zero)
    print_value_and_type(rad_y_f16_pos_inf)
    print_value_and_type(rad_y_f32_zero_inf)
    print_value_and_type(rad_y_f64_neg_inf)
    print_value_and_type(rad_y_f64be_nan)
    print_value_and_type(rad_y_f16le_nan)

    fmt.eprintln("*/")

}

ex_to_degrees :: proc() {

    fmt.eprintln("\n========== math.to_degrees() ==================================\n")
    fmt.eprintln("/*")
    fmt.println("Convert given input to degrees.\n")
    fmt.println("**Only accept floats**.\n")
    fmt.println("Convertion is implemented by multipication of input and constant `math.DEG_PER_RAD`.\n")
    fmt.printfln("`math.DEG_PER_RAD` = %v.\n", math.DEG_PER_RAD)
    fmt.eprintln("Beware of special cases i.e. `-0.0`, `+0.0`, `-Inf`, `+Inf`, and `Nan` (see examples).")
    fmt.eprintln("")

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

    y_f64_pos_zero: f64 = +0.0;             deg_y_f64_pos_zero := math.to_degrees(y_f64_pos_zero) // +0.0
    y_f32_neg_zero: f32 = -0.0;             deg_y_f32_neg_zero := math.to_degrees(y_f32_neg_zero) // -0.0
    y_f16_pos_inf:  f16 = math.inf_f16(+1); deg_y_f16_pos_inf  := math.to_degrees(y_f16_pos_inf)  // +Inf
    y_f32_zero_inf: f32 = math.inf_f32(0);  deg_y_f32_zero_inf := math.to_degrees(y_f32_zero_inf) // Inf
    y_f64_neg_inf:  f64 = math.inf_f64(-1); deg_y_f64_neg_inf  := math.to_degrees(y_f64_neg_inf)  // -Inf
    y_f64be_nan:  f64be = math.nan_f64be(); deg_y_f64be_nan    := math.to_degrees(y_f64be_nan)    // NaN
    y_f16le_nan:  f16le = math.nan_f16le(); deg_y_f16le_nan    := math.to_degrees(y_f16le_nan)    // NaN

    fmt.eprintln(`Example:
        math.to_degrees(f16(0.523598))
        math.to_degrees(f64(0.523598))
        math.to_degrees(f16(1.047197))
        math.to_degrees(f64(1.047197))

        // special cases. (see Float_Class and math.classify)
        y_f64_pos_zero: f64 = +0.0;             deg_y_f64_pos_zero := math.to_degrees(y_f64_pos_zero) // +0.0
        y_f32_neg_zero: f32 = -0.0;             deg_y_f32_neg_zero := math.to_degrees(y_f32_neg_zero) // -0.0
        y_f16_pos_inf:  f16 = math.inf_f16(+1); deg_y_f16_pos_inf  := math.to_degrees(y_f16_pos_inf)  // +Inf
        y_f32_zero_inf: f32 = math.inf_f32(0);  deg_y_f32_zero_inf := math.to_degrees(y_f32_zero_inf) // Inf
        y_f64_neg_inf:  f64 = math.inf_f64(-1); deg_y_f64_neg_inf  := math.to_degrees(y_f64_neg_inf)  // -Inf
        y_f64be_nan:  f64be = math.nan_f64be(); deg_y_f64be_nan    := math.to_degrees(y_f64be_nan)    // NaN
        y_f16le_nan:  f16le = math.nan_f16le(); deg_y_f16le_nan    := math.to_degrees(y_f16le_nan)    // NaN
        `)


    fmt.eprintln(`Output:`)
    print_value_and_type(x30_f16_rad)
    print_value_and_type(x30_f64_rad)
    print_value_and_type(x60_f16_rad)
    print_value_and_type(x60_f64_rad)

    fmt.eprintln("\n\t// special cases, (see Float_Class and math.classfiy)")
    print_value_and_type(deg_y_f64_pos_zero)
    print_value_and_type(deg_y_f32_neg_zero)
    print_value_and_type(deg_y_f16_pos_inf)
    print_value_and_type(deg_y_f32_zero_inf)
    print_value_and_type(deg_y_f64_neg_inf)
    print_value_and_type(deg_y_f64be_nan)
    print_value_and_type(deg_y_f16le_nan)

    fmt.eprintln("*/")

}
