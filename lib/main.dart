import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/pages/user_list_page.dart';

class CubitTest extends Cubit<int> {
  CubitTest({required this.initialValue}) : super(initialValue);

  final int initialValue;

  void add() {
    if (state < 20) {
      emit(state + 1);
    } else {
      
    }
    
  }

  void remove() {
    if (state > -20) {
      emit(state - 1);
    }

  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);

    log(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}


void main() {
  runApp(BlocTest());
}

class BlocTest extends StatelessWidget {
  const BlocTest({super.key});



  @override
  Widget build(BuildContext context) {
  CubitTest cubitTest = CubitTest(initialValue: 0);

    return MaterialApp(
      home: HomePage(cubitTest: cubitTest),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.cubitTest,
  });

  final CubitTest cubitTest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => UserListPage(),
                )
              );
            }, 
            icon: Icon(Icons.forward)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
          // Gabungan antara BlocListener dan BlocBuilder
          BlocConsumer<CubitTest, int>(
            bloc: cubitTest,
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
                  cubitTest.remove();
                }, 
                child: Text('Kurang')
              ),
              ElevatedButton(
                onPressed: () {
                  cubitTest.add();
                }, 
                child: Text('Tambah')
              ),
            ],
          )
        ],
      ),
    );
  }
}