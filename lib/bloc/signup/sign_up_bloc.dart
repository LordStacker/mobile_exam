import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/WebSocketService.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final WebSocketService _webSocketService = WebSocketService();

  SignUpBloc() : super(const SignUpState.initial()) {
    on<Started>((event, emit) => emit(const SignUpState.initial()));
    on<Submitted>((event, emit) async {
      emit(const SignUpState.loading());
      bool success = await _webSocketService.signUp(
          event.username, event.password, event.email);

      if (success) {
        emit(const SignUpState.success());
      } else {
        emit(const SignUpState.error());
      }
    });
    on<Confirmed>((event, emit) => emit(const SignUpState.success()));
    on<Failure>((event, emit) => emit(const SignUpState.error()));
  }
}
