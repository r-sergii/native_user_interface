import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../pages/home/home.service.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeService>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Buttons"),
          const Button(
            onPressed: null,
            child: Text('Standard Button Disabled'),
          ),
          Button(
            child: const Text('Standard Button Enabled'),
            onPressed: () => debugPrint('pressed button'),
          ),
          const SizedBox(
            height: 10,
          ),
          const FilledButton(
            onPressed: null,
            child: Text('Filled Button Disabled'),
          ),
          FilledButton(
            child: const Text('Filled Button Enabled'),
            onPressed: () => debugPrint('pressed button'),
          ),
          const SizedBox(
            height: 10,
          ),
          ToggleButton(
            checked: state.checked.value,
            onChanged: null,
            child: const Text('Toggle Button Disabled'),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: state.checked,
            builder: (_, mode, __) {
              return ToggleButton(
                checked: state.checked.value,
                onChanged: (v) {
                  state.checked.value = v;
                },
                child: const Text('Toggle Button Enabled'),
              );
            },
          ),
        ],
      ),
    );
  }
}
