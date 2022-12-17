import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switcValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(
        SwitchState(switcValue: true)
      );
    });
    on<SwitchoffEvent>((event, emit) {
      emit(
        SwitchState(switcValue: false)
      );
    });
  }
}
