import 'package:flutter/material.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("showDatePicker"),
        ],
      ),
    );
  }
}