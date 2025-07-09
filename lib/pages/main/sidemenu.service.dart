// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '/views/listtile/cupertino.view.dart';
// import '/views/datepicker/cupertino.view.dart';
// import '/views/scaffold/cupertino.view.dart';
// import '/views/slider/cupertino.view.dart';
// import '/views/progressindicator/cupertino.view.dart';
// import '/views/alertdialog/cupertino.view.dart';
// import '/views/navigationbar/cupertino.view.dart';
// import '/views/textfield/cupertino.view.dart';
// import '/views/switch/cupertino.view.dart';
// import '/views/button/cupertino.view.dart';
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

  getView() {
    switch (selectedIndex.value) {
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
