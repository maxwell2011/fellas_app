import 'package:flutter/material.dart';

class ThemeHelper {
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.lightGreen,
      scaffoldBackgroundColor: Colors.grey,
      secondaryHeaderColor: Colors.lightGreenAccent,
      brightness: Brightness.dark,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText1:
            TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
      ),
    );
  }

  static FloatingActionButtonThemeData getButtonThemeData() {
    return FloatingActionButtonThemeData(
      backgroundColor: Colors.lightGreen,
      hoverColor: Colors.green,
      splashColor: Colors.lightGreenAccent,
    );
  }

  static ElevatedButtonThemeData getElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
        shadowColor: Colors.green,
        elevation: 5,
      ),
    );
  }

  static Size getAppBarSize() {
    return Size.fromHeight(50);
  }

  static double getDrawerSize() {
    return 200;
  }

  static Container headerImage() {
    return Container(
      width: 200,
      height: 200,
      child: Image.asset('himars_o_Clock.jpg'),
    );
  }

  static Image drawerImage() {
    return Image.asset('himars_o_Clock.jpg');
  }
}
