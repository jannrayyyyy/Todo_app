import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  String? uid;
  final String owner;
  final String title;
  final String content;
  final String tasks;
  final String createdAt;
  String? dateRange;
  bool isFinished;

  TodoEntity({
    this.uid,
    this.dateRange,
    required this.title,
    required this.owner,
    required this.content,
    required this.tasks,
    required this.createdAt,
    required this.isFinished,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
