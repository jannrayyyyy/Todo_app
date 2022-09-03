import 'package:todo/domain/entities/todo_entity.dart';

// ignore: must_be_immutable
class TodoModel extends TodoEntity {
  TodoModel({
    super.uid,
    super.task,
    required super.owner,
    required super.title,
    required super.content,
    required super.createdAt,
    required super.isFInished,
  });

  factory TodoModel.fromEntity(TodoEntity todo) {
    return TodoModel(
      uid: todo.uid,
      task: todo.task,
      owner: todo.owner,
      title: todo.title,
      content: todo.content,
      createdAt: todo.createdAt,
      isFInished: todo.isFInished,
    );
  }

  factory TodoModel.fromjson(Map<String, dynamic> json) {
    return TodoModel(
      uid: json['uid'],
      task: json['task'],
      owner: json['owner'],
      title: json['title'],
      content: json['çontent'],
      createdAt: json['createdAt'],
      isFInished: json['isFinished'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "task": task,
        "owner": owner,
        "title": title,
        "content": content,
        "createdAt": createdAt,
        "isFinished": isFInished,
      };
}
