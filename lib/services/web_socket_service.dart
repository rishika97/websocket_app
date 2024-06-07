import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel _channel;
  Function(String message) onMessageReceived;

  WebSocketService(this.onMessageReceived) {
    _connect();
  }

  void _connect() {
    _channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'));
    _channel.stream.listen((message) {
      final decodedMessage = json.decode(message);
      onMessageReceived(decodedMessage['message']);
    });
  }

  void sendMessage(String message) {
    final encodedMessage = json.encode({'message': message});
    _channel.sink.add(encodedMessage);
  }

  void dispose() {
    _channel.sink.close();
  }
}
