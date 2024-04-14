import 'package:flutter/material.dart';

class MyThemeData{
  static const Color yellowColor = Color(0xffC6C6C6);
  static final ThemeData theme=ThemeData(
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(backgroundColor: Color(0xFF1A1A1A),
        showUnselectedLabels: true,
        selectedItemColor: Color(0xffFFBB3B),
        unselectedItemColor: Color(0xffC6C6C6),
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 30)),


    appBarTheme: AppBarTheme(
      color: Colors.transparent ,

       ),
    scaffoldBackgroundColor: Colors.transparent,
    useMaterial3: true,

  );
}