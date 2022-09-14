import 'package:flutter/material.dart';
import 'package:websocket_clean_architecture/feature/websocket/presentation/websocket_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Websocket'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const WebSocketPage(),
              ),
            );
          },
          child: const Text('Message Echo'),
        ),
      ),
    );
  }
}
