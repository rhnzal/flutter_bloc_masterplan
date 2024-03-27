import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/bloc/add_user_bloc/add_user_bloc.dart';
import 'package:flutter_bloc_test/pages/add_user/add_user_page.dart';
import 'package:flutter_bloc_test/pages/not_found_page.dart';
import 'package:flutter_bloc_test/pages/second_page.dart';
import 'package:flutter_bloc_test/pages/user_list_page.dart';

import './bloc/export.dart';
import 'pages/home_page.dart';

class AppRoute {
  // bloc instances
  CounterBloc counterBloc = CounterBloc(10);
  UserBloc userBloc = UserBloc();
  StatusBloc statusBloc = StatusBloc();
  AddUserBloc addUserBloc = AddUserBloc();

  // cubit instances
  // CounterCubit counterCubit = CounterCubit(initialValue: 0);
  // UserCubit userCubit = UserCubit();
  // StatusCubit statusCubit = StatusCubit(initialValue: Status.loading);
  
  
  Route onRoute(RouteSettings setting) {

    switch(setting.name) {
      case AppPage.homePage:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: counterBloc,
              ),

              BlocProvider.value(
                value: statusBloc,
              )
            ], 
            child: const HomePage()
          )
        );

      case AppPage.secondPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counterBloc,
            child: const SecondPage()
          )
        );
      
      case AppPage.userListPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: userBloc,
            child: const UserListPage()
          )
        );

      case AppPage.addUserPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: addUserBloc,
            child: const AddUserPage(),
          )
        );

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  } 

}

class AppPage {
  static const String homePage = '/';
  static const String secondPage = '/second-page';
  static const String userListPage = '/user-list-page';
  static const String addUserPage = '/add-user-page';

  
  
  static const String notFound = '/not-found'; 
}