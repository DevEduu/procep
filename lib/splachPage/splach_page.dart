import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:procep/custom_style_app.dart';
import 'package:procep/homePage/home_seach_page.dart';

class SplachPage extends StatelessWidget {
  const SplachPage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomStyleApp appStyle = CustomStyleApp();
    return MaterialApp(
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: SvgPicture.asset('assets/logo_branco.svg'),
        nextScreen: const HomeSeachPage(),
        backgroundColor: appStyle.primaryColor,
      ),
    );
  }
}
