import 'package:flutter/material.dart';
import 'package:learn_web_socket_g9/socket_example.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SocketExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  final channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot){
                return _showData(snapshot);
              },
            )
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: "Type message...",
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 70,
                  height: 70,
                  shape: const CircleBorder(),
                  color: Colors.blueGrey,
                  onPressed: (){
                    channel.sink.add(controller.text);
                    controller.clear();
                  },
                  child: const Text("SEND"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    channel.sink.close();
    controller.dispose();
    super.dispose();
  }

}


Widget _showData(AsyncSnapshot<Object?> snapshot){
  if(snapshot.hasData){
    return Card(
      child: ListTile(
        title: Text(snapshot.data.toString(), style: const TextStyle(
          fontSize: 32
        ),),
      ),
    );
  }else{
    return const ListTile(
      title: Text("NO DATA"),
    );
  }

}
