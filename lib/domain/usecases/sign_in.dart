import '../repository/repository.dart';

class SignIn {
  final Repository repo;
  SignIn({required this.repo});

  Future<void> call(String email, String password) async {
    await repo.signIn(email, password);
  }
}
