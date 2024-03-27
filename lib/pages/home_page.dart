import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter_cubit.dart';
import 'package:flutter_bloc_test/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_test/bloc/status_bloc/status_bloc.dart';
import 'package:flutter_bloc_test/bloc/status_bloc/status_event.dart';
import 'package:flutter_bloc_test/bloc/status_cubit.dart';
import 'package:flutter_bloc_test/common/status.dart';

import '../route.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = context.read<CounterBloc>();
    StatusBloc statusBloc = context.read<StatusBloc>();

    // CounterCubit counterCubit = context.read<CounterCubit>();
    // StatusCubit statusCubit = context.read<StatusCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppPage.addUserPage);
            }, 
            child: Text('Add User')
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppPage.userListPage);
            }, 
            icon: const Icon(Icons.forward)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
          // Gabungan antara BlocListener dan BlocBuilder
          BlocConsumer<CounterBloc, int>(
            bloc: counterBloc,
            builder: (context, state) {
              return Text(state.toString());
            }, 
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Sudah lebih dari 15')
                )
              );
            },
            listenWhen: (previous, current) {
              if (current > 15) {
                return true;
              }
              return false;
            },
          ),
    
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  counterBloc.add(CounterDecrementPressed(2));
                }, 
                child: const Text('Kurang 2')
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.add(CounterIncrementPressed());
                }, 
                child: const Text('Tambah')
              ),
            ],
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppPage.secondPage);
            }, 
            child: const Text('Select Number')
          ),

          const SizedBox(height: 24),

          Container(
            height: 200,
            width: 200,
            color: Colors.deepPurpleAccent,
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Status', style: TextStyle(color: Colors.white),),
                const SizedBox(height: 24),
                BlocBuilder<StatusBloc, Status>(
                  bloc: statusBloc,
                  builder: (context, state) {
                    switch(state) {
                      case Status.loading:
                        return const CircularProgressIndicator(color: Colors.white);
                      
                      case Status.success:
                        return const Icon(Icons.check, color: Colors.white);

                      case Status.error:
                        return const Icon(Icons.error, color: Colors.white);

                    }
                  },
                )
              ],
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => statusBloc.add(LoadingPressed()), 
                child: Text('loading')
              ),
              
              ElevatedButton(
                onPressed: () => statusBloc.add(SuccessPressed()), 
                child: Text('Success')
              ),

              ElevatedButton(
                onPressed: () => statusBloc.add(ErrorPressed()), 
                child: Text('Error')
              ),

            ],
          )
        ],
      ),
    );
  }
}