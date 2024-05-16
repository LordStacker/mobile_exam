part of 'sign_in_bloc.dart';

@freezed
sealed class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = Started;
  const factory SignInEvent.submitted(String username, String password) =
      Submitted;
  const factory SignInEvent.confirmed() = Confirmed;
  const factory SignInEvent.failure() = Failure;
}
