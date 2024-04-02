import 'package:flutter/material.dart';
import 'package:movie_app/layout/home.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/movie_details_screen.dart';
import 'package:movie_app/screens/splashScreen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.theme,
      initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),

        },

    );
  }
}


