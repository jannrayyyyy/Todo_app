// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/theme/theme_provider.dart';

// ignore: must_be_immutable
class SyncDatePicker extends StatefulWidget {
  Object? range;
  final bool? showActionButton;
  final Function()? onCancel;
  final DateRangePickerController? controller;
  final dynamic Function(Object?)? function;
  final Function(DateRangePickerSelectionChangedArgs)? onselectionChanged;
  SyncDatePicker({
    Key? key,
    this.range,
    this.function,
    this.controller,
    this.onCancel,
    this.onselectionChanged,
    this.showActionButton,
  }) : super(key: key);

  @override
  State<SyncDatePicker> createState() => _SyncDatePickerState();
}

class _SyncDatePickerState extends State<SyncDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(6),
        child: SfDateRangePicker(
          onSelectionChanged: widget.onselectionChanged,
          selectionMode: DateRangePickerSelectionMode.range,
          controller: widget.controller,
          showActionButtons: widget.showActionButton!,
          view: DateRangePickerView.month,
          monthViewSettings: const DateRangePickerMonthViewSettings(
            showTrailingAndLeadingDates: true,
          ),
          monthCellStyle: DateRangePickerMonthCellStyle(
            blackoutDatesDecoration: BoxDecoration(
                color: Colors.red.shade300,
                border: Border.all(color: const Color(0xFFF44436), width: 1),
                shape: BoxShape.circle),
            blackoutDateTextStyle: const TextStyle(
                color: Colors.white, decoration: TextDecoration.lineThrough),
          ),
          selectionColor: provider.currentTheme == 'dark'
              ? Colors.blue
              : Colors.purple.shade200,
          rangeSelectionColor: provider.currentTheme == 'dark'
              ? Colors.blue
              : Colors.purple.shade200,
          todayHighlightColor: provider.currentTheme == 'dark'
              ? Colors.blue
              : Colors.purple.shade200,
          startRangeSelectionColor: provider.currentTheme == 'dark'
              ? Colors.blue
              : Colors.purple.shade200,
          endRangeSelectionColor: provider.currentTheme == 'dark'
              ? Colors.blue
              : Colors.purple.shade200,
          onSubmit: widget.function,
          onCancel: widget.onCancel,
        ),
      );
    });
  }
}
