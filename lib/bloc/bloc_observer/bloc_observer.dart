import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class StateObserver extends BlocObserver{

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    log("$bloc => $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    log("$bloc => $transition");
  }
  
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    log("$bloc => $error");
    log("$bloc => $stackTrace");
  }
}