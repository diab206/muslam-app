import 'package:flutter/material.dart';

class MyThemeData {
  static const Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static const Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        color: colorBlack,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: colorGold,
      selectedItemColor: colorBlack,
      unselectedItemColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,  // Added this line
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.transparent),
      titleTextStyle: TextStyle(
        color: Colors.transparent,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primarySwatch: Colors.blue,
    primaryColor: Colors.black,
    fontFamily: 'Nunito',
    textTheme: const TextTheme(
     bodyLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}