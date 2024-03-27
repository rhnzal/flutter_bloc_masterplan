import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test/bloc/export.dart';
import 'package:flutter_bloc_test/bloc/user_bloc/user_event.dart';
import 'package:flutter_bloc_test/bloc/user_bloc/user_state.dart';
import 'package:flutter_bloc_test/models/user.dart';
import 'package:http/http.dart' as http;

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc() : super(UserInitialState([])) {

    on<FetchUserData>((event, emit) async {
      emit(UserLoadingState(state.userList));
      
      var url = Uri.parse('https://reqres.in/api/users?page=1');
      var response = await http.get(url);
      inspect(response);


      if (response.statusCode == 200) {
        Map<String, dynamic> decodedResponse = json.decode(response.body);
        // log(decodedResponse.toString());/
        print(decodedResponse['data']);

        List<User> userList = [];
        for (var data in decodedResponse['data']) {
          userList.add(User.fromJson(data));
        }
        emit(UserFinishState(List.from(state.userList)..addAll(userList)));
      } else {
        emit(UserErrorState(state.userList));
      }
    });

    on<ReloadUserData>((event, emit) async {
      emit(UserLoadingState([]));
      var url = Uri.parse('https://reqres.in/api/users?page=1');
      var response = await http.get(url);
      inspect(response);


      if (response.statusCode == 200) {
        Map<String, dynamic> decodedResponse = json.decode(response.body);
        // log(decodedResponse.toString());
        print(decodedResponse['data']);

        List<User> userList = [];
        for (var data in decodedResponse['data']) {
          userList.add(User.fromJson(data));
        }
        emit(UserFinishState(List.from(state.userList)..addAll(userList)));
      } else {
        emit(UserErrorState(state.userList));
      }
    },);
  }


}