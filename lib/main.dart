import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/theme/theme_provider.dart';
import 'package:todo/presentation/cubit/authentication/authentication_cubit.dart';
import 'package:todo/presentation/screens/authentication/auth_manager.dart';
import 'dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationCubit>(
                create: (context) => sl<AuthenticationCubit>()..userCheck(),
              ),
            ],
            child: const AuthManager(),
          ),
        );
      },
    );
  }
}
