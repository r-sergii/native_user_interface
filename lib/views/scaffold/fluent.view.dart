import 'package:fluent_ui/fluent_ui.dart';

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("NavigationView"),
        ],
      ),
    );
  }
}