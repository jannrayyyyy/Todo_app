import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/presentation/cubit/todo/todo_cubit.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';
import 'package:todo/presentation/widgets/components/sync_date_picker.dart';
import '../widgets/components/checkbox.dart';

class ViewTodoScreen extends StatefulWidget {
  final TodoEntity e;
  const ViewTodoScreen({super.key, required this.e});

  @override
  State<ViewTodoScreen> createState() => _ViewTodoScreenState();
}

class _ViewTodoScreenState extends State<ViewTodoScreen> {
  Object? _range;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<TodoCubit>().deleteTodo(
                    widget.e.uid!, () async => Navigator.pop(context, true));
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {
                final todo = TodoEntity(
                    title: widget.e.title,
                    owner: widget.e.owner,
                    content: widget.e.content,
                    tasks: widget.e.tasks,
                    createdAt: widget.e.createdAt,
                    dateRange: widget.e.dateRange,
                    isFinished: widget.e.isFinished);

                context.read<TodoCubit>().updateTodo(todo, widget.e.uid!,
                    () async => Navigator.pop(context, true));
              },
              icon: const Icon(Icons.check))
        ],
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
              padding: const EdgeInsets.all(10),
              child: CustomText(
                text: widget.e.content,
                size: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CheckBoxGenerator(
                  isFinished: widget.e.isFinished,
                  function: (bool? val) {
                    setState(() {
                      widget.e.isFinished = val!;
                    });
                  },
                ),
                CustomText(text: widget.e.tasks)
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: CustomText(text: 'Selected Date Range: '),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: CustomText(
                    text: _range == null
                        ? 'Select Date'
                        : widget.e.dateRange.toString(),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SyncDatePicker(
              showActionButton: false,
              range: widget.e.dateRange,
            )
          ],
        ),
      ),
    );
  }
}
