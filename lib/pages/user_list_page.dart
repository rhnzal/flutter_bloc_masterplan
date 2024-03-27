import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_bloc_test/bloc/user_bloc/user_event.dart';


import '../bloc/user_cubit.dart';
import '../common/widgets/user_list_view.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user List'),
      ),
      body: const UserListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserBloc>().add(FetchUserData()),
        child: const Text('Fetch Data'),
      ),
    );
  }
}

