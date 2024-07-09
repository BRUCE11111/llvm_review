//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// WARNING: This test was generated by generate_feature_test_macro_components.py
// and should not be edited manually.
//
// clang-format off

// <new>

// Test the feature test macros defined by <new>

/*  Constant                                Value
    __cpp_lib_constexpr_new                 202406L [C++26]
    __cpp_lib_destroying_delete             201806L [C++20]
    __cpp_lib_hardware_interference_size    201703L [C++17]
    __cpp_lib_launder                       201606L [C++17]
*/

#include <new>
#include "test_macros.h"

#if TEST_STD_VER < 14

# ifdef __cpp_lib_constexpr_new
#   error "__cpp_lib_constexpr_new should not be defined before c++26"
# endif

# ifdef __cpp_lib_destroying_delete
#   error "__cpp_lib_destroying_delete should not be defined before c++20"
# endif

# ifdef __cpp_lib_hardware_interference_size
#   error "__cpp_lib_hardware_interference_size should not be defined before c++17"
# endif

# ifdef __cpp_lib_launder
#   error "__cpp_lib_launder should not be defined before c++17"
# endif

#elif TEST_STD_VER == 14

# ifdef __cpp_lib_constexpr_new
#   error "__cpp_lib_constexpr_new should not be defined before c++26"
# endif

# ifdef __cpp_lib_destroying_delete
#   error "__cpp_lib_destroying_delete should not be defined before c++20"
# endif

# ifdef __cpp_lib_hardware_interference_size
#   error "__cpp_lib_hardware_interference_size should not be defined before c++17"
# endif

# ifdef __cpp_lib_launder
#   error "__cpp_lib_launder should not be defined before c++17"
# endif

#elif TEST_STD_VER == 17

# ifdef __cpp_lib_constexpr_new
#   error "__cpp_lib_constexpr_new should not be defined before c++26"
# endif

# ifdef __cpp_lib_destroying_delete
#   error "__cpp_lib_destroying_delete should not be defined before c++20"
# endif

# if !defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))
#   ifndef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should be defined in c++17"
#   endif
#   if __cpp_lib_hardware_interference_size != 201703L
#     error "__cpp_lib_hardware_interference_size should have the value 201703L in c++17"
#   endif
# else
#   ifdef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should not be defined when the requirement '!defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))' is not met!"
#   endif
# endif

# ifndef __cpp_lib_launder
#   error "__cpp_lib_launder should be defined in c++17"
# endif
# if __cpp_lib_launder != 201606L
#   error "__cpp_lib_launder should have the value 201606L in c++17"
# endif

#elif TEST_STD_VER == 20

# ifdef __cpp_lib_constexpr_new
#   error "__cpp_lib_constexpr_new should not be defined before c++26"
# endif

# if TEST_STD_VER > 17 && defined(__cpp_impl_destroying_delete) && __cpp_impl_destroying_delete >= 201806L
#   ifndef __cpp_lib_destroying_delete
#     error "__cpp_lib_destroying_delete should be defined in c++20"
#   endif
#   if __cpp_lib_destroying_delete != 201806L
#     error "__cpp_lib_destroying_delete should have the value 201806L in c++20"
#   endif
# else
#   ifdef __cpp_lib_destroying_delete
#     error "__cpp_lib_destroying_delete should not be defined when the requirement 'TEST_STD_VER > 17 && defined(__cpp_impl_destroying_delete) && __cpp_impl_destroying_delete >= 201806L' is not met!"
#   endif
# endif

# if !defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))
#   ifndef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should be defined in c++20"
#   endif
#   if __cpp_lib_hardware_interference_size != 201703L
#     error "__cpp_lib_hardware_interference_size should have the value 201703L in c++20"
#   endif
# else
#   ifdef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should not be defined when the requirement '!defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))' is not met!"
#   endif
# endif

