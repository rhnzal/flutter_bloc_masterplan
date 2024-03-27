import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/bloc/export.dart';

import '../../bloc/user_cubit.dart';
import '../../models/user.dart';
import '../../pages/user_list_page.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);

    return BlocBuilder<UserBloc, UserState>(
      bloc: userBloc,
      builder: (context, state) {
        if (state is UserInitialState) {
          return SizedBox();

        } else if (state is UserLoadingState && state.userList.isEmpty) {
          return Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent,));

        } else if (state is UserFinishState || state is UserLoadingState) {
          return RefreshIndicator(
            onRefresh: () async {
              userBloc.add(ReloadUserData());
            },
            child: ListView(
              children: [
                for(var user in state.userList) ... [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.first_name, style: const TextStyle(fontSize: 16)),
                              Text(user.email, style: const TextStyle(fontSize: 12, color: Colors.grey),),
                            ],
                          )
                        )
                      ],
                    ),
                  )
                ],
                if (state is UserLoadingState) LinearProgressIndicator(color: Colors.deepOrangeAccent),
                SizedBox(height: 24,)
              ],
            ),
          );

        } else {
          return Icon(Icons.dangerous);

        }

      },
    );
  }
}