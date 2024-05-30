import 'dart:async';
import 'dart:convert';

import 'package:exam_project/services/GlobalSettingsService.dart';
import 'package:web_socket_channel/io.dart';

import 'JsonService.dart';

//class that manages the WebSocket connection and sends messages to the server
class WebSocketService {
  // This is the URL of the WebSocket server and the WebSocket channel
  final String url = 'ws://10.0.2.2:8181/';
  IOWebSocketChannel? _channel;

  //This completer is used to complete the functions when the server responds
  Completer<bool>? _completer;
  Completer<Map>? _measurementsCompleter;

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

    _completer = Completer<bool>();
    _channel!.sink.add(JsonService().serialiseJson({
      'eventType': 'ClientWantsToSignIn',
      'Username': username,
      'Password': password,
    }));

    return _completer!.future;
  }

  Future<bool> addToken() async {
    if (!isConnected()) {
      await connect();
    }

    _completer = Completer<bool>();

    _channel!.sink.add(JsonService().serialiseJson({
      'eventType': 'ClientWantsToAddToken',
      'UserId': GlobalSettings().currentUser['id'],
      'Token': GlobalSettings().token,
    }));

    return _completer!.future;
  }

  //This function sends a message to the WebSocket server to register a new user
  Future<bool> signUp(String username, String password, String email) async {
    if (!isConnected()) {
      await connect();
    }

    _completer = Completer<bool>();
    _channel!.sink.add(JsonService().serialiseJson({
      'eventType': 'ClientWantsToRegister',
      'Username': username,
      'Password': password,
      'Email': email,
    }));

    return _completer!.future;
  }

  Future<Map<dynamic, dynamic>> getMeasurements() async {
    if (!isConnected()) {
      await connect();
    }

    _measurementsCompleter = Completer<Map>();
    _channel!.sink.add(JsonService().serialiseJson({
      'eventType': 'ClientWantsToGetSensorByUserId',
      'userId': GlobalSettings().currentUser['id']
    }));

    return _measurementsCompleter!.future;
  }

  //This function handles the events recieved from the WebSocket server and returns the response
  void handleEvent(String message) {
    var event = jsonDecode(message);
    switch (event['eventType']) {
      case 'ServerConfirmsSignIn':
        GlobalSettings().currentUser['username'] = event['Username'];
        GlobalSettings().currentUser['id'] = event['user_id'];
        _completer?.complete(true);
        break;
      case 'WrongCredentialsEvent':
        _completer?.complete(false);
        break;
      case 'UserCreatedSuccessfully':
        _completer?.complete(true);
        break;
      case 'FailedRegisterUserExist':
        _completer?.complete(false);
        break;
      case 'SensorReadRetrieved':
        _measurementsCompleter?.complete(event['Sensor']);
        break;
      case 'SensorReadFailed':
        _measurementsCompleter?.complete({});
        break;
      case 'ServerConfirmsTokenUpsert':
        _completer?.complete(true);
        break;
      case 'ServerError':
        _completer?.complete(false);
        break;
    }
  }
}
