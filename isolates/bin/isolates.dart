import 'dart:async';
import 'dart:isolate';

import 'package:isolates/isolates.dart';

late final Isolate _isolate;
late final StreamSubscription _onExitStreamSubscription;
late final StreamSubscription _onErrorStreamSubscription;
late final StreamSubscription _onResultStreamSubscription;

Future<void> main(List<String> arguments) async {
  final onExitReceivePort = ReceivePort();
  final onErrorReceivePort = ReceivePort();
  final onResultReceivePort = ReceivePort();

  _isolate = await Isolate.spawn<BigTaskParams>(
    (param) => BigTask.start(param),
    BigTaskParams(n: 100, sendPort: onResultReceivePort.sendPort),
    onExit: onExitReceivePort.sendPort,
    // onError: onErrorReceivePort.sendPort,
    errorsAreFatal: false,
  );

  _onExitStreamSubscription = onExitReceivePort.listen(
    (message) => _onExit(),
  );
  _onErrorStreamSubscription = onErrorReceivePort.listen(
    (message) => print("on Error: $message"),
  );
  _onResultStreamSubscription = onResultReceivePort.listen(
    (message) => print("ON RESULT $message"),
  );
}

void _onExit() {
  _onExitStreamSubscription.cancel();
  _onErrorStreamSubscription.cancel();
  _onResultStreamSubscription.cancel();
  _isolate.kill();
}
