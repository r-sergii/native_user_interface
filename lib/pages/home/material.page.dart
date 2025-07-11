import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tabs/matrrial.page.dart';
import 'home.drawer.dart';
import 'sidemenu.service.dart';

import '/views/listtile/material.view.dart';
import '/views/datepicker/material.view.dart';
import '/views/scaffold/material.view.dart';
import '/views/slider/material.view.dart';
import '/views/progressindicator/material.view.dart';
import '/views/alertdialog/material.view.dart';
import '/views/navigationbar/material.view.dart';
import '/views/textfield/material.view.dart';
import '/views/switch/material.view.dart';
import '/views/button/material.view.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

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
              icon: const Icon(Icons.tab), //table_chart_outlined),
              onPressed: () {
                final navigator = Navigator.of(context);
                navigator.push(MaterialPageRoute(builder: (BuildContext context) => const TabsPage()));
              },
            ),
          ],
        ),
        drawer: HomeDrawer(drawerKey: _drawerKey, state: state),
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
              return getView(state.selectedIndex.value);
            }));
  }

  getView(int index) {
    switch (index) {
      case 0:
        return const ButtonView();
      case 1:
        return const SwitchView();
      case 2:
        return const TextFieldView();
      case 3:
        return const NavigationBarView();
      case 4:
        return const AlertDialogView();
      case 5:
        return const SliderView();
      case 7:
        return const ProgressIndicatorView();
      case 8:
        return const DatePickerView();
      case 9:
        return const ScaffoldView();
      case 10:
        return const ListTileView();
    }
  }
}
