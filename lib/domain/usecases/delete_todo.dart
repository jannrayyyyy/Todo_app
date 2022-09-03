import 'package:todo/domain/repository/repository.dart';

class DeleteTodo {
  final Repository repo;
  DeleteTodo({required this.repo});
  Future<void> call(String uid) async {
    await repo.deleteTodo(uid);
  }
}
