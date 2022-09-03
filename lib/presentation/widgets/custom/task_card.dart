import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';

class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({Key? key}) : super(key: key);

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomText(text: 'Get Started', weight: FontWeight.bold, size: 25),
          CustomText(
              text:
                  'Hello User! Welcome to T-TASK. this is a default task that you can edit or delete to start using the app')
        ],
      ),
    );
  }
}
