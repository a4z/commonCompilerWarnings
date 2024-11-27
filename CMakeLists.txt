cmake_minimum_required(VERSION 3.29)
project (commonCompilerWarnings VERSION 0.9.1)

option(commonCompilerWarnings_NO_INSTALL  "Skip the installation process" OFF)

add_library(commonCompilerWarnings INTERFACE)
target_compile_options(commonCompilerWarnings
  INTERFACE
    $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:GNU>,$<CXX_COMPILER_ID:AppleClang>>:
      -Wall -Wextra -pedantic
      -Wdeprecated
      -Wformat-security
      -Wimplicit-fallthrough
      -Wmissing-braces
      -Wmissing-field-initializers
      -Wnon-virtual-dtor
      -Wnull-dereference
      -Wold-style-cast
      -Wparentheses
      -Wpointer-arith
      -Wredundant-decls
      -Wreturn-type
      -Wsequence-point
      -Wshadow
      -Wswitch
      -Wuninitialized
      -Wunused-function
      -Wunused-variable
      -Wconversion
      -Wsign-conversion
      -Wsign-promo
      -Wfloat-conversion

# want that only for protocols where memcp on stucts in used,
# so not a common warning but needs to be added extra where needed
#      # -Wpadded

      >

    $<$<CXX_COMPILER_ID:Clang>: -ferror-limit=3>

    $<$<CXX_COMPILER_ID:GNU>: -Wduplicated-branches
                              -Wduplicated-cond
                              -Wlogical-op
                              -Wcast-align
                              >

    # more
    $<$<CXX_COMPILER_ID:MSVC>:/W4>

)

add_library(a4z::commonCompilerWarnings ALIAS commonCompilerWarnings)

if(NOT commonCompilerWarnings_NO_INSTALL)
    include(cmake/install.cmake)
endif()
