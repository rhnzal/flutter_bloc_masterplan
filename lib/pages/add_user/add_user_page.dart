import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/bloc/add_user_bloc/add_user_bloc.dart';
import 'package:flutter_bloc_test/bloc/add_user_bloc/add_user_event.dart';
import 'package:flutter_bloc_test/bloc/add_user_bloc/add_user_state.dart';
import 'package:flutter_bloc_test/bloc/export.dart';
import 'package:flutter_bloc_test/models/user.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    jobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var addUserBloc = context.read<AddUserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                )
              ),
            ),
            
            const SizedBox(height: 20,),
            
            TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent)
                )
              ),
            ),

            const SizedBox(height: 64,),

            ElevatedButton(
              onPressed: () {
                addUserBloc.add(AddButtonPressed(name: nameController.text, job: jobController.text));
              }, 
              child: const Text('add User')
            ),

            ElevatedButton(
              onPressed: () {
                addUserBloc.add(ResetButtonPressed());
                nameController.clear();
                jobController.clear();
              }, 
              child: const Text('Reset')
            ),

            BlocBuilder<AddUserBloc, AddUserState>(
              bloc: addUserBloc,
              builder: (context, state) {
                if (state is AddUserInitialState) {
                  return const Center(
                    child: Text('No Data'),
                  );

                } else if (state is AddUserLoadingState) {
                  return const CircularProgressIndicator(color: Colors.deepPurpleAccent);


                } else if (state is AddUserSuccessState) {
                  return Column(
                    children: [
                      Text('Nama: ${state.user?.name ?? '-'}'),
                      Text('Job: ${state.user?.job ?? '-'}'),
                    ],
                  );

                } else {
                  return const Center(child: Text('Gagal mengirim data'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}