import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../tabs/cupertino.page.dart';
import 'sidemenu.service.dart';

class SideMenu extends StatelessWidget {
  final SideMenuService state;
  const SideMenu({super.key, required this.state});

  getFullListItem(BuildContext context) {
    final navigator = Navigator.of(context);
    final fullListItem = [
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 0;
        },
        child: const CupertinoListTile(
          title: Text("Button"),
          leading: Icon(CupertinoIcons.app),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 1;
        },
        child: const CupertinoListTile(
          title: Text("Switch"),
          leading: Icon(CupertinoIcons.arrow_right_arrow_left_square),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 2;
        },
        child: const CupertinoListTile(
          title: Text("Text Field"),
          leading: Icon(CupertinoIcons.textbox),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 3;
        },
        child: const CupertinoListTile(
          title: Text("Navigation Bar"),
          leading: Icon(CupertinoIcons.arrow_left_right_square),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 4;
        },
        child: const CupertinoListTile(
          title: Text("Dialog"),
          leading: Icon(CupertinoIcons.text_bubble),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 5;
        },
        child: const CupertinoListTile(
          title: Text("Slider"),
          leading: Icon(CupertinoIcons.slider_horizontal_below_rectangle),
        ),
      ),
      GestureDetector(
        onTap: () {
          navigator.push(CupertinoPageRoute(builder: (BuildContext context) => const TabsPage()));
        },
        child: const CupertinoListTile(
          title: Text("Segmented Control (TabBar)"),
          leading: Icon(CupertinoIcons.arrow_left_right_square_fill),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 7;
        },
        child: const CupertinoListTile(
          title: Text("Progress Indicator"),
          leading: Icon(CupertinoIcons.timelapse),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 8;
        },
        child: const CupertinoListTile(
          title: Text("Date Picker"),
          leading: Icon(CupertinoIcons.calendar_today),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 9;
        },
        child: const CupertinoListTile(
          title: Text("Scaffold"),
          leading: Icon(CupertinoIcons.archivebox),
        ),
      ),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 10;
        },
        child: const CupertinoListTile(
          title: Text("ListTile"),
          leading: Icon(CupertinoIcons.creditcard),
        ),
      )
    ];
    return fullListItem;
  }

  getShortListItem(BuildContext context) {
    final navigator = Navigator.of(context);
    final shortListItem = [
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 0;
        },
        child: const Icon(CupertinoIcons.app),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 1;
        },
        child: const Icon(CupertinoIcons.arrow_right_arrow_left_square),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 2;
        },
        child: const Icon(CupertinoIcons.textbox),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 3;
        },
        child: const Icon(CupertinoIcons.arrow_left_right_square),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 4;
        },
        child: const Icon(CupertinoIcons.text_bubble),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 5;
        },
        child: const Icon(CupertinoIcons.slider_horizontal_below_rectangle),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          navigator.push(CupertinoPageRoute(builder: (BuildContext context) => const TabsPage()));
        },
        child: const Icon(CupertinoIcons.arrow_left_right_square_fill),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 7;
        },
        child: const Icon(CupertinoIcons.slider_horizontal_below_rectangle),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 8;
        },
        child: const Icon(CupertinoIcons.calendar_today),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 9;
        },
        child: const Icon(CupertinoIcons.archivebox),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          state.selectedIndex.value = 10;
        },
        child: const Icon(CupertinoIcons.creditcard),
      )
    ];
    return shortListItem;
  }

  getListItem(BuildContext context) {
    if (state.widthSideMenu.value == 200) {
      return getFullListItem(context);
    } else if (state.widthSideMenu.value == 70) {
      return getShortListItem(context);
    } else {
      return [];
    }
  }

  getTitle() {
    if (state.widthSideMenu.value == 200) {
      return const Text("Native UI", style: TextStyle(fontSize: 26));
    } else {
      return const SizedBox.shrink();
    }
  }

  getVersion() {
    if (state.widthSideMenu.value == 200) {
      return const Row(children: [SizedBox(width: 20), Text("Version 0.0.1", style: TextStyle(fontSize: 14))]);
    } else {
      return const SizedBox.shrink();
    }
  }

  getSize() {
    if (state.widthSideMenu.value == 200) {
      return const SizedBox(width: 20);
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: state.widthSideMenu,
      builder: (_, mode, __) {
        return Container(
          color: CupertinoColors.lightBackgroundGray,
          width: state.widthSideMenu.value,
          child: ListView(children: [
            const SizedBox(height: 20),
            Row(children: [
              const SizedBox(width: 10),
              const Icon(FontAwesomeIcons.apple, size: 48),
              getSize(),
              // SizedBox(
              //   width: 20,
              // ),
              getTitle(),
              // Text("Native UI", style: TextStyle(fontSize: 26))
            ]),
            const SizedBox(
              height: 10,
            ),
            getVersion(),
            const SizedBox(
              height: 30,
            ),
            ...getListItem(context)
            // CupertinoListTile(
            //   title: Text("Button"),
            //   leading: Icon(CupertinoIcons.app),
            // ),
            // CupertinoListTile(
            //   title: Text("Switch"),
            //   leading: Icon(CupertinoIcons.arrow_right_arrow_left_square),
            // ),
            // CupertinoListTile(
            //   title: Text("Text Field"),
            //   leading: Icon(CupertinoIcons.textbox),
            // ),
            // CupertinoListTile(
            //   title: Text("Navigation Bar"),
            //   leading: Icon(CupertinoIcons.arrow_left_right_square),
            // ),
            // CupertinoListTile(
            //   title: Text("Dialog"),
            //   leading: Icon(CupertinoIcons.text_bubble),
            // ),
            // CupertinoListTile(
            //   title: Text("Slider"),
            //   leading: Icon(CupertinoIcons.arrow_up_down_square),
            // ),
            // CupertinoListTile(
            //   title: Text("Segmented Control (Tab)"),
            //   leading: Icon(CupertinoIcons.textbox),
            // ),
            // CupertinoListTile(
            //   title: Text("Progress Indicator"),
            //   leading: Icon(CupertinoIcons.slider_horizontal_below_rectangle),
            // ),
            // CupertinoListTile(
            //   title: Text("Date Picker"),
            //   leading: Icon(CupertinoIcons.calendar_today),
            // ),
            // CupertinoListTile(
            //   title: Text("Scaffold"),
            //   leading: Icon(CupertinoIcons.archivebox),
            // )
          ]),
        );
      },
    );
  }
}
