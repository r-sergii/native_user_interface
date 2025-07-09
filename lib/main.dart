// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/main/material.page.dart';
// import 'pages/main/cupertino.page.dart';
import 'pages/main/main.service.dart';
import 'pages/main/sidemenu.service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainService()),
        ChangeNotifierProvider(create: (context) => SideMenuService()),
      ],
      // return
      child: MaterialApp(
        title: 'Flutter Native User Interface',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(title: 'Material Widgets'),
      ),
      // return
      // child: const CupertinoApp(
      //   title: 'Flutter Native User Interface',
      //   theme: CupertinoThemeData(primaryColor: CupertinoColors.systemGrey, brightness: Brightness.light
      //       // barBackgroundColor: CupertinoColors.white,
      //       ),
      //   home: MainPage(title: 'Cupertino Widgets'),
      //   debugShowCheckedModeBanner: false,
      // ),
    );
  }
}
