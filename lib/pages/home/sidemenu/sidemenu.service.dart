// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuService extends ChangeNotifier {
  final selectedIndex = ValueNotifier<int>(0);
  final widthSideMenu = ValueNotifier<double>(0);

  change() {
    if (widthSideMenu.value == 0) {
      widthSideMenu.value = 200;
    } else if (widthSideMenu.value == 200) {
      widthSideMenu.value = 70;
    } else {
      widthSideMenu.value = 0;
    }
  }

  // getView() {
  //   switch (selectedIndex.value) {
  //     case 0:
  //       return const ButtonView();
  //     case 1:
  //       return const SwitchView();
  //     case 2:
  //       return const TextFieldView();
  //     case 3:
  //       return const NavigationBarView();
  //     case 4:
  //       return const AlertDialogView();
  //     case 5:
  //       return const SliderView();
  //     case 7:
  //       return const ProgressIndicatorView();
  //     case 8:
  //       return const DatePickerView();
  //     case 9:
  //       return const ScaffoldView();
  //     case 10:
  //       return const ListTileView();
  //   }
  // }
}
