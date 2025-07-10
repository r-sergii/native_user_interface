import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import '../../fluent.theme.dart';

import 'sidemenu.service.dart';
import '/views/button/fluent.view.dart';
import '/views/switch/fluent.view.dart';
import '/views/textfield/fluent.view.dart';
import '/views/alertdialog/fluent.view.dart';
import '/views/navigationbar/fluent.view.dart';
import '/views/progressindicator/fluent.view.dart';
import '/views/slider/fluent.view.dart';
import '/views/scaffold/fluent.view.dart';
import '/views/datepicker/fluent.view.dart';
import '/views/listtile/fluent.view.dart';
import '/views/tabs/fluent.view.dart';

// final viewKey = GlobalKey(debugLabel: 'Navigation View Key');

class MainPage extends StatefulWidget {
  final String title;
  const MainPage({super.key, required this.title});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    // final theme = FluentTheme.of(context);
    final state = Provider.of<SideMenuService>(context, listen: false);

    return CustomTitleBar(
      window: ValueListenableBuilder<int>(
        valueListenable: state.selectedIndex,
        builder: (_, mode, __) {
          return NavigationView(
            appBar: NavigationAppBar(
              title: Text(widget.title),
              // leading: Icon(FontAwesomeIcons.windows, color: theme.inactiveColor, size: 48),
              actions: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: ToggleSwitch(
                    content: const Text('Dark Mode'),
                    checked: FluentTheme.of(context).brightness.isDark,
                    onChanged: (v) {
                      if (v) {
                        appTheme.mode = ThemeMode.dark;
                      } else {
                        appTheme.mode = ThemeMode.light;
                      }
                    },
                  ),
                ),
                if (!kIsWeb) const WindowButtons(),
              ]),
            ),
            pane: NavigationPane(
              selected: state.selectedIndex.value,
              header: SizedBox(
                // color: appTheme.color,
                // width: 200,
                height: 100,
                child: ListView(
                  children: const [
                    SizedBox(height: 20),
                    Row(children: [
                      SizedBox(width: 10),
                      Icon(FontAwesomeIcons.windows, size: 48),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Native UI", style: TextStyle(fontSize: 26))
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      SizedBox(width: 20),
                      Text("Version 0.0.1", style: TextStyle(fontSize: 14)),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              onChanged: (index) {
                state.selectedIndex.value = index;
              },
              items: [
                PaneItem(
                  icon: const Icon(FluentIcons.field_empty),
                  title: const Text('Button'),
                  body: const ButtonView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.switch_widget),
                  title: const Text('Switch'),
                  body: const SwitchView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.text_field),
                  title: const Text('Text Field'),
                  body: const TextFieldView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.side_panel),
                  title: const Text('Navigation Bar'),
                  body: const NavigationBarView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.comment_urgent),
                  title: const Text('Dialog'),
                  body: const AlertDialogView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.slider),
                  title: const Text('Slider'),
                  body: const SliderView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.side_panel_mirrored),
                  title: const Text('Segmented Control (Tab Bar)'),
                  body: const TabBarView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.progress_ring_dots),
                  title: const Text('Progress Indicator'),
                  body: const ProgressIndicatorView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.date_time),
                  title: const Text('Date Picker'),
                  body: const DatePickerView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.event),
                  title: const Text('Scaffold'),
                  body: const ScaffoldView(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.contact_card),
                  title: const Text('ListTile'),
                  body: const ListTileView(),
                ),
              ],
            ),
            // content: NavigationBody(
            //   index: state.selectedIndex.value,
            //   children: [
            //     Center(child: Text('Добро пожаловать в Fluent UI!', style: FluentTheme.of(context).typography.body)),
            //     Center(child: Text('Настройки приложения')),
            //   ],
            // ),
          );
        },
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirm close'),
            content: const Text('Are you sure you want to close this window?'),
            actions: [
              FilledButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              Button(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class CustomTitleBar extends StatelessWidget {
  final Widget window;
  const CustomTitleBar({super.key, required this.window});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) {
        windowManager.startDragging();
      },
      child: window,
      // child: Container(
      //   height: 40,
      //   alignment: Alignment.centerLeft,
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   child: const Text(
      //     'Fluent UI Пример',
      //     style: TextStyle(fontSize: 16),
      //   ),
      // ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
