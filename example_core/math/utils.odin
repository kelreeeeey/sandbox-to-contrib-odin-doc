package example_math

import "core:fmt"
import "base:intrinsics"

print_value_and_type_1 :: proc(x:$T) where intrinsics.type_is_numeric(T) {
    fmt.eprintfln("\t%v // `%v`", x, typeid_of(type_of(x)))
}

print_value_and_type_2 :: proc(x, y:$T) where intrinsics.type_is_numeric(T) {
    tx := typeid_of(type_of(x))
    ty := typeid_of(type_of(y))
    fmt.eprintfln("\t%v; %v // `%v`; `%v`", x, y, tx, ty)
}

print_value_and_type_3 :: proc(x, y, z:$T) where intrinsics.type_is_numeric(T) {
    tx := typeid_of(type_of(x))
    ty := typeid_of(type_of(y))
    tz := typeid_of(type_of(z))
    fmt.eprintfln("\t%v; %v; %v // `%v`; `%v`; `%v`", x, y, z, tx, ty, tz)
}

print_value_and_type :: proc {
    print_value_and_type_1,
    print_value_and_type_2,
    print_value_and_type_3,
}

print_value_and_type_1_t :: proc(x:$T, tab:int=1) where intrinsics.type_is_float(T){
    if tab == 1 {fmt.eprint("\t")}
    else if tab == 2 {fmt.eprint("\t\t")}
    else if tab == 3 {fmt.eprint("\t\t\t")}
    else {fmt.eprint("\t\t\t")}
    fmt.eprintfln("%v // `%v`", x, typeid_of(type_of(x)))
}

print_value_and_type_2_t :: proc(x, y:$T, tab:int=1) where intrinsics.type_is_float(T) {
    if tab == 1 {fmt.eprint("\t")}
    else if tab == 2 {fmt.eprint("\t\t")}
    else if tab == 3 {fmt.eprint("\t\t\t")}
    else {fmt.eprint("\t\t\t")}
    tx := typeid_of(type_of(x))
    ty := typeid_of(type_of(y))
    fmt.eprintfln("%v; %v // `%v`; `%v`", x, y, tx, ty)
}

print_value_and_type_3_t :: proc(x, y, z:$T, tab:int=1) where intrinsics.type_is_float(T) {
    if tab == 1 {fmt.eprint("\t")}
    else if tab == 2 {fmt.eprint("\t\t")}
    else if tab == 3 {fmt.eprint("\t\t\t")}
    else {fmt.eprint("\t\t\t")}
    tx := typeid_of(type_of(x))
    ty := typeid_of(type_of(y))
    tz := typeid_of(type_of(z))
    fmt.eprintfln("%v; %v; %v // `%v`; `%v`; `%v`", x, y, z, tx, ty, tz)
}

print_value_and_type_t :: proc {
    print_value_and_type_1_t,
    print_value_and_type_2_t,
    print_value_and_type_3_t,
}
