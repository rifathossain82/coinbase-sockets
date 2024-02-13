import 'package:coinbase_sockets/providers/coinbase_provider.dart';
import 'package:coinbase_sockets/ui/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CoinbaseApp());
}

class CoinbaseApp extends StatelessWidget {
  late final CoinbaseProvider _provider;

  CoinbaseApp({Key? key})
      : _provider = CoinbaseProvider(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinbase Sockets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(provider: _provider),
    );
  }
}
