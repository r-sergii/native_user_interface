import 'package:fluent_ui/fluent_ui.dart';
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
          const Text("TextField"),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextBox(controller: state.textController),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: InfoLabel(
              label: 'Enter your name:',
              child: const TextBox(
                placeholder: 'Name',
                expands: false,
              ),
            ),
          ),
          // SizedBox(
          //   width: 250,
          //   child: TextField(
          //     controller: state.textController,
          //     // obscureText: true,
          //     decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
          //   ),
          // )
        ],
      ),
    );
  }
}
