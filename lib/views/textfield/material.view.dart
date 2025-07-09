import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/main/main.service.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MainService>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("TextField"),
          SizedBox(
            width: 250,
            child: TextField(
              controller: state.textController,
              // obscureText: true,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
            ),
          )
        ],
      ),
    );
  }
}
