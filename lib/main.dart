import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitTest extends Cubit<int> {
  CubitTest() : super(0);

  void add() => emit(state + 1);
}


void main() {
  runApp(BlocTest());
}

class BlocTest extends StatelessWidget {
  const BlocTest({super.key});



  @override
  Widget build(BuildContext context) {
  CubitTest cubitTest = CubitTest();
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: cubitTest.stream, 
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
          ),
          ElevatedButton(
            onPressed: () {
              cubitTest.add();
            }, 
            child: Text('Tambah')
          )
        ],
      ),
    );
  }
}