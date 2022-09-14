import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';

import '../../../core/theme/theme_provider.dart';

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
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: widget.e.title,
              weight: FontWeight.bold,
              size: 25,
              maxLine: 1,
              overFlow: TextOverflow.fade,
            ),
            CustomText(
              text: widget.e.content,
              maxLine: 1,
              overFlow: TextOverflow.ellipsis,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 7),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: provider.currentTheme == 'dark'
                      ? Colors.grey.shade700.withOpacity(0.5)
                      : Colors.grey.shade300.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: widget.e.tasks,
                      maxLine: 2,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: widget.e.isFinished == false
                          ? const Icon(Icons.close, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green))
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
