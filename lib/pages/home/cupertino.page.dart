import 'package:flutter/cupertino.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'sidemenu/sidemenu.service.dart';
import '../tabs/cupertino.page.dart';
import 'sidemenu/cupertino.widget.dart';

import '/views/listtile/cupertino.view.dart';
import '/views/datepicker/cupertino.view.dart';
import '/views/scaffold/cupertino.view.dart';
import '/views/slider/cupertino.view.dart';
import '/views/progressindicator/cupertino.view.dart';
import '/views/alertdialog/cupertino.view.dart';
import '/views/navigationbar/cupertino.view.dart';
import '/views/textfield/cupertino.view.dart';
import '/views/switch/cupertino.view.dart';
import '/views/button/cupertino.view.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SideMenuService>(context, listen: false);
    final navigator = Navigator.of(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: const Icon(CupertinoIcons.bars), //ellipsis_vertical),
          onPressed: () {
            // if (state.widthSideMenu.value > 0) {
            //   state.widthSideMenu.value = 0;
            // } else {
            //   state.widthSideMenu.value = 200;
            // }
            state.change();
            // navigator.push(CupertinoPageRoute(builder: (BuildContext context) => const TabsPage()));
          },
        ),
        middle: Text(title),
        trailing: CupertinoButton(
          child: const Icon(CupertinoIcons.arrow_left_right_square_fill),
          onPressed: () {
            // final navigator = Navigator.of(context);
            // navigator.pushNamed(Routes.medalsTeam);
            navigator.push(CupertinoPageRoute(builder: (BuildContext context) => const TabsPage()));
          },
        ),
      ),
      // child: const Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //     ],
      //   ),
      // ),
      child: ValueListenableBuilder<double>(
        valueListenable: state.widthSideMenu,
        builder: (_, mode, __) {
          return Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Text(
              //         'You have pushed the button this many times:',
              //       ),
              //     ],
              //   ),
              // )
              SideMenu(state: state),
              // Container(
              //   color: CupertinoColors.lightBackgroundGray,
              //   width: state.widthSideMenu.value,
              //   child: ListView(children: const [
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Row(children: [
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Icon(
              //         FontAwesomeIcons.apple,
              //         size: 48,
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Text("Native UI", style: TextStyle(fontSize: 26))
              //     ]),
              //     SizedBox(
              //       height: 30,
              //     ),
              //     CupertinoListTile(
              //       title: Text("Button"),
              //       leading: Icon(CupertinoIcons.app),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Switch"),
              //       leading: Icon(CupertinoIcons.arrow_right_arrow_left_square),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Text Field"),
              //       leading: Icon(CupertinoIcons.textbox),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Navigation Bar"),
              //       leading: Icon(CupertinoIcons.arrow_left_right_square),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Dialog"),
              //       leading: Icon(CupertinoIcons.text_bubble),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Slider"),
              //       leading: Icon(CupertinoIcons.arrow_up_down_square),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Segmented Control (Tab)"),
              //       leading: Icon(CupertinoIcons.textbox),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Progress Indicator"),
              //       leading: Icon(CupertinoIcons.slider_horizontal_below_rectangle),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Date Picker"),
              //       leading: Icon(CupertinoIcons.calendar_today),
              //     ),
              //     CupertinoListTile(
              //       title: Text("Scaffold"),
              //       leading: Icon(CupertinoIcons.archivebox),
              //     )
              //   ]),
              // ),
              Expanded(
                  child: ValueListenableBuilder<int>(
                      valueListenable: state.selectedIndex,
                      builder: (_, mode, __) {
                        return getView(state.selectedIndex.value);
                      })
                  //     child: Center(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Text(
                  //         'You have pushed the button this many times:',
                  //       ),
                  //     ],
                  //   ),
                  // )
                  )
            ],
          );
        },
      ),
    );
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
