import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/model/todo_model.dart';

import '../model/user_model.dart';

abstract class RemoteDataSource {
  Stream<List<TodoModel>> getTodo();
  Future<void> addTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo, String uid);
  Future<void> deleteTodo(String uid);
  Future<void> signIn(String email, String password);
  Future<void> signUp(UserModel user);
  Future<void> signOut();
  Stream<User?> userState();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final auth = FirebaseAuth.instance;
  final fireF = FirebaseFirestore.instance;
  @override
  Future<void> addTodo(TodoModel todo) async {
    final docUser = FirebaseFirestore.instance.collection('todo').doc();

    await docUser.set({
      'uid': docUser.id,
      'owner': todo.owner,
      'title': todo.title,
      'content': todo.content,
      'tasks': todo.tasks,
      'createdAt': DateTime.now().toString(),
      'isFinished': todo.isFinished,
      'dueDate': todo.dueDate,
    });
  }

  @override
  Future<void> deleteTodo(String uid) async {
    final docUser = FirebaseFirestore.instance.collection('todo').doc(uid);
    docUser.delete();
  }

  @override
  Stream<List<TodoModel>> getTodo() {
    return fireF
        .collection('todo')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => TodoModel.fromjson(e.data())).toList());
  }

  @override
  Future<void> updateTodo(TodoModel todo, String uid) async {
    final docUser = FirebaseFirestore.instance.collection('todo').doc(uid);
    docUser.update({
      'uid': docUser.id,
      'owner': todo.owner,
      'title': todo.title,
      'content': todo.content,
      'tasks': todo.tasks,
      'createdAt': DateTime.now().toString(),
      'isFinished': todo.isFinished,
      'dueDate': todo.dueDate,
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signUp(UserModel user) async {
    final docUser = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    user.uid = docUser.user!.uid;
    user.imageUrl = 'https://graph.facebook.com/1271871656883523/picture';
    await fireF.collection('users').doc(docUser.user!.uid).set(user.toJson());
  }

  @override
  Stream<User?> userState() => auth.userChanges();

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
