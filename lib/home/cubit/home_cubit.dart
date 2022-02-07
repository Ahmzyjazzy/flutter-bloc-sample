import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  increment() {
    emit(state + 1);
  }

  decrement() {
    emit(state - 1);
  }
}
