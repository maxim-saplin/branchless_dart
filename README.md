# Testing branchless optimizations with Dart

## Building
`dart compile exe .\branchless.dart`

## Running
`.\branchless.exe`
- compile comand always creates a binary with .exe in the end, both macOS and Windows:)

# Results

## Windows, x86

Windows 11, Dart 3.1.0, Intel Core i5-8257U

```
minBranchless and normal impl return same values: true
minBranchless2 and normal impl return same values: true
absBranchless and normal impl return same values: true
Execution time for min: 1372 milliseconds, 75
Execution time for min2: 1368 milliseconds, 75
Execution time for mathMin: 1379 milliseconds, 75
Execution time for branchlessMin: 4058 milliseconds, 75
Execution time for branchlessMin2: 4571 milliseconds, 75
Execution time for testAbs: 4033 milliseconds, 47
Execution time for testIntAbs: 4794 milliseconds, 47
Execution time for testAbsBranchless: 4744 milliseconds, 75
```