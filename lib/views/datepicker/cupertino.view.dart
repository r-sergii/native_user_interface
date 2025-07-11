import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../pages/home/home.service.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView({super.key});

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(top: false, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeService>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoDatePicker"),
          ),
          _DatePickerItem(
            children: <Widget>[
              const Text('Date'),
              ValueListenableBuilder<DateTime>(
                  valueListenable: state.date,
                  builder: (_, mode, __) {
                    return CupertinoButton(
                      // Display a CupertinoDatePicker in date picker mode.
                      onPressed: () => _showDialog(
                        context,
                        CupertinoDatePicker(
                          initialDateTime: state.date.value,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          // This shows day of week alongside day of month
                          showDayOfWeek: true,
                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            state.date.value = newDate;
                          },
                        ),
                      ),
                      // In this example, the date is formatted manually. You can
                      // use the intl package to format the value based on the
                      // user's locale settings.
                      child: Text(
                        '${state.date.value.month}-${state.date.value.day}-${state.date.value.year}',
                        style: const TextStyle(fontSize: 13.0), //22.0),
                      ),
                    );
                  }),
            ],
          ),
          _DatePickerItem(
            children: <Widget>[
              const Text('Time'),
              ValueListenableBuilder<DateTime>(
                  valueListenable: state.time,
                  builder: (_, mode, __) {
                    return CupertinoButton(
                      // Display a CupertinoDatePicker in time picker mode.
                      onPressed: () => _showDialog(
                        context,
                        CupertinoDatePicker(
                          initialDateTime: state.time.value,
                          mode: CupertinoDatePickerMode.time,
                          use24hFormat: true,
                          // This is called when the user changes the time.
                          onDateTimeChanged: (DateTime newTime) {
                            state.time.value = newTime;
                          },
                        ),
                      ),
                      // In this example, the time value is formatted manually.
                      // You can use the intl package to format the value based on
                      // the user's locale settings.
                      child: Text(
                        '${state.time.value.hour}:${state.time.value.minute}',
                        style: const TextStyle(fontSize: 13.0), //22.0),
                      ),
                    );
                  }),
            ],
          ),
          _DatePickerItem(
            children: <Widget>[
              const Text('DateTime'),
              ValueListenableBuilder<DateTime>(
                  valueListenable: state.dateTime,
                  builder: (_, mode, __) {
                    return CupertinoButton(
                      // Display a CupertinoDatePicker in dateTime picker mode.
                      onPressed: () => _showDialog(
                        context,
                        CupertinoDatePicker(
                          initialDateTime: state.dateTime.value,
                          use24hFormat: true,
                          // This is called when the user changes the dateTime.
                          onDateTimeChanged: (DateTime newDateTime) {
                            state.dateTime.value = newDateTime;
                          },
                        ),
                      ),
                      // In this example, the time value is formatted manually. You
                      // can use the intl package to format the value based on the
                      // user's locale settings.
                      child: Text(
                        '${state.dateTime.value.month}-${state.dateTime.value.day}-${state.dateTime.value.year} ${state.dateTime.value.hour}:${state.dateTime.value.minute}',
                        style: const TextStyle(fontSize: 13.0), //22.0),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0.0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0), //16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children),
      ),
    );
  }
}
