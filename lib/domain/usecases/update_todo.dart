import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repository/repository.dart';

class UpdateTodo {
  final Repository repo;
  UpdateTodo({required this.repo});
  Future<void> call(TodoEntity todo, String uid) async {
    await repo.updateTodo(todo, uid);
  }
}
