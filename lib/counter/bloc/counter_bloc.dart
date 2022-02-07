import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: 0)) {
    on<Increment>(_handleIncrement);
    on<Decrement>(_handleDecrement);
    on<Eaten>(_handleEaten);
  }

  void _handleIncrement(Increment event, Emitter<CounterState> emit) {
    emit(state.copyWith(value: state.value + 1));
  }

  void _handleDecrement(Decrement event, Emitter<CounterState> emit) {
    emit(state.copyWith(value: state.value - 1));
  }

  void _handleEaten(Eaten event, Emitter<CounterState> emit) {
    emit(state.copyWith(eat: event.hasEaten));
  }
}
