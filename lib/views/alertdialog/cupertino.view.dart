import 'package:flutter/cupertino.dart';

class AlertDialogView extends StatelessWidget {
  const AlertDialogView({super.key});

  void showAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () => showAlertDialog(context),
            child: const Text("CupertinoAlertDialog"),
          ),
          CupertinoButton(
            onPressed: () => showAlertDialog(context),
            // child: const Text("CupertinoAlertDialog"),
            child: const Icon(CupertinoIcons.hand_point_left),
          ),
        ],
      ),
    );
  }
}
