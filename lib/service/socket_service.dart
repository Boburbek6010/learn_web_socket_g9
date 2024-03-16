import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/product_model.dart';

// @immutable
class SocketService{
  // const SocketService._();
  static final _url = Uri.parse("wss://ws-feed.exchange.coinbase.com");
  static final _channel = WebSocketChannel.connect(_url);
  static final stream = _channel.stream.asBroadcastStream();
  static final sink = _channel.sink;
  static const Map<String, dynamic> message = <String, dynamic>{
    "type": "subscribe",
    "product_ids": [
      "ETH-USD",
      "ETH-EUR"
    ],
    "channels": [
      "ticker"
    ]
  };
  static bool isLoading = false;

  static Future<void> init()async{
    isLoading = false;
    await _channel.ready;
    _channel.sink.add(jsonEncode(message));
    isLoading = true;
  }

}