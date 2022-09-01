import 'package:todo/domain/entities/user_entity.dart';

import '../repository/repository.dart';

class SignUp {
  final Repository repo;

  SignUp({required this.repo});

  Future<void> call(UserEntity user) async {
    repo.signUp(user);
  }
}
