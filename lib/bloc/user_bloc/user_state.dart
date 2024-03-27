import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test/models/user.dart';

class UserState extends Equatable{

  List<User> userList = [];

  UserState(this.userList);

  @override
  List<Object?> get props => [userList];
}

class UserInitialState extends UserState{
  UserInitialState(super.userList);
}

class UserLoadingState extends UserState{
  UserLoadingState(super.userList);
}

class UserFinishState extends UserState{
  UserFinishState(super.userList);
}

class UserErrorState extends UserState{
  UserErrorState(super.userList);
}