part of 'alerts_bloc.dart';

@freezed
class AlertsState with _$AlertsState {
  const factory AlertsState.initial() = Initial;
  const factory AlertsState.loading() = Loading;
  const factory AlertsState.display() = Display;
}
