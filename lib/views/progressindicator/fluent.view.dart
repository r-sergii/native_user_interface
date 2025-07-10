import 'package:fluent_ui/fluent_ui.dart';

class ProgressIndicatorView extends StatelessWidget {
  const ProgressIndicatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Progress Indicator"),

          Text('Indeterminate CircularProgressIndicator'),
// indeterminate progress bar
          ProgressBar(),

// indeterminate progress ring
          ProgressRing(),
          Text('Determinate CircularProgressIndicator'),

// determinate progress bar
          ProgressBar(value: 39),

// determinate progress ring
          ProgressRing(value: 39),
        ],
      ),
    );
  }
}
