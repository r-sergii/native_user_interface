import 'package:fluent_ui/fluent_ui.dart';

class ListTileView extends StatelessWidget {
  const ListTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("ListTile"),
          SizedBox(
            width: 450,
            child: ListTile(
              title: Text("Title"),
              subtitle: Text("Sub Title"),
              leading: Icon(FluentIcons.personalize),
              trailing: Text("Trailing"),
            ),
          ),
        ],
      ),
    );
  }
}
