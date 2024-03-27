import 'package:equatable/equatable.dart';

class AddUserEvent {}

class AddButtonPressed extends AddUserEvent {
  final String name;
  final String job;

  AddButtonPressed({required this.name, required this.job});
}

class ResetButtonPressed extends AddUserEvent {}