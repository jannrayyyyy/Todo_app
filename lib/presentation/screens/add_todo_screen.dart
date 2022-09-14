import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/presentation/cubit/todo/todo_cubit.dart';
import 'package:todo/presentation/widgets/components/checkbox.dart';
import 'package:todo/presentation/widgets/components/custom_textfield.dart';
import 'package:todo/presentation/widgets/components/sync_date_picker.dart';
import '../widgets/components/custom_text.dart';
import 'package:intl/intl.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final contentController = TextEditingController();
  final dueDateController = TextEditingController();
  bool isDone = false;
  final taskController = TextEditingController();
  final titleController = TextEditingController();

  final DateRangePickerController _datePicker = DateRangePickerController();
  Object? _range;

  @override
  void initState() {
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(text: 'T-TASK'),
          actions: [
            IconButton(
              onPressed: () async {
                final todo = TodoEntity(
                  dateRange: _range.toString(),
                  title: titleController.text,
                  owner: FirebaseAuth.instance.currentUser!.email.toString(),
                  content: contentController.text,
                  tasks: taskController.text,
                  createdAt: DateTime.now().toString(),
                  isFinished: isDone,
                );
                Navigator.pop(context);
                context
                    .read<TodoCubit>()
                    .addTodo(() async => Navigator.pop(context, true), todo);
              },
              icon: const Icon(Icons.check),
            ),
          ],
        ),
        body: Column(
          children: [
            CustomTextFormField(text: titleController, hint: 'Title'),
            CustomTextFormField(text: contentController, hint: 'Content'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CheckBoxGenerator(
                          isFinished: isDone,
                          function: (bool? value) {
                            setState(() {
                              isDone = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: CustomTextField(
                                controller: taskController, hint: 'Add tasks'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: CustomText(text: 'Selected Date Range: '),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: CustomText(
                              text: _range == null
                                  ? 'Select Date'
                                  : _range.toString(),
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SyncDatePicker(
                      onselectionChanged: _onSelectionChanged,
                      showActionButton: false,
                      controller: _datePicker,
                      onCancel: () {
                        _datePicker.selectedRanges = null;
                        setState(() {
                          _range = null;
                        });
                      },
                      range: _range,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
