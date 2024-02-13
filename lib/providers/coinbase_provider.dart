import 'dart:async';
import 'dart:convert';
import 'package:coinbase_sockets/models/coinbase_model.dart';
import 'package:coinbase_sockets/models/subscription_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

/// Manages opening and closing the sockets
class CoinbaseProvider {
  late final WebSocketChannel _btcWebsocket;

  static const _btcProduct = "BTC-EUR";

  CoinbaseProvider()
      : _btcWebsocket = WebSocketChannel.connect(
          Uri.parse('wss://ws-feed.pro.coinbase.com'),
        );

  Stream<CoinbaseModel> get bitcoinStream => _btcWebsocket.stream
      .map<CoinbaseModel>(
          (value) => CoinbaseModel.fromJson(jsonDecode(value)))
      .skipWhile((element) => element.productId != _btcProduct);

  void openBitcoin() {
    _btcWebsocket.sink.add(
      jsonEncode(
        SubscriptionModel(
          type: 'subscribe',
          channels: [
            Channel(name: 'ticker', productIds: [_btcProduct])
          ],
        ).toJson(),
      ),
    );
  }

  void closeBitcoin() {
    _btcWebsocket.sink.close(status.goingAway);
  }
}
