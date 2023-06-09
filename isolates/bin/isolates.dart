import 'dart:isolate';

import 'package:isolates/isolates.dart';

late final Isolate isolate;

Future<void> main(List<String> arguments) async {
  BigTask.start(BigTaskParams(n: 1000));
}
