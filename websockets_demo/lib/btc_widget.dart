import 'package:flutter/material.dart';
import 'package:websockets_demo/btc_price_widget.dart';

class BTCWidget extends StatelessWidget {
  const BTCWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(198, 232, 232, 146),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/btc.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              "BTCUSDT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),
            const BTCPriceWidget(),
          ],
        ),
      ),
    );
  }
}
