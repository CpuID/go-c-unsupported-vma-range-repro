*go-c-unsupported-vma-range-repro*

# Summary

Reproduction of bug found when building https://github.com/ZigZagT/fluent-bit-go-redis-output (in Docker), specifically for `arm64` cross-compiling using an `amd64` Github Actions runner.

This will be used to provide evidence to upstream projects when filing bug report/s.

# The Original Error

**NOTE: I build the fork from `ZigZagT` as it has some desired fixes in it, but `go.mod` still defines the project as from `majst01`**

```
 > [linux/arm64 builder 5/5] RUN make:
...
...
2.590 go: downloading gopkg.in/yaml.v3 v3.0.1
589.6 FATAL: ThreadSanitizer: unsupported VMA range
589.6 FATAL: Found 47 - Supported 48
589.6 exit status 66
589.6 FAIL	github.com/majst01/fluent-bit-go-redis-output	0.068s
589.8 make: *** [Makefile:17: test] Error 1
```
