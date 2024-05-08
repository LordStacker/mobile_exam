import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService {
  IOWebSocketChannel? _channel;
  // The URL of the WebSocket server is set to 10.0.2.2. because the events are sent from the emulator OS, technically a different machine...
  String url = 'ws://10.0.2.2:8181/';

  // Connects to the WebSocket server
  Future<void> connect() async {
    _channel = IOWebSocketChannel.connect(Uri.parse(url));

    _channel!.stream.listen((message) {
      handleEvent(message);
    });
  }

  bool isConnected() {
    return _channel != null && _channel!.closeCode == null;
  }

  // Sends a message to the WebSocket server to sign in
  Future<void> signIn(String username, String password) async {
    if (!isConnected()) {
      await connect();
    }
    _channel!.sink.add('{"eventType": "ClientWantsToSignIn", "Username": "$username", "Password": "$password"}');
  }

  // Handles incoming messages from the WebSocket server
  void handleEvent(String message) {
    var event = jsonDecode(message);
    switch (event['eventType']) {
      case 'ServerConfirmsSignIn':
        print("Server confirms sign in");
        break;
      case 'ServerDeniesSignIn':
        print("Server denies sign in");
        break;
      default:
        print("Unknown event type: ${event['eventType']}");
        break;
    // Handle other event types...
    }
  }

  // Parses the incoming message from the WebSocket server
  String parseEvent(String message) {
    return message;
  }

// Closes the WebSocket connection
  void dispose() {
    _channel!.sink.close();
  }
}