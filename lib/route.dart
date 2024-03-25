import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/status_cubit.dart';
import 'package:flutter_bloc_test/common/status.dart';
import 'package:flutter_bloc_test/main.dart';
import 'package:flutter_bloc_test/pages/not_found_page.dart';
import 'package:flutter_bloc_test/pages/second_page.dart';
import 'package:flutter_bloc_test/pages/user_list_page.dart';

import 'bloc/counter_cubit.dart';
import 'bloc/user_cubit.dart';
import 'pages/home_page.dart';

class AppRoute {
  // cubit instances
  CounterCubit counterCubit = CounterCubit(initialValue: 0);
  UserCubit userCubit = UserCubit();
  StatusCubit statusCubit = StatusCubit(initialValue: Status.loading);
  
  
  Route onRoute(RouteSettings setting) {

    switch(setting.name) {
      case AppPage.homePage:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: counterCubit,
              ),

              BlocProvider.value(
                value: statusCubit,
              )
            ], 
            child: const HomePage()
          )
        );

      case AppPage.secondPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counterCubit,
            child: const SecondPage()
          )
        );
      
      case AppPage.userListpage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: userCubit,
            child: const UserListPage()
          )
        );

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  } 

}

class AppPage {
  static const String homePage = '/';
  static const String userListpage = '/user-list-page';
  static const String secondPage = '/second-page';
  
  
  static const String notFound = '/not-found'; 
}