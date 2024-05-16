part of 'sign_up_bloc.dart';

@freezed
sealed class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.started() = Started;
  const factory SignUpEvent.submitted(
      String username, String password, String email) = Submitted;
  const factory SignUpEvent.confirmed() = Confirmed;
  const factory SignUpEvent.failure() = Failure;
}
