import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/user_entity.dart';

abstract class Repository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Stream<User?> userState();
  Stream<List<TodoEntity>> getTodo();
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo, String uid);
  Future<void> deleteTodo(String uid);
}
