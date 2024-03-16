import 'dart:convert';
ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
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
      this.lastSize,});

  ProductModel.fromJson(dynamic json) {
    type = json['type'];
    sequence = json['sequence'];
    productId = json['product_id'];
    price = json['price'];
    open24h = json['open_24h'];
    volume24h = json['volume_24h'];
    low24h = json['low_24h'];
    high24h = json['high_24h'];
    volume30d = json['volume_30d'];
    bestBid = json['best_bid'];
    bestBidSize = json['best_bid_size'];
    bestAsk = json['best_ask'];
    bestAskSize = json['best_ask_size'];
    side = json['side'];
    time = json['time'];
    tradeId = json['trade_id'];
    lastSize = json['last_size'];
  }
  String? type;
  int? sequence;
  String? productId;
  String? price;
  String? open24h;
  String? volume24h;
  String? low24h;
  String? high24h;
  String? volume30d;
  String? bestBid;
  String? bestBidSize;
  String? bestAsk;
  String? bestAskSize;
  String? side;
  String? time;
  int? tradeId;
  String? lastSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['sequence'] = sequence;
    map['product_id'] = productId;
    map['price'] = price;
    map['open_24h'] = open24h;
    map['volume_24h'] = volume24h;
    map['low_24h'] = low24h;
    map['high_24h'] = high24h;
    map['volume_30d'] = volume30d;
    map['best_bid'] = bestBid;
    map['best_bid_size'] = bestBidSize;
    map['best_ask'] = bestAsk;
    map['best_ask_size'] = bestAskSize;
    map['side'] = side;
    map['time'] = time;
    map['trade_id'] = tradeId;
    map['last_size'] = lastSize;
    return map;
  }

}