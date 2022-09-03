import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repository/repository.dart';

class GetTodo {
  final Repository repo;
  GetTodo({required this.repo});
  Stream<List<TodoEntity>> call() {
    return repo.getTodo();
  }
}
