import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/models/user.dart';
import 'package:http/http.dart' as http;

class UserCubit extends Cubit<List<User>> {
  UserCubit() : super([]);


  Future<void> fetchUser() async {
    var url = Uri.parse('https://reqres.in/api/users?page=1');
    var response = await http.get(url);
    inspect(response);

    Map<String, dynamic> decodedResponse = json.decode(response.body);
    log(decodedResponse.toString());
    print(decodedResponse['data']);

    if (response.statusCode == 200) {
      for (var data in decodedResponse['data']) {
        List<User> userList = state;
        userList.add(User.fromJson(data));

        emit(userList);
      }

    }
  }

  Future<void> refreshData() async {
    state.clear();
    fetchUser();
  }
}


class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = UserCubit();

    return Scaffold(
      appBar: AppBar(
        title: Text('user List'),
      ),
      body: BlocBuilder<UserCubit, List<User>>(
        bloc: userCubit,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: userCubit.refreshData,
            child: ListView(
              children: [
                for(var user in state) ... [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.first_name, style: TextStyle(fontSize: 16)),
                              Text(user.email, style: TextStyle(fontSize: 12, color: Colors.grey),),
                            ],
                          )
                        )
                      ],
                    ),
                  )
                ]
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => userCubit.fetchUser(),
        child: const Text('Fetch Data'),
      ),
    );
  }
}