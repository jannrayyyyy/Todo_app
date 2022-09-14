import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/presentation/cubit/todo/todo_cubit.dart';
import 'package:todo/presentation/screens/add_todo_screen.dart';
import 'package:todo/presentation/screens/view_todo.dart';
import 'package:todo/presentation/widgets/custom/task_card.dart';

import '../../dependency_injection.dart';
import '../widgets/components/custom_text.dart';
import '../widgets/custom/drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<TodoCubit>().getTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: const CustomDrawer(),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoEmpty) {
            return Column(
              children: [
                const SizedBox(height: 60),
                Lottie.asset('assets/emptybox.json')
              ],
            );
          } else if (state is TodoLoaded) {
            return SingleChildScrollView(
              child: Column(
                  children: state.todo.map(
                (e) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider<TodoCubit>(
                                    create: (context) => sl<TodoCubit>(),
                                    child: ViewTodoScreen(e: e),
                                  )));
                    },
                    child: TaskCardWidget(
                      e: e,
                    ),
                  );
                },
              ).toList()),
            );
          } else {
            return Container(
              color: Colors.amber,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider<TodoCubit>(
                        create: (context) => sl<TodoCubit>()..getTodo(),
                        child: const AddTodoScreen())));
          },
          icon: const Icon(Icons.add),
          label: const CustomText(
            text: 'Add Todo',
            weight: FontWeight.w600,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
