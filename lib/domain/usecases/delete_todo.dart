import 'package:todo/domain/repository/repository.dart';

class DeleteTodo {
  final Repository repo;
  DeleteTodo({required this.repo});
  Future<void> call(String uid, Function function) async {
    await repo.deleteTodo(uid, function);
  }
}
