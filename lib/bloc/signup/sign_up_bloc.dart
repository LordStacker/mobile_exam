import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState.initial()) {
    on<SignUpEvent>((event, emit) async {
      await event.map(
        started: (e) async {},
        submitted: (e) async {
          emit(SignUpState.loading());
          try {
            await signUp(e.username, e.password);
            emit(SignUpState.success());
          } catch (_) {
            emit(SignUpState.failure());
          }
        },
      );
    });
  }

  Future<void> signUp(String username, String password) async {
    // Your sign up logic goes here
  }
}
