import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/models/user.dart';
import 'package:http/http.dart' as http;

import '../common/widgets/user_list_view.dart';

class UserCubit extends Cubit<List<User>> {
  UserCubit() : super([]);


  Future<void> fetchUser() async {
    var url = Uri.parse('https://reqres.in/api/users?page=1');
    var response = await http.get(url);
    inspect(response);


    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      log(decodedResponse.toString());
      print(decodedResponse['data']);

      for (var data in decodedResponse['data']) {
        List<User> userList = [];
        userList.add(User.fromJson(data));

        emit(List.from(state)..addAll(userList));
      }

    }
  }

  Future<void> refreshData() async {
    
    emit([]);
    await fetchUser();
  }
  
  @override
  void onChange(Change<List<User>> change) {
    super.onChange(change);

    inspect(change);
  }
}


class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('user List'),
      ),
      body: const UserListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => userCubit.fetchUser(),
        child: const Text('Fetch Data'),
      ),
    );
  }
}

