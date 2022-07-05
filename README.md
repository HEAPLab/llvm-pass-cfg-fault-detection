# llvm-pass-cfg-fault-detection
LLVM ModulePass that adds code for performing CFG-fault detection at runtime.

### Notes
Assuming that the code to which apply the pass has been generated in C:
1. The functions marked as static are assumed to have only one entry point, i.e. it is not possible to reach them from a function different than main();
2. If a function is not marked as static the verification is performed only within the function itself;
3. The code works only with a patch that has to be applied to the `BasicBLock.cpp` file (see the related LLVM issue [here](https://github.com/llvm/llvm-project/issues/56305))
4. The callback function with signature `void cfg_err_detected()` is assumed to be present in the codebase, it is the function that is called as soon as a CFG fault is detected.

### Examples
An example of a C file compiled before and after the pass is present into the `examples` folder.
