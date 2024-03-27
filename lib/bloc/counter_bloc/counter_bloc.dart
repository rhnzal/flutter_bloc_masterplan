import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test/bloc/counter_bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialvalue) : super(initialvalue) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));

    on<CounterDecrementPressed>((event, emit) => emit(state - event.value));
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    log(change.toString());
  }
}