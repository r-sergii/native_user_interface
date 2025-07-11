import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';

import 'pages/home/aqua.page.dart';
import 'pages/home/sidemenu/aqua.widget.dart';
import 'pages/home/sidemenu/sidemenu.service.dart';
import 'theme.aqua.dart';

/// This method initializes macos_window_utils and styles the window.
Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

Future<void> main() async {
  if (!kIsWeb) {
    if (Platform.isMacOS) {
      await _configureMacosWindowUtils();
    }
  }

  // runApp(const MacosUIGalleryApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SideMenuService()),
        ChangeNotifierProvider(create: (context) => AppTheme()),
      ],
      child: const MyApp(),
    ),
  );
}

const String appTitle = 'Flutter Native User Interface';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => AppTheme(),
    //   builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return MacosApp(
          title: appTitle,
          theme: MacosThemeData.dark(),
          darkTheme: MacosThemeData.light(),
          // theme: MacosThemeData.light(),
          // darkTheme: MacosThemeData.dark(),
          themeMode: appTheme.mode,
          debugShowCheckedModeBanner: false,
          home: const HomePage(title: 'MacOS X Widgets'),
        );
      // },
    // );
  }
}
