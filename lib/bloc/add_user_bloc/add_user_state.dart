import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test/models/user.dart';

class AddUserState extends Equatable{
  SimpleUser? user;

  AddUserState(this.user);

  @override
  List<Object?> get props => [user];
}

class AddUserInitialState extends AddUserState{
  AddUserInitialState(super.user);
}

class AddUserLoadingState extends AddUserState{
  AddUserLoadingState(super.user);
}

class AddUserSuccessState extends AddUserState{
  AddUserSuccessState(super.user);
}

class AddUserErrorState extends AddUserState{
  AddUserErrorState(super.user);
}