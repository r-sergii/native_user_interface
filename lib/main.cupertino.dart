import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'pages/home/cupertino.page.dart';
import 'pages/home/home.service.dart';
import 'pages/home/sidemenu.service.dart';

//////
///
void main() async {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeService()),
        ChangeNotifierProvider(create: (context) => SideMenuService()),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeService()),
        ChangeNotifierProvider(create: (context) => SideMenuService()),
        // ChangeNotifierProvider(create: (context) => AppTheme()),
      ],
    // return
    child: const CupertinoApp(
      title: appTitle,
      theme: CupertinoThemeData(primaryColor: CupertinoColors.systemGrey, brightness: Brightness.light
          // barBackgroundColor: CupertinoColors.white,
          ),
      home: HomePage(title: 'Cupertino Widgets'),
      debugShowCheckedModeBanner: false,
    ));
  }
}
