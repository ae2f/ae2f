# gllvmfnclamp
> google clamps the llvm functions.

- OS:       Windows
- C/C++:    gcc/g++
- Builder:  Ninja
- ae2f_MAC_BUILD:   ON
- ae2f_IS_SHARED:   ON
- `clspv_core` is linked to `ae2fVK-Core`.
- `ae2fVK-Core` is linked to `ae2f-Ann`.

## What
- clspv_core depends on `LLVMModule` and `LLVM-git22`.  
- Both of two contain same symbol, which leads build to crash.

## Temporal fix
- Use Visual Studio 2022 for building instead.