import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPage extends HookWidget {
  const WebSocketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textCtl = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Websocket Echo Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /* TextField */
            TextFormField(
              controller: textCtl,
              decoration: InputDecoration(
                hintText: 'Put Message Here',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /* Button */
            ElevatedButton(
              onPressed: _connectWs,
              child: const Text('Connect WS'),
            ),
          ],
        ),
      ),
    );
  }

  void _connectWs() {
    print('Start Connect');

    /// Create the WebSocket channel
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://ws-feed.pro.coinbase.com'),
    );

    channel.sink.add(
      jsonEncode(
        {
          "type": "subscribe",
          "channels": [
            {
              "name": "ticker",
              "product_ids": [
                "BTC-EUR",
              ]
            }
          ]
        },
      ),
    );

    /// Listen for all incoming data
    channel.stream.listen(
      (data) {
        print(data);
      },
      onError: (error) => print(error),
    );
  }
}
