import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/home/home.service.dart';

class SwitchView extends StatelessWidget {
  const SwitchView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeService>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Switch"),
          ValueListenableBuilder<bool>(
              valueListenable: state.switchValue,
              builder: (_, mode, __) {
                return Switch(
                    // This bool value toggles the switch.
                    value: state.switchValue.value,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      state.switchValue.value = value;
                    });
              })
        ],
      ),
    );
  }
}
