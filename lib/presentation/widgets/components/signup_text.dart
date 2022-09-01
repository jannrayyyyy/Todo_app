import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/custom/custom_text.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Register'.toUpperCase(),
            size: 40,
            weight: FontWeight.w800,
          ),
          CustomText(
            text: 'Make your life easy!'.toUpperCase(),
            weight: FontWeight.w600,
            size: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                const CustomText(
                  text: 'Already have an account? ',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustomText(
                    text: 'Log In',
                    weight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
