import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String)? function;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.validator,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Consumer<ThemeProvider>(builder: (context, provider, child) {
          return TextFormField(
            onFieldSubmitted: function,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.all(10),
              errorBorder: OutlineInputBorder(
                gapPadding: 1,
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                gapPadding: 1,
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 1,
                borderSide: BorderSide(
                  width: 1,
                  color: provider.currentTheme == 'dark'
                      ? Colors.white
                      : Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                gapPadding: 1,
                borderSide: BorderSide(
                  width: 1,
                  color: provider.currentTheme == 'dark'
                      ? Colors.white
                      : Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 1,
                borderSide: BorderSide(
                  width: 1,
                  color: provider.currentTheme == 'dark'
                      ? Colors.white
                      : Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        }));
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController text;
  final String hint;
  final double? size;
  final VoidCallback? function;
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.hint,
    this.size,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        onEditingComplete: function,
        enableSuggestions: true,
        controller: text,
        style: TextStyle(fontSize: size),
        decoration: InputDecoration.collapsed(
          hintText: hint,
        ),
      ),
    );
  }
}

class CustomTaskFormFIeld extends StatelessWidget {
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String hint;
  const CustomTaskFormFIeld({
    super.key,
    this.suffixIcon,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
          )),
    );
  }
}
