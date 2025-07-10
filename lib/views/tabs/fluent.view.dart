import 'package:fluent_ui/fluent_ui.dart';

class TabBarView extends StatelessWidget {
  const TabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("TabBar"),
        ],
      ),
    );
  }
}