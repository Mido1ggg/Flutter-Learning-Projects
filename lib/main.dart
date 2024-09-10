import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:list_view_proj/views/onBoarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      home: AnimatedSplashScreen(
          duration: 3000,
          splashIconSize: 200,
          splash: 'assets/images/wise-wallet-logo-transparent.png',
          nextScreen: const onBoarding_screen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color(0xff125A93)),
    );
  }
}
