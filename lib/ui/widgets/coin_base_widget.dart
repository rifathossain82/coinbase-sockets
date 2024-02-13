import 'package:coinbase_sockets/helper/logger.dart';
import 'package:coinbase_sockets/models/coinbase_model.dart';
import 'package:flutter/material.dart';

class CoinbaseWidget extends StatelessWidget {
  final CoinbaseModel coinbase;

  const CoinbaseWidget({
    super.key,
    required this.coinbase,
  });

  @override
  Widget build(BuildContext context) {
    Log.debug('Coinbase Latest Price: ${coinbase.price}');
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _RowTextWidget(title: 'Type', value: '${coinbase.type}'),
              _RowTextWidget(title: 'Trade Id', value: '${coinbase.tradeId}'),
              _RowTextWidget(title: 'Product Id', value: '${coinbase.productId}'),
              _RowTextWidget(title: 'Price', value: '${coinbase.price}'),
              _RowTextWidget(title: 'Best Ask', value: '${coinbase.bestAsk}'),
              _RowTextWidget(title: 'Best Ask Size', value: '${coinbase.bestAskSize}'),
              _RowTextWidget(title: 'Best Bid', value: '${coinbase.bestBid}'),
              _RowTextWidget(title: 'Best Bid Size', value: '${coinbase.bestBidSize}'),
              _RowTextWidget(title: 'Last Size', value: '${coinbase.lastSize}'),
              _RowTextWidget(title: 'Sequence', value: '${coinbase.sequence}'),
              _RowTextWidget(title: 'Side', value: '${coinbase.side}'),
              _RowTextWidget(title: 'High 24h', value: '${coinbase.high24h}'),
              _RowTextWidget(title: 'Low 24h', value: '${coinbase.low24h}'),
              _RowTextWidget(title: 'Open 24h', value: '${coinbase.open24h}'),
              _RowTextWidget(title: 'Volume 24h', value: '${coinbase.volume24h}'),
              _RowTextWidget(title: 'Volume 30d', value: '${coinbase.volume30d}'),
              _RowTextWidget(title: 'Time', value: '${coinbase.time}'),
            ],
          ),
        ),
      ),
    );
  }
}

class _RowTextWidget extends StatelessWidget {
  final String title;
  final String value;

  const _RowTextWidget({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
