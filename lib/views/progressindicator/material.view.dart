import 'package:flutter/material.dart';

class ProgressIndicatorView extends StatelessWidget {
  const ProgressIndicatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("CircularProgressIndicator"),
        ],
      ),
    );
  }
}