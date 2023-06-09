import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class BTCPriceWidget extends StatefulWidget {
  const BTCPriceWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BTCPriceWidgetState();
}

class _BTCPriceWidgetState extends State<BTCPriceWidget> {
  static const websocketUrl = 'wss://stream.binance.com:9443/ws/btcusdt@trade';
  static const priceKey = 'p';

  double? price;
  Color? priceColor;

  WebSocket? webSocket;
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  Future<void> _connect() async {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return price == null
        ? const CircularProgressIndicator()
        : Text(
            price.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: priceColor,
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();

    webSocket?.close();
    subscription?.cancel();
  }
}
