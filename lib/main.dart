import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:procep/controller/cep_controller.dart';
import 'package:procep/view/homePage/home_seach_page.dart';
import 'package:procep/view/resultCepPage/resulty_seach_page.dart';
import 'package:procep/view/splachPage/splach_page.dart';

void main() {
  Get.put(CepController());
  runApp(const MyApp());
}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Procep',
      debugShowCheckedModeBanner: false,
      initialRoute: "/splach",
      routes: {
        "/": (context) => const HomeSeachPage(),
        "/splach": (context) => const SplachPage()
      },
    );
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      initialRoute: "/splach",
      getPages: [
        GetPage(name: '/home', page: () => const HomeSeachPage()),
        GetPage(name: '/splach', page: () => const SplachPage()),
        GetPage(name: '/result', page: () => const ResultySeachPage()),
      ],
    );
  }
}
