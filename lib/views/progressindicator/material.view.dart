import 'package:flutter/material.dart';

class ProgressIndicatorView extends StatefulWidget {
  const ProgressIndicatorView({super.key});

  @override
  ProgressIndicatorState createState() => ProgressIndicatorState();
}

class ProgressIndicatorState extends State<ProgressIndicatorView> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))
  //     ..addListener(() {
  //       setState(() {});
  //     })
  //     ..repeat(reverse: true);
  // }

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("CircularProgressIndicator"),
          const Text('Determinate CircularProgressIndicator'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircularProgressIndicator(value: controller.value),
          ),
          const Text('Indeterminate CircularProgressIndicator'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CircularProgressIndicator(),
          ),
          Text('Circular progress indicator', style: Theme.of(context).textTheme.titleLarge),
          CircularProgressIndicator(
            value: controller.value,
            semanticsLabel: 'Circular progress indicator',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('determinate Mode', style: Theme.of(context).textTheme.titleSmall),
                ),
                Switch(
                  value: determinate,
                  onChanged: (bool value) {
                    setState(() {
                      determinate = value;
                      if (determinate) {
                        controller.stop();
                      } else {
                        controller
                          ..forward(from: controller.value)
                          ..repeat();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          const Text('Determinate LinearProgressIndicator'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(value: controller.value),
          ),
          const Text('Indeterminate LinearProgressIndicator'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
