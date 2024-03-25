import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test/common/status.dart';

class StatusCubit extends Cubit<Status> {
  StatusCubit({required this.initialValue}) : super(initialValue);

  final Status initialValue;

  void updateToLoading() {
    emit(Status.loading);
  }

  void updateToSuccess() {
    emit(Status.success);
  }

  void updateToError() {
    emit(Status.error);
  }

  @override
  void onChange(Change<Status> change) {
    super.onChange(change);

    log(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}