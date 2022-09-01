import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/presentation/screens/authentication/signup_screen.dart';
import 'package:todo/presentation/widgets/components/carousel_login.dart';
import 'package:todo/presentation/widgets/custom/custom_text.dart';
import 'package:todo/presentation/widgets/custom/custom_textfield.dart';

import '../../../dependency_injection.dart';
import '../../cubit/authentication/authentication_cubit.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const CarouselLogin(),
              CustomTextField(controller: email, hint: 'Email'),
              CustomTextField(controller: password, hint: 'Password'),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () async {
                  try {
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      context
                          .read<AuthenticationCubit>()
                          .signin(email.text, password.text);
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Sign in Error!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey.shade800,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  } on Exception {
                    Fluttertoast.showToast(
                      msg: 'Sign in Error!',
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
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const CustomText(
                    text: 'Sign In',
                    weight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Don\'t have an account? ',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              BlocProvider<AuthenticationCubit>(
                            create: (context) => sl<AuthenticationCubit>(),
                            child: const SignUpScreen(),
                          ),
                        ),
                      );
                    },
                    child: const CustomText(
                      text: 'Sign Up.',
                      color: Colors.blue,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
