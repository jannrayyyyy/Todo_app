import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/datasource/remote_datasource.dart';
import 'package:todo/data/model/todo_model.dart';
import 'package:todo/data/model/user_model.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/user_entity.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remote;
  RepositoryImpl(this.remote);
  @override
  Future<void> signIn(String email, String password) async {
    await remote.signIn(email, password);
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await remote.signUp(UserModel.fromEntity(user));
  }

  @override
  Stream<User?> userState() => remote.userState();

  @override
  Future<void> signOut() async {
    await remote.signOut();
  }

  @override
  Future<void> addTodo(TodoEntity todo) async {
    await remote.addTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> deleteTodo(String uid) async {
    await remote.deleteTodo(uid);
  }

  @override
  Stream<List<TodoEntity>> getTodo() {
    try {
      return remote.getTodo();
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(TodoEntity todo, String uid) async {
    await remote.updateTodo(TodoModel.fromEntity(todo), uid);
  }
}
