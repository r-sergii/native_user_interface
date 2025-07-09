import 'package:flutter/cupertino.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoButton"),
          ),
          const CupertinoButton(onPressed: null, child: Text('Disabled')),
          const SizedBox(height: 30),
          const CupertinoButton.filled(onPressed: null, child: Text('Disabled')),
          const SizedBox(height: 30),
          CupertinoButton(onPressed: () {}, child: const Text('Enabled')),
          const SizedBox(height: 30),
          CupertinoButton.filled(onPressed: () {}, child: const Text('Enabled')),
        ],
      ),
    );
  }
}
