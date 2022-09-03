import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/usecases/add_todo.dart';
import 'package:todo/domain/usecases/delete_todo.dart';
import 'package:todo/domain/usecases/get_todo.dart';
import 'package:todo/domain/usecases/update_todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final AddTodo add;
  final UpdateTodo update;
  final DeleteTodo delete;
  final GetTodo get;
  TodoCubit(
    this.add,
    this.update,
    this.delete,
    this.get,
  ) : super(TodoInitial());

  void addTodo(TodoEntity todo) async {
    emit(TodoLoading());
    await add(todo);
  }

  void updateTodo(TodoEntity todo, String uid) async {
    await update(todo, uid);
  }

  void deleteTodo(String uid) async {
    await delete(uid);
  }

  void getTodo() {
    emit(TodoLoading());
    final todo = get();
    todo.listen((event) {
      if (event.isEmpty) {
        emit(TodoEmpty());
      } else {
        emit(TodoLoaded(todo: event));
      }
    });
  }
}
