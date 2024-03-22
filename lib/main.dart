import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
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



            // BlocListener<CubitTest, int>(
            //   bloc: cubitTest,
            //   listener: (context, state) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text('State Changes')
            //       )
            //     );
            //   },
            //   child: BlocBuilder<CubitTest, int>(
            //     bloc: cubitTest,
            //     builder: (context, state) {
            //       return Text(state.toString());
            //     },
            //   ),
            // ),
            
            // StreamBuilder(
            //   initialData: cubitTest.initialValue,
            //   stream: cubitTest.stream, 
            //   builder: (context, snapshot) {
            //     return Text(snapshot.data.toString());
            //   },
            // ),
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
      ),
    );
  }
}