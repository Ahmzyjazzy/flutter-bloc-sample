part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int value;
  final bool eat;
  const CounterState({required this.value, this.eat = false});

  CounterState copyWith({
    int? value,
    bool? eat,
  }) {
    return CounterState(
      value: value ?? this.value,
      eat: eat ?? this.eat,
    );
  }

  @override
  List<Object?> get props => [value, eat];
}
