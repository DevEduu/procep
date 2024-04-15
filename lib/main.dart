import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:procep/homePage/home_seach_page.dart';
import 'package:procep/splachPage/splach_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      initialRoute: "/splach",
      routes: {
        "/": (context) => const HomeSeachPage(),
        "/splach": (context) => const SplachPage()
      },
    );
  }
}
