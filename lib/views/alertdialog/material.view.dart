import 'package:flutter/material.dart';

class AlertDialogView extends StatelessWidget {
  const AlertDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("AlertDialog"),
        ],
      ),
    );
  }
}