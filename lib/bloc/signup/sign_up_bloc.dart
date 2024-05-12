import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/WebSocketService.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  final WebSocketService _webSocketService = WebSocketService();

  //Responsible for registering a new user
  SignUpBloc() : super(const SignUpState.initial()) {
    on<SignUpEvent>((event, emit) async {
      await event.map(
        started: (e) async {},
        submitted: (e) async {
          emit(SignUpState.loading());
          bool success = await _webSocketService.signUp(e.username, e.password, e.email);
          if (success) {
            emit(SignUpState.success());
          } else {
            emit(SignUpState.failure());
          }
        },
      );
    });
  }


}
