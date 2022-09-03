import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain/entities/user_entity.dart';
import '../../cubit/authentication/authentication_cubit.dart';
import '../../widgets/components/custom_text.dart';
import '../../widgets/components/custom_textfield.dart';
import '../../widgets/custom/signup_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void filteredController() {
    if (emailController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      final user = UserEntity(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        username: userNameController.text,
        createdAt: DateTime.now().toString(),
      );
      context.read<AuthenticationCubit>().signup(user);
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(
        msg: "Sign Up Error!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const SignUpText(),
            CustomTextField(controller: emailController, hint: 'Email'),
            CustomTextField(controller: firstNameController, hint: 'Firstname'),
            CustomTextField(controller: lastNameController, hint: 'Lastname'),
            CustomTextField(controller: userNameController, hint: 'Username'),
            CustomTextField(controller: passwordController, hint: 'Password'),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () async {
                try {
                  filteredController();
                } on FirebaseException {
                  Fluttertoast.showToast(
                    msg: "Sign Up Error!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey.shade800,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const CustomText(
                    text: 'continue and sync contacts',
                    weight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
