part of 'measurements_bloc.dart';

@freezed
class MeasurementsEvent with _$MeasurementsEvent {
  const factory MeasurementsEvent.started() = _Started;
  const factory MeasurementsEvent.loadMeasurements() = _LoadMeasurements;
  const factory MeasurementsEvent.loadMeasurementsSuccess(Map measurements) = _LoadMeasurementsSuccess;
}
