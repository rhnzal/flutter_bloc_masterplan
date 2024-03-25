import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/user_cubit.dart';
import '../common/widgets/user_list_view.dart';

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

