import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tabs/matrrial.page.dart';
import 'main.drawer.dart';
import 'sidemenu.service.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MainPage extends StatelessWidget {
  final String title;
  const MainPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SideMenuService>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // leading: ,
          title: Text(title),
          actions: [
            IconButton(
              icon: const Icon(Icons.table_chart_outlined),
              onPressed: () {
                final navigator = Navigator.of(context);
                navigator.push(MaterialPageRoute(builder: (BuildContext context) => const TabsPage()));
              },
            ),
          ],
        ),
        drawer: MainDrawer(drawerKey: _drawerKey, state: state),
        // body: const Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Text(
        //         'You have pushed the button this many times:',
        //       ),
        //     ],
        //   ),
        // ),
        body: ValueListenableBuilder<int>(
            valueListenable: state.selectedIndex,
            builder: (_, mode, __) {
              return state.getView();
            }));
  }
}
