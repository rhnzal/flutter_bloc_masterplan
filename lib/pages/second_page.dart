import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter_cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counterBloc = context.read<CounterBloc>();
    // var counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, int>(
          bloc: counterBloc,
          builder: (context, state) {
            print(state);

            return Text(state.toString());
          },
          listener: (context, state) {
            log('second page state: $state');
          },
        ),
      ),
    );
  }
}