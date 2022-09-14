import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketModule {
  WebSocketChannel connect(String url) {
    return WebSocketChannel.connect(Uri.parse(url));
  }
}
