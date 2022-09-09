import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/presentation/cubit/todo/todo_cubit.dart';
import 'package:todo/presentation/widgets/components/check_box_generator.dart';
import 'package:todo/presentation/widgets/components/custom_textfield.dart';

import '../widgets/components/custom_text.dart';

class AddTodoScreen extends StatefulWidget {
  final String category;
  const AddTodoScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final taskController = TextEditingController();
  final dueDateController = TextEditingController();
  bool isDone = false;
  List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'T-TASK'),
        actions: [
          IconButton(
            onPressed: () {
              final todo = TodoEntity(
                title: titleController.text,
                owner: FirebaseAuth.instance.currentUser!.email.toString(),
                content: contentController.text,
                tasks: tasks,
                createdAt: DateTime.now().toString(),
                isFinished: isDone,
              );

              context.read<TodoCubit>().addTodo(todo);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(children: [
        CustomTextFormField(text: titleController, hint: 'Title'),
        CustomTextFormField(text: contentController, hint: 'Content'),
        Expanded(
            child: CheckBoxGenerator(
          tasks: tasks,
          isDone: isDone,
          controller: dueDateController,
          function: (bool? value) {
            isDone = value!;
          },
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                  child: CustomTextField(
                      controller: taskController, hint: 'Add tasks')),
              IconButton(
                  onPressed: () {
                    setState(() {
                      tasks.add(taskController.text);
                    });
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ]),
    );
  }
}
