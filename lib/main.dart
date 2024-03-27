import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/bloc_observer/bloc_observer.dart';
import 'package:flutter_bloc_test/pages/user_list_page.dart';
import 'package:flutter_bloc_test/route.dart';

void main() {
  Bloc.observer = StateObserver();
  runApp(BlocTest());
}

class BlocTest extends StatelessWidget {
  const BlocTest({super.key});

  @override
  Widget build(BuildContext context) {
    AppRoute appRoute = AppRoute();

    return MaterialApp(
      initialRoute: AppPage.homePage,
      onGenerateRoute: appRoute.onRoute,
    );
  }
}

