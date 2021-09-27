import 'package:flutter/material.dart';
import 'package:sells_app/screens/home/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1f2835),
        body: AnimatedSplashScreen(
          duration: 1500,
          splash: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          nextScreen: Login(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 200,
          backgroundColor: const Color(0xffffffff),
        ));
  }
}
