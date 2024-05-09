import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final String url = 'ws://10.0.2.2:8181/';
  IOWebSocketChannel? _channel;

  SignInBloc() : super(const SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        started: (e) async {},
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

  Future<void> connect() async {
    _channel = IOWebSocketChannel.connect(Uri.parse(url));

    _channel!.stream.listen((message) {
      handleEvent(message);
    });
  }

  bool isConnected() {
    return _channel != null && _channel!.closeCode == null;
  }

  Future<void> signIn(String username, String password) async {
    if (!isConnected()) {
      await connect();
    }
    _channel!.sink.add('{"eventType": "ClientWantsToSignIn", "Username": "$username", "Password": "$password"}');
  }

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
