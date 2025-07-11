import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../pages/home/home.service.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeService>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoTextField"),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: state.switchValue,
            builder: (_, mode, __) {
              return CupertinoTextField(controller: state.textController);
            },
          ),
        ],
      ),
    );
  }
}
