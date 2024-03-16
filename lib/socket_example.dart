import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_web_socket_g9/models/product_model.dart';
import 'package:learn_web_socket_g9/service/socket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketExample extends StatefulWidget {
  const SocketExample({super.key});

  @override
  State<SocketExample> createState() => _SocketExampleState();
}

class _SocketExampleState extends State<SocketExample> {


  @override
  void initState() {
    SocketService.init().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SocketService.isLoading ?StreamBuilder(
          stream: SocketService.stream,
          builder: (_, snapshot){
            if(snapshot.hasData){
              return productView(snapshot);
            }else{
              return const SizedBox.shrink();
            }
          },
        ):const Center(
            child: CircularProgressIndicator()
        ),
      )
    );
  }


  @override
  void dispose() {
    SocketService.sink.close();
    super.dispose();
  }
}


Widget productView(AsyncSnapshot snapshot){
  ProductModel productModel = ProductModel();
  productModel = ProductModel.fromJson(jsonDecode(snapshot.data));
  return ListTile(
    tileColor: Colors.blueGrey,
    selectedColor: Colors.blueGrey,
    selected: true,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text("TYPE: "),
            Text(productModel.type.toString())
          ],
        ),
        Row(
          children: [
            const Text("Sequence: "),
            Text(productModel.sequence.toString())
          ],
        ),
        Row(
          children: [
            const Text("PRICE: "),
            Text(productModel.price.toString())
          ],
        ),
        Row(
          children: [
            const Text("PRODUCT ID: "),
            Text(productModel.productId.toString())
          ],
        )
      ],
    ),
  );
}
