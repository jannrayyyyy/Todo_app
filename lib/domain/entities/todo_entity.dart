import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  String? uid;
  final String owner;
  final String title;
  final String content;
  final List tasks;
  final String createdAt;
  final bool isFinished;
  final String? dueDate;

  TodoEntity({
    this.uid,
    required this.title,
    required this.owner,
    required this.content,
    required this.tasks,
    required this.createdAt,
    required this.isFinished,
    this.dueDate,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
