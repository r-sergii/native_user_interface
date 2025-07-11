import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../tabs/matrrial.page.dart';
import 'sidemenu.service.dart';

const containerRadius = Radius.circular(30.0);

class HomeDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  final SideMenuService state;
  const HomeDrawer({Key? key, required this.drawerKey, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
        child: SizedBox(
      // color: theme.backgroundColor, //Theme.of(context).bottomAppBarColor,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Native UI",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                )),
            accountEmail: Text("version 0.0.1",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            currentAccountPicture: CircleAvatar(
              backgroundColor: theme.primaryTextTheme.headline2!.color, //Theme.of(context).bottomAppBarColor,
              child: Icon(FontAwesomeIcons.android, color: theme.primaryColor, size: 48),
            ),
            decoration: BoxDecoration(
              color: theme.primaryTextTheme.headline2!.color, //Theme.of(context).bottomAppBarColor,
              /////////////////
              borderRadius: const BorderRadius.only(bottomRight: containerRadius),
              /////////////////
            ),
          ),
          ListTile(
            title: Text("Button",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.crop_3_2, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 0;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Switch",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.switch_left, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 1;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Text Field",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.text_fields, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 2;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Navigation Bar",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.swap_horiz_sharp, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 3;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Dialog",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.ballot_outlined, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 4;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Slider",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.swipe, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 5;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Segmented Control (TabBar)",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.tab, color: theme.primaryColor),
            onTap: () async {
              final navigator = Navigator.of(context);
              navigator.push(MaterialPageRoute(builder: (BuildContext context) => const TabsPage()));
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Progress Indicator",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.rotate_right, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 7;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Date Picker",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.date_range_outlined, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 8;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("Scaffold",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.preview, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 9;
              drawerKey.currentState!.closeEndDrawer();
            },
          ),
          ListTile(
            title: Text("ListTile",
                style: TextStyle(
                  color: theme.primaryColor,
                  //  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.credit_card, color: theme.primaryColor),
            onTap: () async {
              state.selectedIndex.value = 10;
              drawerKey.currentState!.closeDrawer();
            },
          ),
        ],
      ),
    ));
  }
}
