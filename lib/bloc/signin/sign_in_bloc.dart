import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:exam_project/services/GlobalSettingsService.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/WebSocketService.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

//This is the business logic component of the sign in page, responsible for managing the states based on recieved events from user interaction and server responses

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  //The WebSocketService object that is used to send and recieve messages to and from the server
  final WebSocketService _webSocketService = WebSocketService();
  final Stopwatch _loopBreaker = Stopwatch();

  //The constructor for the SignInBloc class
  SignInBloc() : super(const SignInState.initial()) {
    on<Started>((event, emit) => emit(const SignInState.initial()));
    on<Submitted>((event, emit) async {
      emit(const SignInState.loading());
      _loopBreaker.start();

      try {
        bool success = await _webSocketService
            .signIn(event.username, event.password)
            .timeout(const Duration(seconds: 7));

        if (success) {
          emit(const SignInState.success());
        } else {
          emit(const SignInState.error());
        }
      } on TimeoutException {
        emit(const SignInState.error());
      }
    });
    on<Confirmed>((event, emit) async {
      if (GlobalSettings().enableNotifications) {
        bool tokenRes = await _webSocketService.addToken();

        if (!tokenRes) {
          emit(const SignInState.error());
          return;
        }
      }
      emit(const SignInState.success());
    });
    on<Failure>((event, emit) => emit(const SignInState.error()));
  }
}
