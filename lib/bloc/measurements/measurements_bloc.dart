import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/WebSocketService.dart';

part 'measurements_bloc.freezed.dart';
part 'measurements_event.dart';
part 'measurements_state.dart';

class MeasurementsBloc extends Bloc<MeasurementsEvent, MeasurementsState> {
  final WebSocketService _webSocketService = WebSocketService();

  MeasurementsBloc() : super(const MeasurementsState.initial()) {
    on<Started>((event, emit) => emit(const MeasurementsState.loading()));
    on<LoadMeasurements>((event, emit) async {
      emit(const MeasurementsState.loading());

      // Simulate a delay for loading measurements
      await Future.delayed(Duration(seconds: 1));

      Map<dynamic, dynamic> measurements =
          await _webSocketService.getMeasurements();

      if (measurements.isNotEmpty) {
        emit(MeasurementsState.success(measurements));
      } else {
        emit(MeasurementsState.failure());
      }
    });
    on<LoadMeasurementsSuccess>(
        (event, emit) => emit(MeasurementsState.success(event.measurements)));
  }

  initialize() {
    add(MeasurementsEvent.loadMeasurements());
  }
}
