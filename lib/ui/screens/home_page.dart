import 'package:coinbase_sockets/models/coinbase_model.dart';
import 'package:coinbase_sockets/providers/coinbase_provider.dart';
import 'package:coinbase_sockets/ui/widgets/coin_base_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.provider}) : super(key: key);

  final CoinbaseProvider provider;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    widget.provider.openBitcoin();
  }

  @override
  void dispose() {
    widget.provider.closeBitcoin();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coinbase Sockets'),
      ),
      body: StreamBuilder<CoinbaseModel>(
        stream: widget.provider.bitcoinStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            return CoinbaseWidget(coinbase: snapshot.data!);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(
              child: Text('No more data'),
            );
          }

          return const Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }
}
