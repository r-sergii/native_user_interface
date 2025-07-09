import 'package:flutter/cupertino.dart';

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoScaffold"),
          ),
        ],
      ),
    );
  }
}