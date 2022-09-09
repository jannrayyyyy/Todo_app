import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';
import 'package:todo/presentation/widgets/components/custom_textfield.dart';

class CheckBoxGenerator extends StatefulWidget {
  final bool isDone;
  final void Function(bool?)? function;
  final String? text;
  final List tasks;
  final TextEditingController controller;
  const CheckBoxGenerator(
      {Key? key,
      required this.isDone,
      this.function,
      this.text,
      required this.tasks,
      required this.controller})
      : super(key: key);

  @override
  State<CheckBoxGenerator> createState() => _CheckBoxGeneratorState();
}

class _CheckBoxGeneratorState extends State<CheckBoxGenerator> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(value: widget.isDone, onChanged: widget.function),
                  CustomText(text: widget.tasks[index] ?? 'Unnamed task')
                ],
              ),
              CustomTaskFormFIeld(
                controller: widget.controller,
                hint: 'Due Date',
                suffixIcon: const Icon(Icons.date_range),
              ),
            ],
          );
        }));
  }
}