# ifndef __cpp_lib_launder
#   error "__cpp_lib_launder should be defined in c++20"
# endif
# if __cpp_lib_launder != 201606L
#   error "__cpp_lib_launder should have the value 201606L in c++20"
# endif

#elif TEST_STD_VER == 23

# ifdef __cpp_lib_constexpr_new
#   error "__cpp_lib_constexpr_new should not be defined before c++26"
# endif

# if TEST_STD_VER > 17 && defined(__cpp_impl_destroying_delete) && __cpp_impl_destroying_delete >= 201806L
#   ifndef __cpp_lib_destroying_delete
#     error "__cpp_lib_destroying_delete should be defined in c++23"
#   endif
#   if __cpp_lib_destroying_delete != 201806L
#     error "__cpp_lib_destroying_delete should have the value 201806L in c++23"
#   endif
# else
#   ifdef __cpp_lib_destroying_delete
#     error "__cpp_lib_destroying_delete should not be defined when the requirement 'TEST_STD_VER > 17 && defined(__cpp_impl_destroying_delete) && __cpp_impl_destroying_delete >= 201806L' is not met!"
#   endif
# endif

# if !defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))
#   ifndef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should be defined in c++23"
#   endif
#   if __cpp_lib_hardware_interference_size != 201703L
#     error "__cpp_lib_hardware_interference_size should have the value 201703L in c++23"
#   endif
# else
#   ifdef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should not be defined when the requirement '!defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))' is not met!"
#   endif
# endif

# ifndef __cpp_lib_launder
#   error "__cpp_lib_launder should be defined in c++23"
# endif
# if __cpp_lib_launder != 201606L
#   error "__cpp_lib_launder should have the value 201606L in c++23"
# endif

#elif TEST_STD_VER > 23

# if !defined(_LIBCPP_VERSION)
#   ifndef __cpp_lib_constexpr_new
#     error "__cpp_lib_constexpr_new should be defined in c++26"
#   endif
#   if __cpp_lib_constexpr_new != 202406L
#     error "__cpp_lib_constexpr_new should have the value 202406L in c++26"
#   endif
# else // _LIBCPP_VERSION
#   ifdef __cpp_lib_constexpr_new
#     error "__cpp_lib_constexpr_new should not be defined because it is unimplemented in libc++!"
#   endif
# endif

# if TEST_STD_VER > 17 && defined(__cpp_impl_destroying_delete) && __cpp_impl_destroying_delete >= 201806L
#   ifndef __cpp_lib_destroying_delete
#     error "__cpp_lib_destroying_delete should be defined in c++26"
#   endif
#   if __cpp_lib_destroying_delete != 201806L
#     error "__cpp_lib_destroying_delete should have the value 201806L in c++26"
#   endif
# else
#   ifdef __cpp_lib_destroying_delete
#     error "__cpp_lib_destroying_delete should not be defined when the requirement 'TEST_STD_VER > 17 && defined(__cpp_impl_destroying_delete) && __cpp_impl_destroying_delete >= 201806L' is not met!"
#   endif
# endif

# if !defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))
#   ifndef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should be defined in c++26"
#   endif
#   if __cpp_lib_hardware_interference_size != 201703L
#     error "__cpp_lib_hardware_interference_size should have the value 201703L in c++26"
#   endif
# else
#   ifdef __cpp_lib_hardware_interference_size
#     error "__cpp_lib_hardware_interference_size should not be defined when the requirement '!defined(_LIBCPP_VERSION) || (defined(__GCC_DESTRUCTIVE_SIZE) && defined(__GCC_CONSTRUCTIVE_SIZE))' is not met!"
#   endif
# endif

# ifndef __cpp_lib_launder
#   error "__cpp_lib_launder should be defined in c++26"
# endif
# if __cpp_lib_launder != 201606L
#   error "__cpp_lib_launder should have the value 201606L in c++26"
# endif

#endif // TEST_STD_VER > 23
