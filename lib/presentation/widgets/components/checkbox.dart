import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_provider.dart';

// ignore: must_be_immutable
class CheckBoxGenerator extends StatefulWidget {
  final bool isFinished;
  final Function(bool?)? function;
  const CheckBoxGenerator({super.key, required this.isFinished, this.function});

  @override
  State<CheckBoxGenerator> createState() => _CheckBoxGeneratorState();
}

class _CheckBoxGeneratorState extends State<CheckBoxGenerator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return Checkbox(
          value: widget.isFinished,
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (provider.currentTheme == 'dark') {
              if (states.contains(MaterialState.disabled)) {
                return Colors.purple.shade200;
              }
              return Colors.blue;
            } else {
              return Colors.purple.shade200;
            }
          }),
          onChanged: widget.function);
    });
  }
}
