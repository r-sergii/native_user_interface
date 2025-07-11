// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart'; //  hide Page;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
// Fluent part
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';

import 'theme.fluent.dart';
// import 'pages/main/material.page.dart';
// import 'pages/main/cupertino.page.dart';
import 'pages/home/fluent.page.dart';
import 'pages/home/home.service.dart';
import 'pages/home/sidemenu/sidemenu.service.dart';

// Fluent part
/// Checks if the current environment is a desktop environment.
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

//////
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if it's not on the web, windows or android, load the accent color
  if (!kIsWeb &&
      [
        TargetPlatform.windows,
        TargetPlatform.android,
      ].contains(defaultTargetPlatform)) {
    SystemTheme.accentColor.load();
  }

  if (isDesktop) {
    await flutter_acrylic.Window.initialize();
    await flutter_acrylic.Window.hideWindowControls();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      await windowManager.setMinimumSize(const Size(500, 600));
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }

  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeService()),
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => MainService()),
    //     ChangeNotifierProvider(create: (context) => SideMenuService()),
    //     // ChangeNotifierProvider(create: (context) => AppTheme()),
    //   ],
    final appTheme = context.watch<AppTheme>();
    return FluentApp(
      title: appTitle,
      themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      color: appTheme.color,
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
        accentColor: appTheme.color,
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      theme: FluentThemeData(
        accentColor: appTheme.color,
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      locale: appTheme.locale,
      home: const HomePage(title: 'Fluent Widgets'),
    );
  }
}
