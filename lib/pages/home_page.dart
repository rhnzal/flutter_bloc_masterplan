import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/counter_cubit.dart';

import '../route.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppPage.userListpage);
            }, 
            icon: Icon(Icons.forward)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
          // Gabungan antara BlocListener dan BlocBuilder
          BlocConsumer<CounterCubit, int>(
            bloc: counterCubit,
            builder: (context, state) {
              return Text(state.toString());
            }, 
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('State Changes')
                )
              );
            }
          ),
    
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  counterCubit.remove();
                }, 
                child: Text('Kurang')
              ),
              ElevatedButton(
                onPressed: () {
                  counterCubit.add();
                }, 
                child: Text('Tambah')
              ),
            ],
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppPage.secondPage);
            }, 
            child: const Text('Select Number')
          )
        ],
      ),
    );
  }
}