import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import 'dart:async';
import 'JsonService.dart';

//class that manages the WebSocket connection and sends messages to the server
class WebSocketService {
  // This is the URL of the WebSocket server and the WebSocket channel
  final String url = 'ws://10.0.2.2:8181/';
  IOWebSocketChannel? _channel;

  //This completer is used to complete the signing functions when the server responds
  Completer<bool>? _signInCompleter;

  //This function connects to the WebSocket server and outputs messages to the handleEvent() function
  Future<void> connect() async {
    _channel = IOWebSocketChannel.connect(Uri.parse(url));

    _channel!.stream.listen((message) {
      handleEvent(message);
    });
  }

  //This function checks if the WebSocket channel is connected
  bool isConnected() {
    return _channel != null && _channel!.closeCode == null;
  }

  //This function sends a message to the WebSocket server to sign in
  Future<bool> signIn(String username, String password) async {
    if (!isConnected()) {
      await connect();
    }

    _signInCompleter = Completer<bool>();
    _channel!.sink.add(JsonService().serialiseJson({
      'eventType': 'ClientWantsToSignIn',
      'Username': username,
      'Password': password,
    }));

    return _signInCompleter!.future;
  }

  //This function sends a message to the WebSocket server to register a new user
  Future<bool> signUp(String username, String password, String email) async {
    if (!isConnected()) {
      await connect();
    }

    _signInCompleter = Completer<bool>();
    _channel!.sink.add(JsonService().serialiseJson({
      'eventType': 'ClientWantsToSignUp',
      'Username': username,
      'Password': password,
      'Email': email,
    }));

    return _signInCompleter!.future;
  }

  Map getMeasurements() {
    return JsonService().deserialiseJson(JsonService().testJsonMeasurements);
  }

  //This function handles the events recieved from the WebSocket server and returns the response
  void handleEvent(String message) {
    var event = jsonDecode(message);
    switch (event['eventType']) {
      case 'ServerConfirmsSignIn':
        _signInCompleter?.complete(true);
        break;
      case 'ServerError':
        _signInCompleter?.complete(false);
        break;
    }
  }
}