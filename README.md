# 42-libasm

Recreation of the following functions in x86-64 assembly:
read, write, strlen, strcmp, strcpy, strdup

It passes the following tests:

https://github.com/vscabell/42libasm_tester

https://github.com/valentinllpz/Libasm_Unit_Tests

https://github.com/Tripouille/libasmTester

If you want to use it on a Linux system you need to use the proper syscalls and substitute __error for __errno_location
