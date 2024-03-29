import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:movie_app/layout/home.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'Splash Screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      backgroundColor: Color(0xff1E1E1E),
      nextScreen: HomeScreen(),
      duration: Duration(seconds: 3),
      splashScreenBody: SizedBox(
        child: Image.asset("assets/images/splash.png",
          height: double.infinity,
          width: double.infinity,)
        ),
    );
  }
}
