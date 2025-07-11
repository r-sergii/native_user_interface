import 'package:flutter/cupertino.dart';
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
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoSwitch"),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: state.switchValue,
            builder: (_, mode, __) {
              return CupertinoSwitch(
                // This bool value toggles the switch.
                value: state.switchValue.value,
                // activeTrackColor: CupertinoColors.activeBlue,
                trackColor: CupertinoColors.activeBlue,
                activeColor: CupertinoColors.activeGreen,
                thumbColor: CupertinoColors.activeOrange,
                onChanged: (bool? value) {
                  state.switchValue.value = value ?? false;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
