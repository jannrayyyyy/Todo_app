import 'package:flutter/material.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';

class TaskCardWidget extends StatefulWidget {
  final TodoEntity e;
  const TaskCardWidget({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: widget.e.title, weight: FontWeight.bold, size: 25),
          CustomText(text: widget.e.content)
        ],
      ),
    );
  }
}
