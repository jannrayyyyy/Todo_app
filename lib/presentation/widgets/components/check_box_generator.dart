import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/components/custom_text.dart';

class CheckBoxGenerator extends StatelessWidget {
  final bool isDone;
  final void Function(bool?)? function;
  final String? text;
  const CheckBoxGenerator(
      {Key? key, required this.isDone, this.function, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: isDone, onChanged: function),
        CustomText(text: text ?? 'Unnamed task')
      ],
    );
  }
}
