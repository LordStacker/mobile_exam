part of 'measurements_bloc.dart';

@freezed
sealed class MeasurementsState with _$MeasurementsState {
  const factory MeasurementsState.initial() = Initial;
  const factory MeasurementsState.loading() = Loading;
  const factory MeasurementsState.success(Map measurements) = Success;
  const factory MeasurementsState.failure() = Failure;
}
