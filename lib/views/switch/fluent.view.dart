import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../pages/main/main.service.dart';

class SwitchView extends StatelessWidget {
  const SwitchView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MainService>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Switch"),
          ValueListenableBuilder<bool>(
            valueListenable: state.checked,
            builder: (_, mode, __) {
              return ToggleSwitch(
                checked: state.checked.value,
                onChanged: (v) {
                  state.checked.value = v;
                },
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: state.checked,
            builder: (_, mode, __) {
              // return ToggleSwitch(
              //   checked: state.checked.value,
              //   onChanged: (v) {
              //     state.checked.value = v;
              //   },
              //   content: Text(state.checked.value ? 'Working' : 'Do work'),
              // );
              return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InfoLabel(
                  label: 'Header',
                  child: ToggleSwitch(
                    checked: state.checked.value,
                    onChanged: (v) {
                      state.checked.value = v;
                    },
                    content: Text(state.checked.value ? 'Working' : 'Do work'),
                  ),
                ),
                if (state.checked.value)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProgressRing(),
                  )
              ]);
            },
          ),
        ],
      ),
    );
  }
}
