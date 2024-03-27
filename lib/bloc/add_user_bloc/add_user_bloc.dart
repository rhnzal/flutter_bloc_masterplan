import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_test/bloc/export.dart';
import 'package:flutter_bloc_test/models/user.dart';
import 'package:http/http.dart' as http;

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  AddUserBloc() : super(AddUserInitialState(null)) {
    on<AddButtonPressed>((event, emit) async {
      emit(AddUserLoadingState(state.user));

      var result = await http.post(
        Uri.parse('https://reqres.in/api/users'),
        body: {
          'name': event.name,
          'job': event.job
        }
      );
      inspect(result);

      if ([200, 201].contains(result.statusCode)) {
        log('sukses');
        SimpleUser user = SimpleUser.fromJson(json.decode(result.body));
        emit(AddUserSuccessState(user));
      
      } else {
        log('gagal');
        emit(AddUserErrorState(state.user));
      }

    });


    on<ResetButtonPressed>((event, emit) {
      emit(AddUserInitialState(null));
    });
  }
}