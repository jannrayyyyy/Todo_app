import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repository/repository.dart';

class AddTodo {
  final Repository repo;
  AddTodo({required this.repo});
  Future<void> call(TodoEntity todo) async {
    await repo.addTodo(todo);
  }
}
