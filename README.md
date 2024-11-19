# a4z::commonCompilerWarnings

## About

This is a CMake interface library that exports a set of compiler warnings I find useful.

Every CMake project I have includes a place where compiler warnings are listed and applied.
This approach is redundant, and older projects often miss out on newer warnings without additional maintenance.

To address this, I’m maintaining these warnings in a separate library that can be consumed via your favorite package manager.

The set of warnings is not final and will evolve over time as newer compilers introduce more useful warnings.
Occasionally, I also learn new things about existing compilers that may refine the list.

This library does not claim to provide a perfect solution.
It represents a set of warnings that I believe are useful and a bare minimum for projects that aim to demonstrate—not just claim—a certain quality of implementation.

If you think anything should be added or changed, feel free to open an issue and share your thoughts. Thank you!

## Usage

### fetch_content

```cmake
include(FetchContent)
FetchContent_Declare(
  commonCompilerWarnings
  GIT_REPOSITORY https://github.com/a4z/commonCompilerWarnings.git
  GIT_TAG main
  OVERRIDE_FIND_PACKAGE
)
find_package(commonCompilerWarnings CONFIG REQUIRED)

# ...

add_executable(someapp main.cpp)
target_link_libraries(someapp PRIVATE a4z::commonCompilerWarnings)

```

A local vcpgk port will be added later
