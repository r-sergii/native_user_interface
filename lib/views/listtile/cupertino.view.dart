import 'package:flutter/cupertino.dart';

class ListTileView extends StatelessWidget {
  const ListTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoListTile"),
          ),
          const CupertinoListTile(
            title: Text("Title"),
            subtitle: Text("Sub Title"),
            leading: Icon(CupertinoIcons.creditcard),
            trailing: Text("Trailing"),
            backgroundColor: CupertinoColors.activeGreen,
            backgroundColorActivated: CupertinoColors.activeOrange,
          ),
          const CupertinoListTile(
            title: Text("Title 2"),
            subtitle: Text("Sub Title 2"),
            leading: Icon(CupertinoIcons.creditcard),
            trailing: Text("Trailing 2"),
            backgroundColor: CupertinoColors.activeGreen,
            backgroundColorActivated: CupertinoColors.activeOrange,
          ),
          const CupertinoListTile(
            title: Text("Title 3"),
            subtitle: Text("Sub Title 3"),
            leading: Icon(CupertinoIcons.creditcard),
            trailing: Text("Trailing 3"),
            backgroundColor: CupertinoColors.activeGreen,
            backgroundColorActivated: CupertinoColors.activeOrange,
            // padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
