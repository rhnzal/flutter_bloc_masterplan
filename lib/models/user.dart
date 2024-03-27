import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}


@JsonSerializable()
class SimpleUser {
  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  SimpleUser({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt
  });

  factory SimpleUser.fromJson(Map<String, dynamic> json) => _$SimpleUserFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleUserToJson(this);
}