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
