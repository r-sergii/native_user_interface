import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home/material.page.dart';
import 'pages/home/home.service.dart';
import 'pages/home/sidemenu/sidemenu.service.dart';

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
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => MainService()),
    //     ChangeNotifierProvider(create: (context) => SideMenuService()),
    //     // ChangeNotifierProvider(create: (context) => AppTheme()),
    //   ],
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Material Widgets'),
    );
  }
}
