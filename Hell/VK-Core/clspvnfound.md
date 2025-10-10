# clspvnfound
> clspv is not found

- OS:       Windows
- C/C++:    MSVC
- Builder:  Visual Studio 17 2022
- ae2f_MAC_BUILD:   OFF
- ae2f_IS_SHARED:   ON
- `clspv_core` is linked to `ae2fVK-Core`.
- `ae2fVK-Core` is linked to `ae2f-Ann`.

## What
- `clspv_core.dll` is not linked to other objects properly which depends on it.
- Thus multiple programmes causes "dll not found" error.

## Temporal fix
> Move `clspv_core.dll`, `clspv_core.lib`, `clspv_core.pdb` typically located under `$build/$submod/google/clspv` to wherever they are needed.