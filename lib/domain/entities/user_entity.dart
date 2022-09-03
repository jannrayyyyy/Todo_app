import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  String uid;
  String imageUrl;
  String lastLogin;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String createdAt;

  UserEntity({
    this.uid = '',
    this.imageUrl = '',
    this.username = '',
    this.lastLogin = '',
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
