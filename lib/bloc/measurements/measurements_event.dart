part of 'measurements_bloc.dart';

@freezed
sealed class MeasurementsEvent with _$MeasurementsEvent {
  const factory MeasurementsEvent.started() = Started;
  const factory MeasurementsEvent.loadMeasurements() = LoadMeasurements;
  const factory MeasurementsEvent.loadMeasurementsSuccess(Map measurements) =
      LoadMeasurementsSuccess;
}
