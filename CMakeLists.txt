cmake_minimum_required(VERSION 3.30)
project (commonCompilerWarnings VERSION 0.9.1)

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

include(GNUInstallDirs)

install(TARGETS commonCompilerWarnings EXPORT commonCompilerWarningsTargets)

install(EXPORT commonCompilerWarningsTargets
    FILE commonCompilerWarningsTargets.cmake
    NAMESPACE a4z::
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/commonCompilerWarningsConfigVersion.cmake
    COMPATIBILITY AnyNewerVersion
)
configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/commonCompilerWarningsConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/commonCompilerWarningsConfig.cmake
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
)
install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/commonCompilerWarningsConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/commonCompilerWarningsConfigVersion.cmake
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
)
