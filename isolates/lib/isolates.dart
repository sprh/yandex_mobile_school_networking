class BigTaskParams {
  final int n;

  const BigTaskParams({
    required this.n,
  });
}

class BigTask {
  static void start(BigTaskParams params) {
    print('Start big task');
    int result = 0;
    for (int i = 1; i < params.n; ++i) {
      for (int j = 1; j < params.n; ++j) {
        result += i * j;
        print(result);
      }
    }

    print('End big task');
  }
}
