class CoinbaseModel {
  final String? type;
  final int? sequence;
  final String? productId;
  final double? price;
  final double? open24h;
  final double? volume24h;
  final double? low24h;
  final double? high24h;
  final double? volume30d;
  final double? bestBid;
  final double? bestBidSize;
  final double? bestAsk;
  final double? bestAskSize;
  final String? side;
  final String? time;
  final int? tradeId;
  final double? lastSize;

  CoinbaseModel({
    this.type,
    this.sequence,
    this.productId,
    this.price,
    this.open24h,
    this.volume24h,
    this.low24h,
    this.high24h,
    this.volume30d,
    this.bestBid,
    this.bestBidSize,
    this.bestAsk,
    this.bestAskSize,
    this.side,
    this.time,
    this.tradeId,
    this.lastSize,
  });

  factory CoinbaseModel.fromJson(Map<String, dynamic> json) {
    return CoinbaseModel(
      type: json['type'],
      sequence: json['sequence'],
      productId: json['product_id'],
      price: double.tryParse(json['price']),
      open24h: double.tryParse(json['open_24h']),
      volume24h: double.tryParse(json['volume_24h']),
      low24h: double.tryParse(json['low_24h']),
      high24h: double.tryParse(json['high_24h']),
      volume30d: double.tryParse(json['volume_30d']),
      bestBid: double.tryParse(json['best_bid']),
      bestBidSize: double.tryParse(json['best_bid_size']),
      bestAsk: double.tryParse(json['best_ask']),
      bestAskSize: double.tryParse(json['best_ask_size']),
      side: json['side'],
      time: json['time'],
      tradeId: json['trade_id'],
      lastSize: double.tryParse(json['last_size']),
    );
  }
}
