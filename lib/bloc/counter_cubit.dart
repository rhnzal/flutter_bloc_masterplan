import 'dart:developer';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({required this.initialValue}) : super(initialValue);

  final int initialValue;

  void add() {
    if (state < 20) {
      emit(state + 1);
    } else {
      
    }
    
  }

  void remove() {
    if (state > -20) {
      emit(state - 1);
    }

  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);

    log(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}