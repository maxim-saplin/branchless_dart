# Testing branchless optimizations with Dart

## Building
- Windows: `dart compile exe .\branchless.dart`
- macOS: `dart compile exe branchless.dart`

## Running
- Windows: `.\branchless.exe`
- macOS: `./branchless.exe`

Compile command always creates a binary with .exe in the end, both macOS and Windows:)

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

## macOS, ARM

macOS 13.5, Dart 3.1.0, Apple M1 Pro

```
minBranchless and normal impl return same values: true
minBranchless2 and normal impl return same values: true
absBranchless and normal impl return same values: true
Execution time for min: 1176 milliseconds, 76
Execution time for min2: 1178 milliseconds, 76
Execution time for mathMin: 1180 milliseconds, 76
Execution time for branchlessMin: 2351 milliseconds, 76
Execution time for branchlessMin2: 2395 milliseconds, 76
Execution time for testAbs: 3142 milliseconds, 82
Execution time for testIntAbs: 3133 milliseconds, 82
Execution time for testAbsBranchless: 2351 milliseconds, 76
```