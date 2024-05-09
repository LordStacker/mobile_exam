import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/WebSocketService.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

//This is the business logic component of the sign in page, responsible for managing the states based on recieved events from user interaction and server responses

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  //The WebSocketService object that is used to send and recieve messages to and from the server
  final WebSocketService _webSocketService = WebSocketService();

  //The constructor that listens for events and emits states according to which event is recieved
  SignInBloc() : super(const SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        started: (e) async {},
        submitted: (e) async {
          emit(SignInState.loading());
            bool success = await _webSocketService.signIn(e.username, e.password);
            if (success) {
              emit(SignInState.success());
            } else {
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






}
