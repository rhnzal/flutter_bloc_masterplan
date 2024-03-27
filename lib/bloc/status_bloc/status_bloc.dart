import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test/bloc/status_bloc/status_event.dart';
import 'package:flutter_bloc_test/common/status.dart';

class StatusBloc extends Bloc<StatusEvent, Status> {
  StatusBloc() : super(Status.loading) {
    on<LoadingPressed>((event, emit) {
      emit(Status.loading);

    });

    on<SuccessPressed>((event, emit) {
      emit(Status.success);
      
    });

    on<ErrorPressed>((event, emit) {
      emit(Status.error);  
    
    });


  }
}