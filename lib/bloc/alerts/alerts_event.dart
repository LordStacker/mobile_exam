part of 'alerts_bloc.dart';

@freezed
class AlertsEvent with _$AlertsEvent {
  const factory AlertsEvent.started() = Started;
  const factory AlertsEvent.recieved(List messages) = Recieved;
}
