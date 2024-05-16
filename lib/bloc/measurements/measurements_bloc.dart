import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/WebSocketService.dart';

part 'measurements_event.dart';
part 'measurements_state.dart';
part 'measurements_bloc.freezed.dart';

class MeasurementsBloc extends Bloc<MeasurementsEvent, MeasurementsState> {
  final WebSocketService _webSocketService = WebSocketService();

  MeasurementsBloc() : super(const MeasurementsState.initial()) {
    on<MeasurementsEvent>((event, emit) {
      event.map(

        started: (e) async {
          print("maybe its occurring here?");

          //emit(MeasurementsState.initial());
          emit(MeasurementsState.loading());
        },

        loadMeasurements: (e) async {
          // not here either :(
          print("maybe its occurring here in the loadm?");
          emit(const MeasurementsState.loading());
          var measurements = _webSocketService.getMeasurements();

            emit(MeasurementsState.success(measurements));

        },

        loadMeasurementsSuccess: (e) async {
          emit(MeasurementsState.success(e.measurements));
        },
      );
    });
  }

  initialize() {
    add(MeasurementsEvent.loadMeasurements());
  }
}
