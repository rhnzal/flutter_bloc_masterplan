import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../../pages/user_list_page.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var userCubit = BlocProvider.of<UserCubit>(context);

    return BlocBuilder<UserCubit, List<User>>(
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
    );
  }
}