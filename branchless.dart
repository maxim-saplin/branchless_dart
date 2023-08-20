import 'dart:math' as mt;

const randomNumCount = 50000;
List<int> randomList = generateRandomList(randomNumCount);
// To make sure compiler doesn't `optimize out` (complete remove) calls to the tested function using this global var to keep each calls result
int x = 0;

void main(List<String> arguments) {
  validateMinBranchless();
  validateMinBranchless2();
  validateAbsBranchless();
  timeFunction(() => testMin(randomList), randomNumCount, 'min');
  timeFunction(() => testMin2(randomList), randomNumCount, 'min2');
  timeFunction(() => testMathMin(randomList), randomNumCount, 'mathMin');
  timeFunction(
      () => testMinBranchless(randomList), randomNumCount, 'branchlessMin');
  timeFunction(
      () => testMinBranchless2(randomList), randomNumCount, 'branchlessMin2');
  timeFunction(() => testAbs(randomList), randomNumCount, 'testAbs');
  timeFunction(() => testIntAbs(randomList), randomNumCount, 'testIntAbs');
  timeFunction(
      () => testAbsBranchless(randomList), randomNumCount, 'testAbsBranchless');
}

List<int> generateRandomList(int count) {
  var rand = mt.Random();
  List<int> randomList = [];
  for (int i = 0; i < count; i++) {
    randomList.add(rand.nextInt(100));
  }
  return randomList;
}

void validateMinBranchless() {
  var flag = true;
  for (var i = 0; i < randomNumCount - 1; i++) {
    var x = min(randomList[i], randomList[i + 1]);
    var y = minBranchless(randomList[i], randomList[i + 1]);
    if (x != y) {
      flag = false;
    }
  }

  print('minBranchless and normal impl return same values: $flag');
}

void validateMinBranchless2() {
  var flag = true;
  for (var i = 0; i < randomNumCount - 1; i++) {
    var x = min(randomList[i], randomList[i + 1]);
    var y = minBranchless2(randomList[i], randomList[i + 1]);
    if (x != y) {
      flag = false;
    }
  }

  print('minBranchless2 and normal impl return same values: $flag');
}

void validateAbsBranchless() {
  var flag = true;
  for (var i = 0; i < randomNumCount; i++) {
    var x = abs(randomList[i]);
    var y = absBranchless(randomList[i]);
    if (x != y) {
      flag = false;
    }
  }

  print('absBranchless and normal impl return same values: $flag');
}

void timeFunction(
    void Function() function, int iterations, String functionName) {
  x = 0;
  final sw = Stopwatch(); // Start a stopwatch to measure execution time
  sw.start(); // Start the stopwatch

  for (var i = 0; i < iterations; i++) {
    function();
  }

  sw.stop(); // Stop the stopwatch
  print(
      'Execution time for $functionName: ${sw.elapsedMilliseconds} milliseconds, $x');
}

int min(int a, int b) {
  if (a < b) {
    return a;
  } else {
    return b;
  }
}

int min2(int a, int b) {
  return a < b ? a : b;
}

int minBranchless(int a, int b) {
  return a + ((b - a) & ((b - a) >> 63));
}

int minBranchless2(int a, int b) {
  var m1 = (a - b) >>> 63;
  var m2 = m1 ^ 1;
  return a * m1 + b * m2;
}

void testMin(List<int> vals) {
  for (int i = 0; i < vals.length - 1; i++) {
    x = min(vals[i], vals[i]);
  }
}

void testMin2(List<int> vals) {
  for (int i = 0; i < vals.length - 1; i++) {
    x = min2(vals[i], vals[i]);
  }
}

void testMathMin(List<int> vals) {
  for (int i = 0; i < vals.length - 1; i++) {
    x = mt.min(vals[i], vals[i]);
  }
}

void testMinBranchless(List<int> vals) {
  for (int i = 0; i < vals.length - 1; i++) {
    x = minBranchless(vals[i], vals[i]);
  }
}

void testMinBranchless2(List<int> vals) {
  for (int i = 0; i < vals.length - 1; i++) {
    x = minBranchless2(vals[i], vals[i]);
  }
}

int abs(int a) {
  return a >= 0 ? a : -a;
}

int absBranchless(int a) {
  int mask = a >>> 63;
  a ^= mask;
  a -= mask;
  return a;
}

void testAbs(List<int> vals) {
  for (int i = 0; i < vals.length; i++) {
    x = abs(vals[i]);
  }
}

void testIntAbs(List<int> vals) {
  for (int i = 0; i < vals.length; i++) {
    x = vals[i].abs();
  }
}

void testAbsBranchless(List<int> vals) {
  for (int i = 0; i < vals.length - 1; i++) {
    x = absBranchless(vals[i]);
  }
}
