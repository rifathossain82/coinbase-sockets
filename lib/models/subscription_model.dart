class SubscriptionModel {
  String? type;
  List<Channel>? channels;

  SubscriptionModel({this.type, this.channels});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      type: json['type'],
      channels: json['channels'] != null
          ? (json['channels'] as List)
          .map((channel) => Channel.fromJson(channel))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (channels != null) {
      data['channels'] = channels!.map((channel) => channel.toJson()).toList();
    }
    return data;
  }
}

class Channel {
  String? name;
  List<String>? productIds;
  dynamic accountIds;

  Channel({this.name, this.productIds, this.accountIds});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      name: json['name'],
      productIds: json['product_ids'] != null ? List<String>.from(json['product_ids']) : null,
      accountIds: json['account_ids'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['product_ids'] = productIds;
    data['account_ids'] = accountIds;
    return data;
  }
}
