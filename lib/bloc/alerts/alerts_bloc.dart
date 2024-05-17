import 'package:bloc/bloc.dart';
import 'package:exam_project/services/NotificationController.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alerts_bloc.freezed.dart';
part 'alerts_event.dart';
part 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  AlertsBloc() : super(const AlertsState.initial()) {
    on<Started>((event, emit) => emit(const AlertsState.loading()));
    on<Recieved>((event, emit) =>
        emit(AlertsState.display(NotificationController.getNotifications())));
  }
}
