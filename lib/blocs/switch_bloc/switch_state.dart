part of 'switch_bloc.dart';
 class SwitchState extends Equatable {
  final bool switcValue;
  const SwitchState({required this.switcValue});

  @override
  List<Object> get props => [switcValue];
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switcValue}) : super(switcValue: switcValue);
}
