# a4z::common-compiler-warnings

## About

This is a CMake interface library that does export a set of - for me - useful compiler warnings.

Every CMake project I have has a place where compiler warnings are listed and applied.
This is redundant, and older projects do not get the latest warnings without extra maintenance.

Therefor my next attempt is maintaining those warnings in an extra library that can be consumed via someones favorite package manager.

The set of warnings is not final and will grow over time, since newer compilers ad more and more useful warnings. And from time to time I also learn something new about existing compilers.

The list does not claim to be the final solution. It is what I feel as useful set of warnings, and the bare minimum that projects should use if they do not only want to claim, but also prove, a certain quality of implementation.

If you think anything should be added or changed, please feel free to open an issue and tell me what. Thank you!
