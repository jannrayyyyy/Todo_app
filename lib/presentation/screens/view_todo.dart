import 'package:flutter/material.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/presentation/widgets/components/check_box_generator.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';

class ViewTodoScreen extends StatefulWidget {
  final TodoEntity e;
  const ViewTodoScreen({super.key, required this.e});

  @override
  State<ViewTodoScreen> createState() => _ViewTodoScreenState();
}

class _ViewTodoScreenState extends State<ViewTodoScreen> {
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomText(
                text: widget.e.title,
                size: 40,
                weight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomText(
                text: widget.e.content,
                size: 20,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: CheckBoxGenerator(
                isDone: widget.e.isFinished,
                tasks: widget.e.tasks,
                controller: dateController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
