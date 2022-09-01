import 'package:todo/domain/repository/repository.dart';

class SignOut {
  final Repository repo;
  SignOut({required this.repo});
  Future<void> call() async {
    await repo.signOut();
  }
}
