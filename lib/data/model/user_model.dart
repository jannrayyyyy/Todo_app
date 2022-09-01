import 'package:todo/domain/entities/user_entity.dart';

//
class UserModel extends UserEntity {
  UserModel({
    super.uid = '',
    super.imageUrl = '',
    super.username = '',
    super.lastLogin = '',
    required super.email,
    required super.password,
    required super.createdAt,
    required super.firstName,
    required super.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      imageUrl: json['imageUrl'],
      username: json['username'],
      lastLogin: json['lastLogin'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt,
      imageUrl: user.imageUrl,
      lastLogin: user.lastLogin,
      firstName: user.firstName,
      lastName: user.lastName,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
        'createdAt': createdAt,
        'url': imageUrl,
        'username': username,
        'lastLogin': lastLogin,
        'firstName': firstName,
        'lastName': lastName,
      };
}
