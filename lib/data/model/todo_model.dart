import 'package:todo/domain/entities/todo_entity.dart';

// ignore: must_be_immutable
class TodoModel extends TodoEntity {
  TodoModel({
    super.uid,
    super.dateRange,
    required super.owner,
    required super.title,
    required super.content,
    required super.tasks,
    required super.createdAt,
    required super.isFinished,
  });

  factory TodoModel.fromEntity(TodoEntity todo) {
    return TodoModel(
      uid: todo.uid,
      dateRange: todo.dateRange,
      owner: todo.owner,
      title: todo.title,
      content: todo.content,
      tasks: todo.tasks,
      createdAt: todo.createdAt,
      isFinished: todo.isFinished,
    );
  }

  factory TodoModel.fromjson(Map<String, dynamic> json) {
    return TodoModel(
      uid: json['uid'],
      dateRange: json['dateRange'],
      owner: json['owner'],
      title: json['title'],
      content: json['content'],
      tasks: json['tasks'],
      createdAt: json['createdAt'],
      isFinished: json['isFinished'],
    );
  }

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "dateRange": dateRange,
        "owner": owner,
        "title": title,
        "content": content,
        "tasks": tasks,
        "createdAt": createdAt,
        "isFinished": isFinished,
      };
}
