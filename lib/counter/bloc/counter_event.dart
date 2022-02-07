part of 'counter_bloc.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class Eaten extends CounterEvent {
  Eaten(this.hasEaten);

  final bool hasEaten;
}
