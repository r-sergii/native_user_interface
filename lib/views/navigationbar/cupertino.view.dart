import 'package:flutter/cupertino.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoNavigationBar"),
          ),
        ],
      ),
    );
  }
}