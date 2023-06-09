import 'dart:async';

import 'package:isolates/isolates.dart';

Future<void> main(List<String> arguments) async {
  BigTask.start(BigTaskParams(n: 1000));
}
