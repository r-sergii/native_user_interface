import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: Colors.grey[300],
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );

    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            );
          }
          return null;
        },
      ),
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Buttons"),
          const SizedBox(height: 20),
          const Text('TextButton'),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) return Colors.blue.withOpacity(0.04);
                  if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
                    return Colors.blue.withOpacity(0.12);
                  }
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {},
            child: const Text('TextButton'),
          ),
          const SizedBox(height: 20),
          const Text("ElevatedButton"),
          ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {},
            child: const Text('Looks like a RaisedButton'),
          ),
          const SizedBox(height: 20),
          const Text("OutlinedButton"),
          OutlinedButton(
            style: outlineButtonStyle,
            onPressed: () {},
            child: const Text('Looks like an OutlineButton'),
          )
        ],
      ),
    );
  }
}
