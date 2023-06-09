import 'dart:isolate';

class BigTaskParams {
  final int n;
  final SendPort sendPort;

  const BigTaskParams({
    required this.n,
    required this.sendPort,
  });
}

class BigTask {
  static void start(BigTaskParams params) {
    print('Start big task');
    if (params.n <= 100) {
      throw Exception('n <= 100');
    }
    int result = 0;
    for (int i = 1; i < params.n; ++i) {
      for (int j = 1; j < params.n; ++j) {
        result += i * j;
        print(result);
      }
    }

    print('End big task');
    params.sendPort.send(result);
  }
}
