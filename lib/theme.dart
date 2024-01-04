import 'package:final_project/constants/sizes.dart';
import 'package:flutter/material.dart';

ThemeData lightMode(context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue.shade100,
    textTheme: Typography.blackMountainView,
    sliderTheme: SliderThemeData(
      thumbColor: Colors.lightBlue.shade100,
      activeTrackColor: Colors.lightBlue.shade100,
      inactiveTrackColor: Colors.lightBlue.shade50,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.lightBlue.shade100,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontSize: Sizes.size20,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
    ),
  );
}

ThemeData darkMode(context) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue.shade900,
    textTheme: Typography.whiteMountainView,
    sliderTheme: SliderThemeData(
      thumbColor: Colors.lightBlue.shade800,
      activeTrackColor: Colors.lightBlue.shade800,
      inactiveTrackColor: Colors.lightBlue.shade900,
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(
      color: Colors.lightBlue.shade900,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontSize: Sizes.size20,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
    ),
  );
}
