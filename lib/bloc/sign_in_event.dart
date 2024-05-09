part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = _Started;
  const factory SignInEvent.submitted(String username, String password) = _Submitted;
  const factory SignInEvent.confirmed() = _Confirmed;
  const factory SignInEvent.error() = _Error;
}
