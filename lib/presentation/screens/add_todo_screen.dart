import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/components/check_box_generator.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';

import '../widgets/components/custom_textfield.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final taskController = TextEditingController();
  String text = '';
  final bool isDone = false;
  int task = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   title: const CustomText(text: 'T-TASK'),
        // ),
        // body: Column(
        //   children: [
        //     ListView.builder(
        //         itemCount: task,
        //         itemBuilder: ((context, index) {
        //           return CheckBoxGenerator(
        //             isDone: isDone,
        //             function: (bool? value) {},
        //             text: taskController.text,
        //           );
        //         })),
        //     Expanded(
        //       child: Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(8),
        //             child: CustomTextField(
        //               controller: taskController,
        //               hint: 'To-do',
        //             ),
        //           ),
        //           IconButton(
        //               onPressed: () {
        //                 task = task + 1;
        //               },
        //               icon: const Icon(Icons.check))
        //         ],
        //       ),
        //     )
        //   ],
        // ),

        //  Container(
        //   height: 300,
        //   width: 300,
        //   padding: const EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       CustomTextFormField(
        //         text: titleController,
        //         hint: 'TITLE',
        //         size: 30,
        //       ),
        //       CustomTextFormField(
        //         text: contentController,
        //         hint: 'Content',
        //         size: 18,
        //       ),
        //       const Divider(color: Colors.grey),

        //     ],
        //   ),
        // ),
        );
  }
}
