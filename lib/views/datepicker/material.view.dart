import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/main/main.service.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final state = Provider.of<MainService>(context, listen: false);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    state.selectedDate.value = pickedDate!;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MainService>(context, listen: false);

    return ValueListenableBuilder<DateTime>(
      valueListenable: state.selectedDate,
      builder: (_, mode, __) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("showDatePicker"),
              Text(
                state.selectedDate.value != DateTime.now()
                    ? '${state.selectedDate.value.day}/${state.selectedDate.value.month}/${state.selectedDate.value.year}'
                    : 'No date selected',
              ),
              OutlinedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text('Select Date')),
            ],
          ),
        );
      },
    );
  }
}
