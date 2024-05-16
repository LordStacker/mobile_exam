part of 'measurements_bloc.dart';

@freezed
class MeasurementsState with _$MeasurementsState {
  const factory MeasurementsState.initial() = _Initial;
  const factory MeasurementsState.loading() = _Loading;
  const factory MeasurementsState.success(Map measurements) = _Success;
  const factory MeasurementsState.failure() = _Failure;
}
