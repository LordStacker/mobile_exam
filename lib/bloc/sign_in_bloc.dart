import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

//This is the business logic component of the sign in page, responsible for managing the states based on recieved events from user interaction and server responses

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // This is the URL of the WebSocket server and the WebSocket channel
  final String url = 'ws://10.0.2.2:8181/';
  IOWebSocketChannel? _channel;

  //The constructor that listens for events and emits states according to which event is recieved
  SignInBloc() : super(const SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        started: (e) async {

        },
        submitted: (e) async {
          emit(SignInState.loading());
          try {
            await signIn(e.username, e.password);
          } catch (_) {
            emit(SignInState.failure());
          }
        },
        confirmed: (e) async {
          emit(SignInState.success());
        },
        error: (e) async {
          emit(SignInState.failure());
        },
      );
    });
  }

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
  Future<void> signIn(String username, String password) async {
    if (!isConnected()) {
      await connect();
    }
    _channel!.sink.add('{"eventType": "ClientWantsToSignIn", "Username": "$username", "Password": "$password"}');
  }

  //This function handles the events recieved from the WebSocket server and emits the corresponding states
  void handleEvent(String message) {
    var event = jsonDecode(message);
    switch (event['eventType']) {
      case 'ServerConfirmsSignIn':
        add(SignInEvent.confirmed());
        break;
      case 'ServerError':
        add(SignInEvent.error());
        break;
    }
  }
}
