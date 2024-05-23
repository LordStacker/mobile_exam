import 'package:bloc/bloc.dart';
import 'package:exam_project/services/NotificationService.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alerts_bloc.freezed.dart';
part 'alerts_event.dart';
part 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  AlertsBloc() : super(const AlertsState.initial()) {
    NotificationService().messageStream.listen((message) {
      add(const Started());
    });

    on<Started>((event, emit) async {
      emit(const AlertsState.loading());
      // Simulate a delay
      await Future.delayed(const Duration(seconds: 1));
      add(const Recieved());
    });
    on<Recieved>((event, emit) => emit(const AlertsState.display()));
  }
}
