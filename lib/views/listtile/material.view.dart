import 'package:flutter/material.dart';

class ListTileView extends StatelessWidget {
  const ListTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("ListTile"),
          ListTile(
            title: Text("Title"),
            subtitle: Text("Sub Title"),
            leading: Icon(Icons.credit_card),
            trailing: Text("Trailing"),
            selectedColor: Colors.green,
            focusColor: Colors.orange,
          ),
          ListTile(
            title: Text("Title 2"),
            subtitle: Text("Sub Title 2"),
            leading: Icon(Icons.credit_card),
            trailing: Text("Trailing 2"),
            selectedColor: Colors.green,
            focusColor: Colors.orange,
          ),
          ListTile(
            title: Text("Title 3"),
            subtitle: Text("Sub Title 3"),
            leading: Icon(Icons.credit_card),
            trailing: Text("Trailing 3"),
            selectedColor: Colors.green,
            focusColor: Colors.orange,
            // padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
