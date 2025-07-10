import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../pages/main/main.service.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MainService>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Date Picker"),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder<DateTime>(
              valueListenable: state.date,
              builder: (_, mode, __) {
                return DatePicker(
                    header: 'Pick a date',
                    selected: state.date.value,
                    onChanged: (time) {
                      state.date.value = time;
                    });
              }),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder<DateTime>(
            valueListenable: state.dateTime,
            builder: (_, mode, __) {
              return DatePicker(
                selected: state.dateTime.value,
                onChanged: (time) {
                  state.dateTime.value = time;
                },
                showYear: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
