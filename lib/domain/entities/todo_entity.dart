import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  String? uid;
  final String owner;
  final String title;
  final String content;
  final List? task;
  final String createdAt;
  final bool isFInished;
  TodoEntity({
    this.uid,
    this.task,
    required this.title,
    required this.owner,
    required this.content,
    required this.createdAt,
    required this.isFInished,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
